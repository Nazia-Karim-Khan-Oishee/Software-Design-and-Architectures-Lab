package com.example.orderservice.Repository;

import com.example.orderservice.Entity.Order;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends MongoRepository<Order, String> {
    Order findOrderById(String userId);
}