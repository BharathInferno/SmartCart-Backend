package com.albertsons.shopper.controller;

import com.albertsons.shopper.dto.ProductDto;
import com.albertsons.shopper.dto.ProductPageResponse;
import com.albertsons.shopper.dto.SponsoredProductDto;
import com.albertsons.shopper.services.ProductService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/products")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping
    public ResponseEntity<ProductPageResponse> getProducts(
            @RequestParam(required = false) String category,
            @RequestParam(required = false) String search,
            @RequestParam(required = false) String sortBy,
            @RequestParam(required = false) Boolean organic,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "20") int limit) {
        return ResponseEntity.ok(productService.getProducts(category, search, sortBy, organic, page, limit));
    }

    @GetMapping("/trending")
    public ResponseEntity<List<ProductDto>> getTrending() {
        return ResponseEntity.ok(productService.getTrending());
    }

    @GetMapping("/sponsored")
    public ResponseEntity<List<SponsoredProductDto>> getSponsored(
            @RequestParam(required = false) String category) {
        return ResponseEntity.ok(productService.getSponsored(category));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProductDto> getProduct(@PathVariable Long id) {
        return ResponseEntity.ok(productService.getProductById(id));
    }
}

