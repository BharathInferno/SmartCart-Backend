package com.albertsons.shopper.repository;

import com.albertsons.shopper.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Long> {
}

