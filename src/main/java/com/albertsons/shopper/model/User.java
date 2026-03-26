package com.albertsons.shopper.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "users")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, columnDefinition = "varchar(100)")
    private String firstName;

    @Column(nullable = false, columnDefinition = "varchar(100)")
    private String lastName;

    @Column(nullable = false, unique = true, columnDefinition = "varchar(255)")
    private String email;

    @Column(nullable = false, columnDefinition = "varchar(255)")
    private String password;

    @Builder.Default
    private Integer loyaltyPoints = 0;

    @Builder.Default
    private String tier = "Bronze";

    private String preferredStore;
}

