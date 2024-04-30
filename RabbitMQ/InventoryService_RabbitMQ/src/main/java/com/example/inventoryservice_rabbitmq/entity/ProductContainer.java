package com.example.inventoryservice_rabbitmq.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.stereotype.Component;

import java.util.List;

@Data
@AllArgsConstructor
@Component
@ToString
public class ProductContainer {
    public List<Product> products;
    public ProductContainer(){
        Product product1 = new Product("1002","product",3);
        Product product2 = new Product("1003","product",3);
        products = List.of(product1,product2);
    }

}