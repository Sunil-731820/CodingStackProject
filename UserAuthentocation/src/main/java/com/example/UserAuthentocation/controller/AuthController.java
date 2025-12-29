package com.example.UserAuthentocation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.UserAuthentocation.Exceptions.InvalidCredentialsException;
import com.example.UserAuthentocation.entity.User;
import com.example.UserAuthentocation.repository.UserRepository;

import jakarta.validation.Valid;


@Controller
public class AuthController {

	@Autowired
	UserRepository userRepository;

	@PostMapping("/signup")
	public String signup(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
	    
		 if (result.hasErrors()) {
	            // Get the first validation error
//	            model.addAttribute("errorMessage", result.getAllErrors().get(0).getDefaultMessage());
			// Collect all requireds fields error messages
		        List<String> errorMessages = result.getAllErrors()
		                                           .stream()
		                                           .map(e -> e.getDefaultMessage())
		                                           .toList();
		        model.addAttribute("errorMessages", errorMessages);
	            return "signup";
	        }
		
		user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
	    userRepository.save(user);
	    return "login";
	}

	@PostMapping("/login")
	public String login(String email, String password) {
		System.out.println("Calling the Login Methods:=");
	    User user = userRepository.findByEmail(email).orElseThrow(() -> new InvalidCredentialsException("Invalid Email & passowrd Please check once"));
	    
	    if (user != null &&
	        new BCryptPasswordEncoder().matches(password, user.getPassword())) {
	        return "home";
	    }
	    return "login";
	}



}
