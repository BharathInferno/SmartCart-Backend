package com.albertsons.shopper.dto;

import com.albertsons.shopper.model.Product;
import lombok.*;
import java.math.BigDecimal;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class ProductDto {
    private String id;
    private String name;
    private String category;
    private BigDecimal price;
    private String unit;
    private String image;
    private BigDecimal rating;
    private Integer reviews;
    private Boolean inStock;
    private Boolean isOrganic;
    private String description;

    public static ProductDto from(Product p) {
        return ProductDto.builder()
                .id(String.valueOf(p.getId()))
                .name(p.getName())
                .category(p.getCategory())
                .price(p.getPrice())
                .unit(p.getUnit())
                .image(p.getImage())
                .rating(p.getRating())
                .reviews(p.getReviews())
                .inStock(p.getInStock())
                .isOrganic(p.getIsOrganic())
                .description(p.getDescription())
                .build();
    }
}

