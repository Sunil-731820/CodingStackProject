package com.example.UserAuthentocation.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.UserAuthentocation.entity.Problem;
import com.example.UserAuthentocation.repository.mongo.ProblemRepository;
import com.example.UserAuthentocation.service.ProblemService;
import com.example.UserAuthentocation.service.UserProblemStatusService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/problems")
public class ProblemController {

    @Autowired
    private ProblemRepository problemRepository;
    
    @Autowired
    private ProblemService problemService;
    
    @Autowired
    private UserProblemStatusService userProblemStatusService;
    

    @GetMapping
    public String getProblems(Model model,HttpServletRequest req,HttpSession session) {
    	String email = (String) session.getAttribute("loggedInUserEmail");
    	 List<Problem> problems = problemService.getAllProblems();
    	 System.out.println("The Size of the List From Backend Side is :"+problems.size());
    	 for (Problem p : problems) {
    		 userProblemStatusService.repo
                 .findByUserEmailAndProblemId(email, p.getId())
                 .ifPresent(s -> {
                     p.setSolved(s.isSolved());
                     p.setFavorite(s.isFavorite());
                 });
         }
//        model.addAttribute("problems",problems);
//        String userEmail = (String) session.getAttribute("loggedInUserEmail");
//        System.out.println("The logged In user Email is :"+userEmail);
//        long solvedCount =
//                userProblemStatusService.solvedCount(userEmail);
//
//        int totalProblems = problems.size();
//
//        request.setAttribute("solvedCount", solvedCount);
//        request.setAttribute("totalProblems", totalProblems);
    	 req.setAttribute("problems", problems);
         req.setAttribute("solvedCount", userProblemStatusService.solvedCount(email));
         req.setAttribute("totalProblems", problems.size());
        return "problems"; // problems.jsp
    }
    
    @PostMapping("/solved")
    @ResponseBody
    public void solve(@RequestParam String problemId, HttpSession session) {
    	userProblemStatusService.markSolved(
            (String) session.getAttribute("loggedInUserEmail"), problemId);
    }
    
    @PostMapping("/favorite")
    @ResponseBody
    public void favorite(@RequestParam String problemId, HttpSession session) {
    	userProblemStatusService.toggleFavorite(
            (String) session.getAttribute("loggedInUserEmail"), problemId);
    }
    
    @GetMapping("/solved")
    public String solved(HttpSession session, HttpServletRequest req) {
        String email = (String) session.getAttribute("loggedInUserEmail");

        List<Problem> list = userProblemStatusService.solvedProblems(email).stream()
            .map(s -> problemService.getProblemById(s.getProblemId()))
            .toList();

        req.setAttribute("problems", list);
        return "solved";
    }
    
    
    @GetMapping("/favorites")
    public String favorites(HttpSession session, HttpServletRequest req) {
        String email = (String) session.getAttribute("loggedInUserEmail");

        List<Problem> list = userProblemStatusService.favoriteProblems(email).stream()
            .map(s -> problemService.getProblemById(s.getProblemId()))
            .toList();

        req.setAttribute("problems", list);
        return "favorites";
    }
    
    @GetMapping("/editor/{id}")
    public String editorPage(@PathVariable String id, Model model) {
        Problem problem = problemRepository.findById(id).orElse(null);
        model.addAttribute("problem", problem);
        return "editor"; // JSP page with Monaco + problem statement
    }
    
    
    @GetMapping("/{id}")
    public ResponseEntity<Problem> getProblem(@PathVariable String id) {
        return problemRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }



    

}
