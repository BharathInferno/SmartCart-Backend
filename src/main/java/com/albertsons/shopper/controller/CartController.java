package com.albertsons.shopper.controller;

import com.albertsons.shopper.dto.CartResponse;
import com.albertsons.shopper.dto.AddToCartRequest;
import com.albertsons.shopper.dto.UpdateQuantityRequest;
import com.albertsons.shopper.services.CartService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/cart")
public class CartController {

    private final CartService cartService;

    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    @GetMapping
    public ResponseEntity<CartResponse> getCart(@AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.ok(cartService.getCart(userDetails.getUsername()));
    }

    @PostMapping("/items")
    public ResponseEntity<Map<String, Object>> addItem(
            @AuthenticationPrincipal UserDetails userDetails,
            @RequestBody AddToCartRequest request) {
        return ResponseEntity.ok(cartService.addItem(
                userDetails.getUsername(),
                Long.valueOf(request.getProductId()),
                request.getQuantity()));
    }

    @PutMapping("/items/{productId}")
    public ResponseEntity<Map<String, Object>> updateItem(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long productId,
            @RequestBody UpdateQuantityRequest request) {
        return ResponseEntity.ok(cartService.updateItem(
                userDetails.getUsername(), productId, request.getQuantity()));
    }

    @DeleteMapping("/items/{productId}")
    public ResponseEntity<Map<String, Object>> removeItem(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long productId) {
        return ResponseEntity.ok(cartService.removeItem(userDetails.getUsername(), productId));
    }
}

