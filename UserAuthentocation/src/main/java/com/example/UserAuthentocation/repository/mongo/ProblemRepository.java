package com.example.UserAuthentocation.repository.mongo;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.example.UserAuthentocation.entity.Problem;

@Repository
public interface ProblemRepository extends MongoRepository<Problem, String> {
    List<Problem> findByDifficulty(String difficulty);
    List<Problem> findByTagsContaining(String tag);
    
    List<Problem> findByTitleContainingIgnoreCase(String title);
}
