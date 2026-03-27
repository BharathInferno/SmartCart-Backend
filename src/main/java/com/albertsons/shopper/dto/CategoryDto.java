package com.albertsons.shopper.dto;

import com.albertsons.shopper.model.Category;
import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class CategoryDto {
    private String id;
    private String name;
    private String slug;
    private String image;
    private String description;
    private Integer itemCount;

    public static CategoryDto from(Category c) {
        return CategoryDto.builder()
                .id(String.valueOf(c.getId()))
                .name(c.getName())
                .slug(c.getSlug())
                .image(c.getImage())
                .description(c.getDescription())
                .itemCount(c.getItemCount())
                .build();
    }
}

