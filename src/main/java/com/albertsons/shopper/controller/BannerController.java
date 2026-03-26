package com.albertsons.shopper.controller;

import com.albertsons.shopper.dto.BannerDto;
import com.albertsons.shopper.services.BannerService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/banners")
public class BannerController {

    private final BannerService bannerService;

    public BannerController(BannerService bannerService) {
        this.bannerService = bannerService;
    }

    @GetMapping
    public ResponseEntity<List<BannerDto>> getBanners() {
        return ResponseEntity.ok(bannerService.getAllBanners());
    }
}

