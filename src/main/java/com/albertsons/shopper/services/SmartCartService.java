package com.albertsons.shopper.services;

import com.albertsons.shopper.dto.ProductDto;
import com.albertsons.shopper.dto.SmartCartResponse;
import com.albertsons.shopper.dto.SponsoredProductDto;
import com.albertsons.shopper.model.*;
import com.albertsons.shopper.repository.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@Transactional
public class SmartCartService {

    private static final Logger log = LoggerFactory.getLogger(SmartCartService.class);

    private final SmartCartItemRepository smartCartItemRepository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    private final CustomerOrderRepository orderRepository;
    private final SponsoredProductRepository sponsoredProductRepository;
    private final CartService cartService;
    private final CartItemRepository cartItemRepository;
    private final SmartCartAiClient aiClient;

    public SmartCartService(SmartCartItemRepository smartCartItemRepository,
                            UserRepository userRepository,
                            ProductRepository productRepository,
                            CustomerOrderRepository orderRepository,
                            SponsoredProductRepository sponsoredProductRepository,
                            CartService cartService,
                            CartItemRepository cartItemRepository,
                            SmartCartAiClient aiClient) {
        this.smartCartItemRepository = smartCartItemRepository;
        this.userRepository = userRepository;
        this.productRepository = productRepository;
        this.orderRepository = orderRepository;
        this.sponsoredProductRepository = sponsoredProductRepository;
        this.cartService = cartService;
        this.cartItemRepository = cartItemRepository;
        this.aiClient = aiClient;
    }

    public SmartCartResponse getSmartCart(String email) {
        User user = findUser(email);
        List<SmartCartItem> items = smartCartItemRepository.findByUser(user);

        // Auto-populate from AI if user has no smart cart items but has order history
        if (items.isEmpty()) {
            List<CustomerOrder> orders = orderRepository.findByUserOrderByOrderDateDesc(user);
            if (!orders.isEmpty()) {
                log.info("SmartCart empty for user={}, calling AI to populate", email);
                items = populateFromAi(user, orders);
            }
        }

        return buildResponse(items);
    }

    public SmartCartResponse refreshSmartCart(String email) {
        User user = findUser(email);
        List<CustomerOrder> orders = orderRepository.findByUserOrderByOrderDateDesc(user);
        if (orders.isEmpty()) {
            return buildResponse(List.of());
        }

        // Clear existing predictions
        List<SmartCartItem> existing = smartCartItemRepository.findByUser(user);
        smartCartItemRepository.deleteAll(existing);
        smartCartItemRepository.flush();

        // Regenerate from AI
        List<SmartCartItem> items = populateFromAi(user, orders);
        return buildResponse(items);
    }

    private SmartCartResponse buildResponse(List<SmartCartItem> items) {
        double avgConfidence = items.isEmpty() ? 0.0
                : items.stream()
                    .mapToDouble(i -> i.getConfidence() != null ? i.getConfidence() : 0.87)
                    .average().orElse(0.87);

        List<SmartCartResponse.SmartCartItemDto> dtos = items.stream()
                .map(sci -> SmartCartResponse.SmartCartItemDto.builder()
                        .productId(String.valueOf(sci.getProduct().getId()))
                        .quantity(sci.getQuantity())
                        .frequency(sci.getFrequency())
                        .lastPurchased(sci.getLastPurchased())
                        .predictedNeed(sci.getPredictedNeed())
                        .product(ProductDto.from(sci.getProduct()))
                        .sponsoredAlternative(sci.getSponsoredAlternative() != null ?
                                SponsoredProductDto.from(sci.getSponsoredAlternative()) : null)
                        .priceAdvantage(sci.getPriceAdvantage())
                        .sponsoredReason(sci.getSponsoredReason())
                        .build())
                .toList();
        return SmartCartResponse.builder()
                .lastUpdated(LocalDate.now())
                .basedOnMonths(3)
                .confidence(Math.round(avgConfidence * 100.0) / 100.0)
                .items(dtos)
                .build();
    }

