package com.albertsons.shopper.controller;

import com.albertsons.shopper.dto.DealDto;
import com.albertsons.shopper.services.DealService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/deals")
public class DealController {

    private final DealService dealService;

    public DealController(DealService dealService) {
        this.dealService = dealService;
    }

    @GetMapping
    public ResponseEntity<List<DealDto>> getDeals() {
        return ResponseEntity.ok(dealService.getAllDeals());
    }
}

