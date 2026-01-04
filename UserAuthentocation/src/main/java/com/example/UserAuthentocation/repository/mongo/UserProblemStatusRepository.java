package com.example.UserAuthentocation.repository.mongo;


import java.util.List;
import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.UserAuthentocation.entity.UserProblemStatus;


public interface UserProblemStatusRepository
        extends MongoRepository<UserProblemStatus, String> {

    Optional<UserProblemStatus> findByUserEmailAndProblemId(
            String userEmail, String problemId);

    List<UserProblemStatus> findByUserEmailAndSolvedTrue(String userEmail);
}
