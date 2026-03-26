package com.albertsons.shopper.repository;

import com.albertsons.shopper.model.SmartCartItem;
import com.albertsons.shopper.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface SmartCartItemRepository extends JpaRepository<SmartCartItem, Long> {
    List<SmartCartItem> findByUser(User user);
    Optional<SmartCartItem> findByUserAndProductId(User user, Long productId);
    void deleteByUserAndProductId(User user, Long productId);
}

