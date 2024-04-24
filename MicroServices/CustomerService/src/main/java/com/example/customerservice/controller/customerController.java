package com.example.customerservice.controller;

import com.example.customerservice.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.example.customerservice.service.customerService;

@RestController
@RequestMapping("/customers")
public class customerController {
    @Autowired
    private customerService customerService;
    @PostMapping("/")
    public Customer saveCustomer(@RequestBody Customer customer){
        return customerService.saveCustomer(customer);
    }
    @GetMapping("/{id}")
    public Customer findCustomerById(@PathVariable("id") String cutomerId){
        return customerService.findCustomerById(cutomerId);
    }
}