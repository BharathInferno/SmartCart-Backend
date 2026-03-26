package com.albertsons.shopper.model;

import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;

@Entity
@Table(name = "products")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, columnDefinition = "varchar(255)")
    private String name;

    @Column(columnDefinition = "varchar(255)")
    private String category;

    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal price;

    @Column(columnDefinition = "varchar(50)")
    private String unit;

    @Column(columnDefinition = "varchar(500)")
    private String image;

    @Column(precision = 3, scale = 1)
    private BigDecimal rating;

    @Column(nullable = false)
    @Builder.Default
    private Integer reviews = 0;

    @Column(nullable = false)
    @Builder.Default
    private Boolean inStock = true;

    @Column(nullable = false)
    @Builder.Default
    private Boolean isOrganic = false;

    @Column(columnDefinition = "varchar(1000)")
    private String description;
}

