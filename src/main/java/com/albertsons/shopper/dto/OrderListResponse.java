package com.albertsons.shopper.dto;

import lombok.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class OrderListResponse {
    private String id;
    private LocalDateTime date;
    private List<OrderResponse.OrderItemDto> items;
    private BigDecimal total;
    private String status;
}

