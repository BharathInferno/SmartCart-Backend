package com.albertsons.shopper.services;

import com.albertsons.shopper.dto.DealDto;
import com.albertsons.shopper.dto.ProductDto;
import com.albertsons.shopper.repository.DealRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DealService {

    private final DealRepository dealRepository;

    public DealService(DealRepository dealRepository) {
        this.dealRepository = dealRepository;
    }

    public List<DealDto> getAllDeals() {
        return dealRepository.findAll().stream()
                .map(d -> DealDto.builder()
                        .productId(String.valueOf(d.getProduct().getId()))
                        .product(ProductDto.from(d.getProduct()))
                        .originalPrice(d.getOriginalPrice())
                        .salePrice(d.getSalePrice())
                        .discount(d.getDiscount())
                        .endsAt(d.getEndsAt())
                        .build())
                .toList();
    }
}

