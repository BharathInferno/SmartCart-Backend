package com.albertsons.shopper.dto;

import com.albertsons.shopper.model.User;
import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class UserDto {
    private String id;
    private String firstName;
    private String lastName;
    private String email;
    private Integer loyaltyPoints;
    private String tier;
    private String preferredStore;

    public static UserDto from(User user) {
        return UserDto.builder()
                .id(String.valueOf(user.getId()))
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .email(user.getEmail())
                .loyaltyPoints(user.getLoyaltyPoints())
                .tier(user.getTier())
                .preferredStore(user.getPreferredStore())
                .build();
    }
}

