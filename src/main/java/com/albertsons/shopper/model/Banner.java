package com.albertsons.shopper.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "banners")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Banner {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(columnDefinition = "varchar(255)")
    private String title;

    @Column(columnDefinition = "varchar(500)")
    private String subtitle;

    @Column(columnDefinition = "varchar(100)")
    private String ctaText;

    @Column(columnDefinition = "varchar(255)")
    private String ctaLink;

    @Column(columnDefinition = "varchar(500)")
    private String bgColor;

    @Column(columnDefinition = "varchar(500)")
    private String image;
}

