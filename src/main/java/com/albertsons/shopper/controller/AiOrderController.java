package com.albertsons.shopper.controller;

import com.albertsons.shopper.ai.OrderApiTools;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/ai")
public class AiOrderController {

    private final ChatClient chatClient;
    private final OrderApiTools orderApiTools;

    public AiOrderController(ChatClient.Builder chatClientBuilder,
                             OrderApiTools orderApiTools) {
        this.chatClient = chatClientBuilder.build();
        this.orderApiTools = orderApiTools;
    }

    @GetMapping("/ask")
    public String ask(@RequestParam("q") String question) {
        return chatClient.prompt()
                .system("""
                        You are a shopping analytics assistant.
                        If the user asks about frequently bought products,
                        top products, customer product preferences,
                        or purchases in the last 90 days,
                        use the available tool to fetch real data.
                        """)
                .user(question)
                .tools(orderApiTools)
                .call()
                .content();
    }

}
