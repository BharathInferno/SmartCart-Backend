package com.albertsons.shopper.repository;

import com.albertsons.shopper.model.Deal;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DealRepository extends JpaRepository<Deal, Long> {
}

