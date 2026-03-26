package com.albertsons.shopper.controller;

import com.albertsons.shopper.dto.OrderListResponse;
import com.albertsons.shopper.dto.OrderResponse;
import com.albertsons.shopper.services.OrderService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/orders")
public class NewOrderController {

    private final OrderService orderService;

    public NewOrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping
    public ResponseEntity<OrderResponse> placeOrder(
            @AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.ok(orderService.placeOrder(userDetails.getUsername()));
    }

    @GetMapping
    public ResponseEntity<List<OrderListResponse>> getOrders(
            @AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.ok(orderService.getOrders(userDetails.getUsername()));
    }
}

