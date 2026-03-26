package com.albertsons.shopper.services;

import com.albertsons.shopper.dto.ProductDto;
import com.albertsons.shopper.dto.ProductPageResponse;
import com.albertsons.shopper.dto.SponsoredProductDto;
import com.albertsons.shopper.model.Product;
import com.albertsons.shopper.repository.ProductRepository;
import com.albertsons.shopper.repository.SponsoredProductRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final SponsoredProductRepository sponsoredProductRepository;

    public ProductService(ProductRepository productRepository,
                          SponsoredProductRepository sponsoredProductRepository) {
        this.productRepository = productRepository;
        this.sponsoredProductRepository = sponsoredProductRepository;
    }

    public ProductPageResponse getProducts(String category, String search, String sortBy,
                                           Boolean organic, int page, int limit) {
        Sort sort = parseSort(sortBy);
        Pageable pageable = PageRequest.of(page - 1, limit, sort);
        Page<Product> productPage = productRepository.findFiltered(category, search, organic, pageable);
        List<ProductDto> dtos = productPage.getContent().stream().map(ProductDto::from).toList();
        return ProductPageResponse.builder()
                .products(dtos)
                .total(productPage.getTotalElements())
                .page(page)
                .totalPages(productPage.getTotalPages())
                .build();
    }

    public ProductDto getProductById(Long id) {
        Product p = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        return ProductDto.from(p);
    }

    public List<ProductDto> getTrending() {
        return productRepository.findTop8ByOrderByReviewsDesc()
                .stream().map(ProductDto::from).toList();
    }

    public List<SponsoredProductDto> getSponsored(String category) {
        return sponsoredProductRepository.findByCategory(category)
                .stream().map(SponsoredProductDto::from).toList();
    }

    private Sort parseSort(String sortBy) {
        if (sortBy == null) return Sort.unsorted();
        return switch (sortBy) {
            case "price-asc" -> Sort.by(Sort.Direction.ASC, "price");
            case "price-desc" -> Sort.by(Sort.Direction.DESC, "price");
            case "rating" -> Sort.by(Sort.Direction.DESC, "rating");
            case "name" -> Sort.by(Sort.Direction.ASC, "name");
            default -> Sort.unsorted();
        };
    }
}

