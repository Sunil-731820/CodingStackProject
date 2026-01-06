package com.example.UserAuthentocation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.UserAuthentocation.entity.Problem;
import com.example.UserAuthentocation.repository.mongo.ProblemRepository;

@Controller
public class SolveProblemController {

    @Autowired
    private ProblemRepository problemRepository;

    @GetMapping("/solve/{id}")
    public String solveProblem(@PathVariable String id, Model model) {
        Problem problem = problemRepository.findById(id).orElse(null);
        model.addAttribute("problem", problem);
        return "SolveProblem"; // maps to SolveProblem.jsp
    }
}
