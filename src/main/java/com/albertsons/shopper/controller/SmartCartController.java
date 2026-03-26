package com.albertsons.shopper.controller;

import com.albertsons.shopper.dto.SmartCartResponse;
import com.albertsons.shopper.dto.UpdateQuantityRequest;
import com.albertsons.shopper.services.SmartCartService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/smartcart")
public class SmartCartController {

    private final SmartCartService smartCartService;

    public SmartCartController(SmartCartService smartCartService) {
        this.smartCartService = smartCartService;
    }

    @GetMapping
    public ResponseEntity<SmartCartResponse> getSmartCart(
            @AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.ok(smartCartService.getSmartCart(userDetails.getUsername()));
    }

    @PutMapping("/items/{productId}")
    public ResponseEntity<Map<String, Object>> updateItem(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long productId,
            @RequestBody UpdateQuantityRequest request) {
        return ResponseEntity.ok(smartCartService.updateItem(
                userDetails.getUsername(), productId, request.getQuantity()));
    }

    @DeleteMapping("/items/{productId}")
    public ResponseEntity<Map<String, Object>> removeItem(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long productId) {
        return ResponseEntity.ok(smartCartService.removeItem(userDetails.getUsername(), productId));
    }

    @PostMapping("/add-to-cart")
    public ResponseEntity<Map<String, Object>> addAllToCart(
            @AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.ok(smartCartService.addAllToCart(userDetails.getUsername()));
    }

    @PostMapping("/dismiss-sponsored")
    public ResponseEntity<Map<String, Object>> dismissSponsored(
            @AuthenticationPrincipal UserDetails userDetails,
            @RequestBody Map<String, String> request) {
        Long sponsoredId = Long.valueOf(request.get("sponsoredId"));
        return ResponseEntity.ok(smartCartService.dismissSponsored(userDetails.getUsername(), sponsoredId));
    }
}

