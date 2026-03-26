package com.albertsons.shopper.services;

import com.albertsons.shopper.dto.BannerDto;
import com.albertsons.shopper.repository.BannerRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BannerService {

    private final BannerRepository bannerRepository;

    public BannerService(BannerRepository bannerRepository) {
        this.bannerRepository = bannerRepository;
    }

    public List<BannerDto> getAllBanners() {
        return bannerRepository.findAll().stream().map(BannerDto::from).toList();
    }
}

