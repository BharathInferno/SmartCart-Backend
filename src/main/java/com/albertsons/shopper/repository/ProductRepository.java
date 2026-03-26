package com.albertsons.shopper.repository;

import com.albertsons.shopper.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {

    @Query("""
        SELECT p FROM Product p
        WHERE (:category IS NULL OR p.category = :category)
          AND (:search IS NULL OR LOWER(CAST(p.name AS String)) LIKE LOWER(CONCAT('%', CAST(:search AS String), '%'))
               OR LOWER(CAST(p.description AS String)) LIKE LOWER(CONCAT('%', CAST(:search AS String), '%')))
          AND (:organic IS NULL OR p.isOrganic = :organic)
        """)
    Page<Product> findFiltered(
            @Param("category") String category,
            @Param("search") String search,
            @Param("organic") Boolean organic,
            Pageable pageable
    );

    List<Product> findTop8ByOrderByReviewsDesc();
}

