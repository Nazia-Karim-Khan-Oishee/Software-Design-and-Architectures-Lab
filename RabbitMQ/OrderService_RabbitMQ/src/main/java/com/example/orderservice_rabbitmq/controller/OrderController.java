package com.example.orderservice_rabbitmq.controller;

import com.example.orderservice_rabbitmq.Constants;
import com.example.orderservice_rabbitmq.entity.Order;
import com.example.orderservice_rabbitmq.entity.OrderStatus;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.UUID;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private RabbitTemplate rabbitTemplate;

//    @PostMapping("/{restaurantName}")
//    public String bookOrder(@RequestBody Order order, @PathVariable String restaurantName) {
//        order.setOrderId(UUID.randomUUID().toString());
//        OrderStatus orderStatus = new OrderStatus(order, "PROCESS", "Order Successfully Placed to " + restaurantName);
//        rabbitTemplate.convertAndSend(Constants.EXCHANGE, Constants.ROUTING_KEY, orderStatus);
//        return "success!!";
//    }

    @PostMapping("/{restaurantName}/{productID}")
    public String bookOrderWithProductID(@RequestBody Order order, @PathVariable String restaurantName, @PathVariable String productID) {
        order.setOrderId(UUID.randomUUID().toString());

        OrderStatus orderStatus = new OrderStatus(order, "PROCESS", "Order Successfully Placed to " + restaurantName, ""+ productID);
        System.out.println("Order created for product " + productID);
        rabbitTemplate.convertAndSend(Constants.EXCHANGE, Constants.ROUTING_KEY, orderStatus);
        return "Orders created for product " + productID + " !!";
    }


}