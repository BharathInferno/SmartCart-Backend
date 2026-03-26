package com.albertsons.shopper.dto;

import com.albertsons.shopper.model.SponsoredProduct;
import lombok.*;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class SponsoredProductDto {
    private String id;
    private String name;
    private BigDecimal price;
    private String unit;
    private String image;
    private String sponsor;
    private String tagline;
    private List<String> relatedCategories;

    public static SponsoredProductDto from(SponsoredProduct sp) {
        return SponsoredProductDto.builder()
                .id(String.valueOf(sp.getId()))
                .name(sp.getName())
                .price(sp.getPrice())
                .unit(sp.getUnit())
                .image(sp.getImage())
                .sponsor(sp.getSponsor())
                .tagline(sp.getTagline())
                .relatedCategories(sp.getRelatedCategories() != null ?
                        Arrays.asList(sp.getRelatedCategories().split(",")) : List.of())
                .build();
    }
}

