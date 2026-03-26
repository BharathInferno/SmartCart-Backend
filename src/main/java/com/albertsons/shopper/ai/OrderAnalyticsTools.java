package com.albertsons.shopper.ai;


import com.albertsons.shopper.dto.FrequentlyBoughtProductDto;
import com.albertsons.shopper.services.OrderAnalyticsService;
import org.springframework.ai.tool.annotation.Tool;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class OrderAnalyticsTools {

    private final OrderAnalyticsService orderAnalyticsService;

    public OrderAnalyticsTools(OrderAnalyticsService orderAnalyticsService) {
        this.orderAnalyticsService = orderAnalyticsService;
    }

    @Tool(description = "Get frequently bought products for a customer for the last N days. " +
            "Use this when the user asks about top products, frequent purchases, or 90-day product history.")
    public List<FrequentlyBoughtProductDto> getFrequentlyBoughtProducts(Long customerId, Integer days, Integer limit) {
        int safeDays = (days == null || days <= 0) ? 90 : days;
        int safeLimit = (limit == null || limit <= 0) ? 10 : limit;
        return orderAnalyticsService.getFrequentlyBoughtProducts(customerId, safeDays, safeLimit);
    }
}
