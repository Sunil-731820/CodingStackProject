package com.example.UserAuthentocation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class NavigateToSolveproblemNavigationsTest {

    @GetMapping("/NavigateToSolveproblem")
    public String solveProblemPage() {
        return "solveProblem"; // loads the solveProblem called  solveProblem.jsp
    }
}
