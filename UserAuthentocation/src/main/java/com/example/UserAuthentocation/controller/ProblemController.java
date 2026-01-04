package com.example.UserAuthentocation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.UserAuthentocation.entity.Problem;
import com.example.UserAuthentocation.repository.mongo.ProblemRepository;
import com.example.UserAuthentocation.service.ProblemService;


@Controller
@RequestMapping("/problems")
public class ProblemController {

    @Autowired
    private ProblemRepository problemRepository;
    
    @Autowired
    private ProblemService problemService;

    @GetMapping
    public String getProblems(Model model) {
    	 List<Problem> problems = problemService.getAllProblems();
    	 System.out.println("The Size of the List From Backend Side is :"+problems.size());
        model.addAttribute("problems",problems);
        return "problems"; // problems.jsp
    }
    
    @PostMapping("/solved")
    @ResponseBody
    public void solved(@RequestParam String id) {
    	problemService.toggleSolved(id);
    }
    
    @PostMapping("/favorite")
    @ResponseBody
    public void favorite(@RequestParam String id) {
    	problemService.toggleFavorite(id);
    }

}
