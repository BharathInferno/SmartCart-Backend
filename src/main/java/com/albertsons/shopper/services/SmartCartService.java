package com.albertsons.shopper.services;

import com.albertsons.shopper.dto.ProductDto;
import com.albertsons.shopper.dto.SmartCartResponse;
import com.albertsons.shopper.dto.SponsoredProductDto;
import com.albertsons.shopper.model.*;
import com.albertsons.shopper.repository.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class SmartCartService {

    private final SmartCartItemRepository smartCartItemRepository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    private final CartService cartService;
    private final CartItemRepository cartItemRepository;

    public SmartCartService(SmartCartItemRepository smartCartItemRepository,
                            UserRepository userRepository,
                            ProductRepository productRepository,
                            CartService cartService,
                            CartItemRepository cartItemRepository) {
        this.smartCartItemRepository = smartCartItemRepository;
        this.userRepository = userRepository;
        this.productRepository = productRepository;
        this.cartService = cartService;
        this.cartItemRepository = cartItemRepository;
    }

    public SmartCartResponse getSmartCart(String email) {
        User user = findUser(email);
        List<SmartCartItem> items = smartCartItemRepository.findByUser(user);
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
                        .build())
                .toList();
        return SmartCartResponse.builder()
                .lastUpdated(LocalDate.now())
                .basedOnMonths(3)
                .confidence(0.87)
                .items(dtos)
                .build();
    }

    @Transactional
    public Map<String, Object> updateItem(String email, Long productId, int quantity) {
        User user = findUser(email);
        SmartCartItem item = smartCartItemRepository.findByUserAndProductId(user, productId)
                .orElseThrow(() -> new RuntimeException("Item not found in SmartCart"));
        item.setQuantity(quantity);
        smartCartItemRepository.save(item);
        return Map.of("productId", String.valueOf(productId), "quantity", quantity, "updated", true);
    }

    @Transactional
    public Map<String, Object> removeItem(String email, Long productId) {
        User user = findUser(email);
        smartCartItemRepository.deleteByUserAndProductId(user, productId);
        return Map.of("productId", String.valueOf(productId), "removed", true);
    }

    @Transactional
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

    @Transactional
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

