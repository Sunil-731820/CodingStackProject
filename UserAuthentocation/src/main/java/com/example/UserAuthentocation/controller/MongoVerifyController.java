package com.example.UserAuthentocation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MongoVerifyController {

    @Autowired
    MongoTemplate mongoTemplate;

    @GetMapping("/mongo-db")
    public String db() {
    	System.out.println("Calling tge Db for MongoDB :"+mongoTemplate.getDb().getName());
        return mongoTemplate.getDb().getName();
    }
}
