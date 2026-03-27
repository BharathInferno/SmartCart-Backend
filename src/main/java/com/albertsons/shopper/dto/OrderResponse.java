package com.albertsons.shopper.dto;

import lombok.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class OrderResponse {
    private String id;
    private String status;
    private List<OrderItemDto> items;
    private BigDecimal total;
    private LocalDateTime date;

    @Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
    public static class OrderItemDto {
        private String productId;
        private Integer quantity;
        private BigDecimal priceAtPurchase;
    }
}

