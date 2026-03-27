package com.albertsons.shopper.services;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SmartCartAiClient {

    private static final Logger log = LoggerFactory.getLogger(SmartCartAiClient.class);

    private final RestTemplate restTemplate;
    private final String baseUrl;

    public SmartCartAiClient(@Value("${smartcart.ai.base-url:http://localhost:8000}") String baseUrl) {
        this.restTemplate = new RestTemplate();
        this.baseUrl = baseUrl;
    }

    // ── Request / Response DTOs ─────────────────────────────

    public record OrderHistoryEntry(
            @JsonProperty("product_name") String productName,
            @JsonProperty("quantity") int quantity,
            @JsonProperty("order_date") String orderDate
    ) {}

    @JsonIgnoreProperties(ignoreUnknown = true)
    public record SponsoredCandidate(
            @JsonProperty("product_name") String productName,
            @JsonProperty("price") double price,
            @JsonProperty("relevance_score") double relevanceScore,
            @JsonProperty("price_advantage") double priceAdvantage,
            @JsonProperty("reason") String reason
    ) {}

    @JsonIgnoreProperties(ignoreUnknown = true)
    public record PredictedItem(
            @JsonProperty("product_name") String productName,
            @JsonProperty("confidence") double confidence,
            @JsonProperty("frequency") String frequency,
            @JsonProperty("reason") String reason,
            @JsonProperty("sponsored_candidates") List<SponsoredCandidate> sponsoredCandidates
    ) {}

    @JsonIgnoreProperties(ignoreUnknown = true)
    public record PredictCartResponse(
            @JsonProperty("predicted_items") List<PredictedItem> predictedItems
    ) {}

    @JsonIgnoreProperties(ignoreUnknown = true)
    public record DetectIntentResponse(
            @JsonProperty("intent") String intent,
            @JsonProperty("confidence") double confidence
    ) {}

    @JsonIgnoreProperties(ignoreUnknown = true)
    public record ExplainResponse(
            @JsonProperty("reason") String reason
    ) {}

    // ── API calls ───────────────────────────────────────────

    private HttpHeaders jsonHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        return headers;
    }

    public PredictCartResponse predictCart(String userId,
                                           List<OrderHistoryEntry> orderHistory,
                                           List<String> currentCart,
                                           List<Map<String, Object>> sponsoredProductsWithPrices,
                                           Map<String, Double> productPrices) {
        log.info("Calling AI predict-cart for user={} with {} history entries", userId, orderHistory.size());
        try {
            List<Map<String, Object>> historyMaps = orderHistory.stream()
                    .map(e -> Map.<String, Object>of(
                            "product_name", e.productName(),
                            "quantity", e.quantity(),
                            "order_date", e.orderDate()))
                    .toList();
            Map<String, Object> body = new HashMap<>();
            body.put("user_id", userId);
            body.put("order_history", historyMaps);
            body.put("cart", currentCart);
            body.put("sponsored_products", sponsoredProductsWithPrices);
            body.put("product_prices", productPrices);

            HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, jsonHeaders());
            ResponseEntity<PredictCartResponse> response = restTemplate.postForEntity(
                    baseUrl + "/predict-cart", request, PredictCartResponse.class);
            PredictCartResponse result = response.getBody();
            log.info("AI predict-cart returned {} items", result != null ? result.predictedItems().size() : 0);
            return result != null ? result : new PredictCartResponse(List.of());
        } catch (Exception e) {
            log.error("AI predict-cart call failed: {}", e.getMessage());
            return new PredictCartResponse(List.of());
        }
    }

    public DetectIntentResponse detectIntent(String query) {
        log.info("Calling AI detect-intent for query='{}'", query);
        try {
            HttpEntity<Map<String, String>> request = new HttpEntity<>(
                    Map.of("query", query), jsonHeaders());
            ResponseEntity<DetectIntentResponse> response = restTemplate.postForEntity(
                    baseUrl + "/detect-intent", request, DetectIntentResponse.class);
            return response.getBody();
        } catch (Exception e) {
            log.error("AI detect-intent call failed: {}", e.getMessage());
            return new DetectIntentResponse("meal", 0.5);
        }
    }

    public ExplainResponse explain(String item, String userPattern) {
        log.info("Calling AI explain for item='{}'", item);
        try {
            HttpEntity<Map<String, String>> request = new HttpEntity<>(
                    Map.of("item", item, "user_pattern", userPattern), jsonHeaders());
            ResponseEntity<ExplainResponse> response = restTemplate.postForEntity(
                    baseUrl + "/explain", request, ExplainResponse.class);
            return response.getBody();
        } catch (Exception e) {
            log.error("AI explain call failed: {}", e.getMessage());
            return new ExplainResponse("Added based on your purchase history.");
        }
    }
}
