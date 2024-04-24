package com.example.orderservice.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "orders")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    @Id
    private String id;
    @Field
    private String productID;
    @Field
    private String employeeID;
    @Field
    private String customerID;

    public String getProductId() {
        return  productID;
    }

    public String getCustomerId() {
        return customerID;
    }

    public String getEmployeeId() {
        return employeeID;
    }
}