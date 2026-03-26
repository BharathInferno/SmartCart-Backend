package com.albertsons.shopper.repository;

import com.albertsons.shopper.model.SponsoredProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface SponsoredProductRepository extends JpaRepository<SponsoredProduct, Long> {

    @Query("SELECT sp FROM SponsoredProduct sp WHERE :category IS NULL OR CAST(sp.relatedCategories AS String) LIKE CONCAT('%', CAST(:category AS String), '%')")
    List<SponsoredProduct> findByCategory(@Param("category") String category);
}

