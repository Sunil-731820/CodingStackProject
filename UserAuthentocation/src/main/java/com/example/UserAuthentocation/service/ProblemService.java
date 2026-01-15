package com.example.UserAuthentocation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
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
    
//    for Paginations okay 
    public Page<Problem> getProblems(Pageable pageable) {
        Query query = new Query().with(pageable);

        // Fetch paginated data
        List<Problem> problems = mongoTemplate.find(query, Problem.class);

        // Count total documents
        long total = mongoTemplate.count(new Query(), Problem.class);

        return new PageImpl<>(problems, pageable, total);
    }

    
    public void toggleSolved(String id) {
        Problem p = problemRepository.findById(id).orElse(null);
        if (p != null) {
            p.setSolved(!p.isSolved());
            problemRepository.save(p);
        }
    }
    
    
    public void toggleFavorite(String id) {
        Problem p = problemRepository.findById(id).orElse(null);
        if (p != null) {
            p.setFavorite(!p.isFavorite());
            problemRepository.save(p);
        }
    }

    public Problem getProblemById(String id) {
        return problemRepository.findById(id).orElse(null);
    }
}
