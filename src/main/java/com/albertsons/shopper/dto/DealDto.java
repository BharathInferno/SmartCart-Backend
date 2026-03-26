package com.albertsons.shopper.dto;

import lombok.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class DealDto {
    private String productId;
    private ProductDto product;
    private BigDecimal originalPrice;
    private BigDecimal salePrice;
    private Integer discount;
    private LocalDateTime endsAt;
}

