package com.albertsons.shopper.dto;

import lombok.*;
import java.time.LocalDate;
import java.util.List;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class SmartCartResponse {
    private LocalDate lastUpdated;
    private Integer basedOnMonths;
    private Double confidence;
    private List<SmartCartItemDto> items;

    @Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
    public static class SmartCartItemDto {
        private String productId;
        private Integer quantity;
        private String frequency;
        private LocalDate lastPurchased;
        private LocalDate predictedNeed;
        private ProductDto product;
        private SponsoredProductDto sponsoredAlternative;
        private Double priceAdvantage;
        private String sponsoredReason;
    }
}

