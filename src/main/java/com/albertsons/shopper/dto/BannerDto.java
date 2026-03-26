package com.albertsons.shopper.dto;

import com.albertsons.shopper.model.Banner;
import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class BannerDto {
    private String id;
    private String title;
    private String subtitle;
    private String ctaText;
    private String ctaLink;
    private String bgColor;
    private String image;

    public static BannerDto from(Banner b) {
        return BannerDto.builder()
                .id(String.valueOf(b.getId()))
                .title(b.getTitle())
                .subtitle(b.getSubtitle())
                .ctaText(b.getCtaText())
                .ctaLink(b.getCtaLink())
                .bgColor(b.getBgColor())
                .image(b.getImage())
                .build();
    }
}

