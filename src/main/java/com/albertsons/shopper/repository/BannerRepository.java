package com.albertsons.shopper.repository;

import com.albertsons.shopper.model.Banner;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BannerRepository extends JpaRepository<Banner, Long> {
}

