package com.albertsons.shopper.ai;


import org.springframework.ai.tool.annotation.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;

@Component
public class OrderApiTools {

    private final RestClient restClient;

    @Autowired
    public OrderApiTools(RestClient.Builder builder) {
        this.restClient = builder.baseUrl("http://localhost:9191").build();
    }

    @Tool(description = "Call the orders analytics API and return frequently bought products for a customer.")
    public String getFrequentlyBoughtProductsFromApi(Long customerId, Integer days, Integer limit) {
        int safeDays = (days == null || days <= 0) ? 90 : days;
        int safeLimit = (limit == null || limit <= 0) ? 10 : limit;

        return restClient.get()
                .uri(uriBuilder -> uriBuilder
                        .path("/api/orders/customers/{customerId}/frequently-bought-products")
                        .queryParam("days", safeDays)
                        .queryParam("limit", safeLimit)
                        .build(customerId))
                .retrieve()
                .body(String.class);
    }
}
