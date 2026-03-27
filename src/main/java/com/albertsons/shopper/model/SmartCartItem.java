package com.albertsons.shopper.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDate;

@Entity
@Table(name = "smart_cart_items", uniqueConstraints = @UniqueConstraint(columnNames = {"user_id", "product_id"}))
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class SmartCartItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "product_id")
    private Product product;

    @Column(nullable = false)
    @Builder.Default
    private Integer quantity = 1;

    private String frequency; // weekly, bi-weekly, monthly

    private LocalDate lastPurchased;

    private LocalDate predictedNeed;

    private Double confidence;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "sponsored_alternative_id")
    private SponsoredProduct sponsoredAlternative;

    private Double priceAdvantage;

    @Column(columnDefinition = "varchar(500)")
    private String sponsoredReason;
}

