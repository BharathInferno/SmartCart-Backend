package com.albertsons.shopper.services;

import com.albertsons.shopper.dto.CartResponse;
import com.albertsons.shopper.dto.ProductDto;
import com.albertsons.shopper.model.*;
import com.albertsons.shopper.repository.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class CartService {

    private final CartRepository cartRepository;
    private final CartItemRepository cartItemRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    public CartService(CartRepository cartRepository, CartItemRepository cartItemRepository,
                       ProductRepository productRepository, UserRepository userRepository) {
        this.cartRepository = cartRepository;
        this.cartItemRepository = cartItemRepository;
        this.productRepository = productRepository;
        this.userRepository = userRepository;
    }

    public Cart getOrCreateCart(User user) {
        return cartRepository.findByUser(user).orElseGet(() -> {
            Cart cart = Cart.builder().user(user).build();
            return cartRepository.save(cart);
        });
    }

    public CartResponse getCart(String email) {
        User user = findUser(email);
        Cart cart = getOrCreateCart(user);
        List<CartResponse.CartItemDto> items = cart.getItems().stream()
                .map(ci -> CartResponse.CartItemDto.builder()
                        .product(ProductDto.from(ci.getProduct()))
                        .quantity(ci.getQuantity())
                        .build())
                .toList();
        return CartResponse.builder()
                .items(items)
                .total(cart.getTotal())
                .build();
    }

    public Map<String, Object> addItem(String email, Long productId, int quantity) {
        User user = findUser(email);
        Cart cart = getOrCreateCart(user);
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        CartItem item = cartItemRepository.findByCartAndProduct(cart, product)
                .map(existing -> {
                    existing.setQuantity(existing.getQuantity() + quantity);
                    return existing;
                })
                .orElse(CartItem.builder().cart(cart).product(product).quantity(quantity).build());
        cartItemRepository.save(item);
        return Map.of("productId", String.valueOf(productId), "quantity", item.getQuantity(), "added", true);
    }

    public Map<String, Object> updateItem(String email, Long productId, int quantity) {
        User user = findUser(email);
        Cart cart = getOrCreateCart(user);
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        CartItem item = cartItemRepository.findByCartAndProduct(cart, product)
                .orElseThrow(() -> new RuntimeException("Item not in cart"));
        item.setQuantity(quantity);
        cartItemRepository.save(item);
        return Map.of("productId", String.valueOf(productId), "quantity", quantity, "updated", true);
    }

    public Map<String, Object> removeItem(String email, Long productId) {
        User user = findUser(email);
        Cart cart = getOrCreateCart(user);
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        cartItemRepository.deleteByCartAndProduct(cart, product);
        return Map.of("productId", String.valueOf(productId), "removed", true);
    }

    private User findUser(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }
}

