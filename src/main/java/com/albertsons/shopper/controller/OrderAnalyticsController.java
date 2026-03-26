package com.albertsons.shopper.controller;


import com.albertsons.shopper.dto.FrequentlyBoughtProductDto;
import com.albertsons.shopper.services.OrderAnalyticsService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/orders")
public class OrderAnalyticsController {

    private final OrderAnalyticsService orderAnalyticsService;

    public OrderAnalyticsController(OrderAnalyticsService orderAnalyticsService) {
        this.orderAnalyticsService = orderAnalyticsService;
    }

    @GetMapping("/customers/{customerId}/frequently-bought-products")
    public List<FrequentlyBoughtProductDto> getFrequentlyBoughtProducts(
            @PathVariable Long customerId,
            @RequestParam(defaultValue = "90") int days,
            @RequestParam(defaultValue = "10") int limit
    ) {
        return orderAnalyticsService.getFrequentlyBoughtProducts(customerId, days, limit);
    }
}
