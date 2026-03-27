package com.albertsons.shopper.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "categories")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, columnDefinition = "varchar(255)")
    private String name;

    @Column(nullable = false, unique = true, columnDefinition = "varchar(100)")
    private String slug;

    @Column(columnDefinition = "varchar(500)")
    private String image;

    @Column(columnDefinition = "varchar(500)")
    private String description;

    @Builder.Default
    private Integer itemCount = 0;
}

