package com.example.UserAuthentocation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.UserAuthentocation.Exceptions.InvalidCredentialsException;
import com.example.UserAuthentocation.entity.User;
import com.example.UserAuthentocation.repository.UserRepository;

@Service
public class LoginWithGoogleService {
	
	@Autowired
    private UserRepository userRepository;
	 public User loginWithGoogle(String email, String name) {

	        User user = userRepository.findByEmail(email).orElse(null);

	        //First-time Google login → auto-register
	        if (user == null) {
	            user = new User();
	            user.setEmail(email);
	            user.setName(name);
	            user.setEnabled(true);
	            user.setPassword(null);
	            user.setAuthProvider("GOOGLE");;

	            return userRepository.save(user);
	        }

	        //  Existing LOCAL user tries Google login
	        if (!"GOOGLE".equals(user.getAuthProvider())) {
	            throw new InvalidCredentialsException(
	                    "This email is registered with " + user.getAuthProvider());
	        }

	        // Existing Google user
	        return user;
	    }


}
