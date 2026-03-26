package com.albertsons.shopper.model;

import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;

@Entity
@Table(name = "sponsored_products")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class SponsoredProduct {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, columnDefinition = "varchar(255)")
    private String name;

    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal price;

    @Column(columnDefinition = "varchar(50)")
    private String unit;

    @Column(columnDefinition = "varchar(500)")
    private String image;

    @Column(columnDefinition = "varchar(255)")
    private String sponsor;

    @Column(columnDefinition = "varchar(500)")
    private String tagline;

    @Column(columnDefinition = "varchar(500)")
    private String relatedCategories; // comma-separated category IDs

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "related_product_id")
    private Product relatedProduct;
}

