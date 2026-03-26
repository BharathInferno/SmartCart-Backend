package com.albertsons.shopper.dto;

import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class AddToCartRequest {
    private String productId;
    private Integer quantity;
}

