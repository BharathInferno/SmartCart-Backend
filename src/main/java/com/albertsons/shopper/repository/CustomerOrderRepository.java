package com.albertsons.shopper.repository;


import com.albertsons.shopper.dto.FrequentlyBoughtProductDto;
import com.albertsons.shopper.model.CustomerOrder;
import com.albertsons.shopper.model.User;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;

public interface CustomerOrderRepository extends JpaRepository<CustomerOrder, Long> {

    @Query("""
        SELECT new com.albertsons.shopper.dto.FrequentlyBoughtProductDto(
            p.id,
            p.name,
            SUM(oi.quantity),
            COUNT(DISTINCT o.id),
            MAX(o.orderDate),
            SUM(oi.unitPrice * oi.quantity)
        )
        FROM CustomerOrder o
        JOIN o.items oi
        JOIN oi.product p
        WHERE o.customerId = :customerId
          AND o.orderDate >= :fromDate
        GROUP BY p.id, p.name
        ORDER BY SUM(oi.quantity) DESC, COUNT(DISTINCT o.id) DESC, MAX(o.orderDate) DESC
        """)
    List<FrequentlyBoughtProductDto> findFrequentlyBoughtProducts(
            @Param("customerId") Long customerId,
            @Param("fromDate") LocalDateTime fromDate,
            Pageable pageable
    );

    List<CustomerOrder> findByUserOrderByOrderDateDesc(User user);
}
