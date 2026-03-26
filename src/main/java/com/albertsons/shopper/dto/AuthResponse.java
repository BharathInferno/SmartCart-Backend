package com.albertsons.shopper.dto;

import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class AuthResponse {
    private UserDto user;
    private String token;
}

