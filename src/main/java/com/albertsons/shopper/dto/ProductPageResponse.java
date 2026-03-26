package com.albertsons.shopper.dto;

import lombok.*;
import java.util.List;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class ProductPageResponse {
    private List<ProductDto> products;
    private long total;
    private int page;
    private int totalPages;
}

