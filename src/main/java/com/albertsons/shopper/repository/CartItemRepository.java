package com.albertsons.shopper.repository;

import com.albertsons.shopper.model.Cart;
import com.albertsons.shopper.model.CartItem;
import com.albertsons.shopper.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface CartItemRepository extends JpaRepository<CartItem, Long> {
    Optional<CartItem> findByCartAndProduct(Cart cart, Product product);
    void deleteByCartAndProduct(Cart cart, Product product);
}

