package com.albertsons.shopper.services;


import com.albertsons.shopper.dto.FrequentlyBoughtProductDto;
import com.albertsons.shopper.repository.CustomerOrderRepository;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class OrderAnalyticsService {

    private final CustomerOrderRepository customerOrderRepository;

    public OrderAnalyticsService(CustomerOrderRepository customerOrderRepository) {
        this.customerOrderRepository = customerOrderRepository;
    }

    public List<FrequentlyBoughtProductDto> getFrequentlyBoughtProducts(Long customerId, int days, int limit) {
        LocalDateTime fromDate = LocalDateTime.now().minusDays(days);
        return customerOrderRepository.findFrequentlyBoughtProducts(
                customerId,
                fromDate,
                PageRequest.of(0, limit)
        );
    }
}
