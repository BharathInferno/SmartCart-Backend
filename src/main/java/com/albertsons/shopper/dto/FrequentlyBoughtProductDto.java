package com.albertsons.shopper.dto;

import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class FrequentlyBoughtProductDto {

    private Long productId;
    private String productName;
    private Long totalQuantity;
    private Long orderCount;
    private LocalDateTime lastOrderedAt;
    private BigDecimal totalSpent;

    public FrequentlyBoughtProductDto(Long productId,
                                      String productName,
                                      Long totalQuantity,
                                      Long orderCount,
                                      LocalDateTime lastOrderedAt,
                                      BigDecimal totalSpent) {
        this.productId = productId;
        this.productName = productName;
        this.totalQuantity = totalQuantity;
        this.orderCount = orderCount;
        this.lastOrderedAt = lastOrderedAt;
        this.totalSpent = totalSpent;
    }

    public Long getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public Long getTotalQuantity() {
        return totalQuantity;
    }

    public Long getOrderCount() {
        return orderCount;
    }

    public LocalDateTime getLastOrderedAt() {
        return lastOrderedAt;
    }

    public BigDecimal getTotalSpent() {
        return totalSpent;
    }
}

