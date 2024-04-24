package com.example.orderservice.controller;

import com.example.orderservice.Entity.Order;
import com.example.orderservice.Service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/orders")
public class orderController {
    @Autowired
    private OrderService orderService;
    @PostMapping("/")
    public Order saveOrder(@RequestBody Order order){
        return orderService.saveOrder(order);
    }
    @GetMapping("/{id}")
    public Order findOrderById(@PathVariable("id") String orderId){
        return orderService.findOrderById(orderId);
    }
}