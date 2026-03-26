package com.albertsons.shopper.dto;

import lombok.*;
import java.math.BigDecimal;
import java.util.List;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class CartResponse {
    private List<CartItemDto> items;
    private BigDecimal total;

    @Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
    public static class CartItemDto {
        private ProductDto product;
        private Integer quantity;
    }
}

