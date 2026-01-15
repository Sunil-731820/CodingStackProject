package com.example.UserAuthentocation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.UserAuthentocation.entity.Problem;
import com.example.UserAuthentocation.repository.mongo.ProblemRepository;
import com.example.UserAuthentocation.service.ProblemService;

@Controller
public class ProblemPaginationController {

    @Autowired
    private ProblemRepository problemRepository;
    
    @Autowired
    private ProblemService problemService;
    @GetMapping("/listOfproblems")
    public String listProblems(@RequestParam(defaultValue = "0") int page, Model model) {
        int pageSize = 20; // 20 per page
        PageRequest pageable = PageRequest.of(page, pageSize);

        Page<Problem> problemPage = problemService.getProblems(pageable);

        model.addAttribute("problems", problemPage.getContent());
        model.addAttribute("currentPage", problemPage.getNumber());
        model.addAttribute("totalPages", problemPage.getTotalPages());
        model.addAttribute("totalElements", problemPage.getTotalElements());
        System.out.println("Total elements: " + problemPage.getTotalElements());
   	  System.out.println("Total pages: " + problemPage.getTotalPages());
   	  System.out.println("Current page: " + problemPage.getNumber());

        return "problems";
    }


	/*
	 * @GetMapping("/listOfproblems") public String
	 * listProblems(@RequestParam(defaultValue = "0") int page, Model model) { int
	 * pageSize = 20; // 20 per page Pageable pageable = PageRequest.of(page,
	 * pageSize); Page<Problem> problemPage = problemRepository.findAll(pageable);
	 * 
	 * model.addAttribute("problems", problemPage.getContent());
	 * model.addAttribute("currentPage", problemPage.getNumber());
	 * model.addAttribute("totalPages", problemPage.getTotalPages());
	 * model.addAttribute("totalElements", problemPage.getTotalElements());
	 * System.out.println("Total elements: " + problemPage.getTotalElements());
	 * System.out.println("Total pages: " + problemPage.getTotalPages());
	 * System.out.println("Current page: " + problemPage.getNumber());
	 * 
	 * 
	 * return "problems"; }
	 */

}
