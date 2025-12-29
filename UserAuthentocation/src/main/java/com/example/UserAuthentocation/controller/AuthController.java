package com.example.UserAuthentocation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.UserAuthentocation.entity.User;
import com.example.UserAuthentocation.repository.UserRepository;


@Controller
public class AuthController {

	@Autowired
	UserRepository userRepository;

	@PostMapping("/signup")
	public String signup(User user) {
	    user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
	    userRepository.save(user);
	    return "login";
	}

	@PostMapping("/login")
	public String login(String email, String password) {
	    User user = userRepository.findByEmail(email).orElse(null);

	    if (user != null &&
	        new BCryptPasswordEncoder().matches(password, user.getPassword())) {
	        return "home";
	    }
	    return "login";
	}



}
