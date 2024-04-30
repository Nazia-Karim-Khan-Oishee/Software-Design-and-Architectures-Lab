package com.example.inventoryservice_rabbitmq.controller;

import com.example.inventoryservice_rabbitmq.Constants;
import com.example.inventoryservice_rabbitmq.entity.OrderStatus;
import com.example.inventoryservice_rabbitmq.entity.Product;
import com.example.inventoryservice_rabbitmq.entity.ProductContainer;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@Component
@RestController
@RequestMapping("/product")
public class InventoryController {

    @Autowired
    private final ProductContainer productContainer;

    public InventoryController(ProductContainer productContainer) {
        this.productContainer = productContainer;
    }


    @RabbitListener(queues = Constants.QUEUE)
    public void consumeMessageFromQueue(OrderStatus orderStatus) {

        System.out.println("Message Received from queue: " + orderStatus);

        String productID = orderStatus.getProductID();
//        System.out.println(productID);

        for(Product product: productContainer.products)
        {

            if(productID.equals(product.productId))
           {
               if(product.getQty()>0)
               {
                   System.out.println("This product is eligible for purchase.");
               }
               else {
                   System.out.println("This product is out of Stock.");

               }
           }
        }
    }


}