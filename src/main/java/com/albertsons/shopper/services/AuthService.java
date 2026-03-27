package com.albertsons.shopper.services;

import com.albertsons.shopper.dto.*;
import com.albertsons.shopper.model.User;
import com.albertsons.shopper.repository.UserRepository;
import com.albertsons.shopper.security.JwtUtil;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtil jwtUtil;
    private final AuthenticationManager authenticationManager;

    public AuthService(UserRepository userRepository, PasswordEncoder passwordEncoder,
                       JwtUtil jwtUtil, AuthenticationManager authenticationManager) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtUtil = jwtUtil;
        this.authenticationManager = authenticationManager;
    }

    private UserDto dummyUser() {
        return UserDto.builder()
                .id("u001")
                .firstName("Sarah")
                .lastName("Johnson")
                .email("sarah.johnson@email.com")
                .loyaltyPoints(2450)
                .tier("Gold")
                .preferredStore("Albertsons #1234 - Downtown")
                .build();
    }

    public AuthResponse register(RegisterRequest req) {
        // Dummy: always succeed, return mock user + token
        String token = jwtUtil.generateToken("sarah.johnson@email.com");
        UserDto user = dummyUser();
        if (req.getFirstName() != null) user.setFirstName(req.getFirstName());
        if (req.getLastName() != null) user.setLastName(req.getLastName());
        if (req.getEmail() != null) user.setEmail(req.getEmail());
        return AuthResponse.builder().user(user).token(token).build();
    }

    public AuthResponse login(LoginRequest req) {
        // Dummy: always succeed, return mock user + token
        String token = jwtUtil.generateToken("sarah.johnson@email.com");
        return AuthResponse.builder().user(dummyUser()).token(token).build();
    }

    public UserDto getMe(String email) {
        // Dummy: return mock user
        return dummyUser();
    }

    public UserDto updateMe(String email, UserDto updates) {
        // Dummy: return mock user with updates applied
        UserDto user = dummyUser();
        if (updates.getFirstName() != null) user.setFirstName(updates.getFirstName());
        if (updates.getLastName() != null) user.setLastName(updates.getLastName());
        if (updates.getPreferredStore() != null) user.setPreferredStore(updates.getPreferredStore());
        return user;
    }
}

