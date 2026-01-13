package com.example.UserAuthentocation.service;

import org.springframework.stereotype.Service;

import com.example.UserAuthentocation.entity.Submission;
import com.example.UserAuthentocation.repository.jpa.SubmissionRepository;

import java.util.List;

@Service
public class SubmissionService {
    private final SubmissionRepository submissionRepo;

    public SubmissionService(SubmissionRepository submissionRepo) {
        this.submissionRepo = submissionRepo;
    }

    public Submission saveSubmission(Submission submission) {
        return submissionRepo.save(submission);
    }

    public List<Submission> getSubmissionsByUser(String userId) {
        return submissionRepo.findByUserId(userId);
    }

    public List<Submission> getSubmissionsByProblem(String problemId) {
        return submissionRepo.findByProblemId(problemId);
    }
}
