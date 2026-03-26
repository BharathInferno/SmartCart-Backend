package com.albertsons.shopper.services;

import com.albertsons.shopper.dto.OrderListResponse;
import com.albertsons.shopper.dto.OrderResponse;
import com.albertsons.shopper.model.*;
import com.albertsons.shopper.repository.CartRepository;
import com.albertsons.shopper.repository.CustomerOrderRepository;
import com.albertsons.shopper.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class OrderService {

    private final CustomerOrderRepository orderRepository;
    private final CartRepository cartRepository;
    private final UserRepository userRepository;
    private final CartService cartService;

    public OrderService(CustomerOrderRepository orderRepository, CartRepository cartRepository,
                        UserRepository userRepository, CartService cartService) {
        this.orderRepository = orderRepository;
        this.cartRepository = cartRepository;
        this.userRepository = userRepository;
        this.cartService = cartService;
    }

    @Transactional
    public OrderResponse placeOrder(String email) {
        User user = findUser(email);
        Cart cart = cartService.getOrCreateCart(user);

        if (cart.getItems().isEmpty()) {
            throw new RuntimeException("Cart is empty");
        }

        CustomerOrder order = CustomerOrder.builder()
                .customerId(user.getId())
                .user(user)
                .orderDate(LocalDateTime.now())
                .status("completed")
                .total(cart.getTotal())
                .build();

        List<OrderItem> orderItems = cart.getItems().stream()
                .map(ci -> OrderItem.builder()
                        .order(order)
                        .product(ci.getProduct())
                        .quantity(ci.getQuantity())
                        .unitPrice(ci.getProduct().getPrice())
                        .build())
                .toList();
        order.setItems(orderItems);
        CustomerOrder saved = orderRepository.save(order);

        // Clear the cart
        cart.getItems().clear();
        cartRepository.save(cart);

        return toOrderResponse(saved);
    }

    @Transactional(readOnly = true)
    public List<OrderListResponse> getOrders(String email) {
        User user = findUser(email);
        List<CustomerOrder> orders = orderRepository.findByUserOrderByOrderDateDesc(user);
        return orders.stream().map(this::toOrderListResponse).toList();
    }

    private OrderResponse toOrderResponse(CustomerOrder order) {
        List<OrderResponse.OrderItemDto> items = order.getItems().stream()
                .map(oi -> OrderResponse.OrderItemDto.builder()
                        .productId(String.valueOf(oi.getProduct().getId()))
                        .quantity(oi.getQuantity())
                        .priceAtPurchase(oi.getUnitPrice())
                        .build())
                .toList();
        return OrderResponse.builder()
                .id(String.valueOf(order.getId()))
                .status(order.getStatus())
                .items(items)
                .total(order.getTotal())
                .date(order.getOrderDate())
                .build();
    }

    private OrderListResponse toOrderListResponse(CustomerOrder order) {
        List<OrderResponse.OrderItemDto> items = order.getItems().stream()
                .map(oi -> OrderResponse.OrderItemDto.builder()
                        .productId(String.valueOf(oi.getProduct().getId()))
                        .quantity(oi.getQuantity())
                        .priceAtPurchase(oi.getUnitPrice())
                        .build())
                .toList();
        return OrderListResponse.builder()
                .id(String.valueOf(order.getId()))
                .date(order.getOrderDate())
                .items(items)
                .total(order.getTotal())
                .status(order.getStatus())
                .build();
    }

    private User findUser(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }
}

