package com.albertsons.shopper.repository;

import com.albertsons.shopper.model.Cart;
import com.albertsons.shopper.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface CartRepository extends JpaRepository<Cart, Long> {
    Optional<Cart> findByUser(User user);
}

