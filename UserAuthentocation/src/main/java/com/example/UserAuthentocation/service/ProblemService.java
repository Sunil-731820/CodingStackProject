package com.example.UserAuthentocation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import com.example.UserAuthentocation.entity.Problem;
import com.example.UserAuthentocation.repository.mongo.ProblemRepository;

@Service
public class ProblemService {
    @Autowired
    private ProblemRepository problemRepository;
    
    @Autowired
    private MongoTemplate mongoTemplate;

    public List<Problem> getAllProblems() {
    	System.out.println("Calling the getAllProblems methods :=");
    	System.out.println("Mongo DB name = " + mongoTemplate.getDb().getName());
    	List<Problem> listofData = problemRepository.findAll();
    	System.out.println("The Size of the Data after fetching from The mongoDB is :"+listofData.size());
        return problemRepository.findAll();
    }

    public Problem getProblemById(String id) {
        return problemRepository.findById(id).orElse(null);
    }
}