    private List<SmartCartItem> populateFromAi(User user, List<CustomerOrder> orders) {
        // Build order history entries for the AI service
        List<SmartCartAiClient.OrderHistoryEntry> history = new ArrayList<>();
        for (CustomerOrder order : orders) {
            String orderDate = order.getOrderDate().toLocalDate()
                    .format(DateTimeFormatter.ISO_LOCAL_DATE);
            for (OrderItem oi : order.getItems()) {
                history.add(new SmartCartAiClient.OrderHistoryEntry(
                        oi.getProduct().getName(),
                        oi.getQuantity(),
                        orderDate
                ));
            }
        }

        // Get current cart product names to exclude from predictions
        List<String> currentCart = List.of();
        try {
            Cart cart = cartService.getOrCreateCart(user);
            currentCart = cart.getItems().stream()
                    .map(ci -> ci.getProduct().getName())
                    .toList();
        } catch (Exception e) {
            log.warn("Could not load cart for AI exclusion: {}", e.getMessage());
        }

        // Call AI service with sponsored product prices and predicted product prices
        List<SponsoredProduct> allSponsored = sponsoredProductRepository.findAll();
        List<Map<String, Object>> sponsoredWithPrices = allSponsored.stream()
                .map(sp -> {
                    Map<String, Object> m = new java.util.HashMap<>();
                    m.put("name", sp.getName());
                    m.put("price", sp.getPrice().doubleValue());
                    m.put("category", sp.getRelatedCategories() != null ? sp.getRelatedCategories() : "");
                    return m;
                }).toList();

        // Build product price lookup for price comparison
        List<Product> allProducts = productRepository.findAll();
        Map<String, Double> productPrices = new java.util.HashMap<>();
        for (Product p : allProducts) {
            productPrices.put(p.getName().toLowerCase().strip(), p.getPrice().doubleValue());
        }

        SmartCartAiClient.PredictCartResponse aiResponse =
                aiClient.predictCart(String.valueOf(user.getId()), history, currentCart,
                        sponsoredWithPrices, productPrices);

        if (aiResponse == null || aiResponse.predictedItems().isEmpty()) {
            return List.of();
        }

        // Match predicted product names to actual products in the DB and persist
        List<SmartCartItem> saved = new ArrayList<>();
        for (SmartCartAiClient.PredictedItem predicted : aiResponse.predictedItems()) {
            Optional<Product> matched = matchProduct(predicted.productName(), allProducts);
            if (matched.isEmpty()) {
                log.debug("No DB product match for AI prediction: '{}'", predicted.productName());
                continue;
            }

            Product product = matched.get();
            SmartCartItem item = SmartCartItem.builder()
                    .user(user)
                    .product(product)
                    .quantity(1)
                    .frequency(predicted.frequency())
                    .lastPurchased(LocalDate.now().minusDays(7))
                    .predictedNeed(LocalDate.now().plusDays(frequencyToDays(predicted.frequency())))
                    .build();
            item.setConfidence(predicted.confidence());

            // Match AI-returned sponsored candidates to DB sponsored products
            if (predicted.sponsoredCandidates() != null && !predicted.sponsoredCandidates().isEmpty()) {
                for (SmartCartAiClient.SponsoredCandidate candidate : predicted.sponsoredCandidates()) {
                    Optional<SponsoredProduct> matchedSp = matchSponsoredProduct(candidate, allSponsored);
                    if (matchedSp.isPresent()) {
                        item.setSponsoredAlternative(matchedSp.get());
                        item.setPriceAdvantage(candidate.priceAdvantage());
                        item.setSponsoredReason(candidate.reason());
                        break; // take the first (highest-ranked) match
                    }
                }
            }

            saved.add(smartCartItemRepository.save(item));
        }
        log.info("Populated {} SmartCart items from AI for user={}", saved.size(), user.getEmail());
        return saved;
    }

    private Optional<Product> matchProduct(String aiName, List<Product> allProducts) {
        String normalized = aiName.toLowerCase().strip();
        // Exact name match first
        for (Product p : allProducts) {
            if (p.getName().toLowerCase().strip().equals(normalized)) {
                return Optional.of(p);
            }
        }
        // Partial match: AI name contained in product name or vice versa
        for (Product p : allProducts) {
            String pName = p.getName().toLowerCase().strip();
            if (pName.contains(normalized) || normalized.contains(pName)) {
                return Optional.of(p);
            }
        }
        return Optional.empty();
    }

    private Optional<SponsoredProduct> matchSponsoredProduct(
            SmartCartAiClient.SponsoredCandidate candidate,
            List<SponsoredProduct> allSponsored) {
        String normalized = candidate.productName().toLowerCase().strip();
        for (SponsoredProduct sp : allSponsored) {
            String spName = sp.getName().toLowerCase().strip();
            if (spName.equals(normalized)
                    || spName.contains(normalized)
                    || normalized.contains(spName)) {
                return Optional.of(sp);
            }
        }
        return Optional.empty();
    }

    private int frequencyToDays(String frequency) {
        return switch (frequency) {
            case "weekly" -> 7;
            case "biweekly" -> 14;
            case "monthly" -> 30;
            case "occasional" -> 60;
            default -> 14;
        };
    }

    public Map<String, Object> updateItem(String email, Long productId, int quantity) {
        User user = findUser(email);
        SmartCartItem item = smartCartItemRepository.findByUserAndProductId(user, productId)
                .orElseThrow(() -> new RuntimeException("Item not found in SmartCart"));
        item.setQuantity(quantity);
        smartCartItemRepository.save(item);
        return Map.of("productId", String.valueOf(productId), "quantity", quantity, "updated", true);
    }

    public Map<String, Object> removeItem(String email, Long productId) {
        User user = findUser(email);
        smartCartItemRepository.deleteByUserAndProductId(user, productId);
        return Map.of("productId", String.valueOf(productId), "removed", true);
    }

    public Map<String, Object> addAllToCart(String email) {
        User user = findUser(email);
        Cart cart = cartService.getOrCreateCart(user);
        List<SmartCartItem> items = smartCartItemRepository.findByUser(user);
        for (SmartCartItem sci : items) {
            CartItem existing = cartItemRepository.findByCartAndProduct(cart, sci.getProduct()).orElse(null);
            if (existing != null) {
                existing.setQuantity(existing.getQuantity() + sci.getQuantity());
                cartItemRepository.save(existing);
            } else {
                cartItemRepository.save(CartItem.builder()
                        .cart(cart)
                        .product(sci.getProduct())
                        .quantity(sci.getQuantity())
                        .build());
            }
        }
        return Map.of("success", true, "message", "All items added to cart");
    }

    public Map<String, Object> dismissSponsored(String email, Long sponsoredId) {
        User user = findUser(email);
        List<SmartCartItem> items = smartCartItemRepository.findByUser(user);
        items.stream()
                .filter(i -> i.getSponsoredAlternative() != null &&
                        i.getSponsoredAlternative().getId().equals(sponsoredId))
                .forEach(i -> {
                    i.setSponsoredAlternative(null);
                    smartCartItemRepository.save(i);
                });
        return Map.of("sponsoredId", String.valueOf(sponsoredId), "dismissed", true);
    }

    private User findUser(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }
}

