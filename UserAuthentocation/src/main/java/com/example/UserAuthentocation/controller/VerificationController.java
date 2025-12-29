package com.example.UserAuthentocation.controller;


import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.UserAuthentocation.entity.User;
import com.example.UserAuthentocation.entity.VerificationToken;
import com.example.UserAuthentocation.repository.UserRepository;
import com.example.UserAuthentocation.repository.VerificationTokenRepository;


@Controller
public class VerificationController {

    @Autowired
    private VerificationTokenRepository tokenRepository;

    @Autowired
    private UserRepository userRepository;

    /**
     * Email verification endpoint
     * Example URL:
     * http://localhost:8080/verify-email?token=abc123
     */
    @GetMapping("/verify-email")
    public String verifyEmail(@RequestParam("token") String token,
                              Model model) {

        // 1. Find token
        VerificationToken verificationToken =
                tokenRepository.findByToken(token);

        if (verificationToken == null) {
            model.addAttribute("errorMessage",
                    "Invalid verification link.");
            return "login";
        }

        // 2. Check expiry
        if (verificationToken.getExpiryTime()
                .isBefore(LocalDateTime.now())) {

            model.addAttribute("errorMessage",
                    "Verification link has expired.");
            return "login";
        }

        // 3. Enable user
        User user = verificationToken.getUser();
        user.setEnabled(true);
        userRepository.save(user);

        // 4. Delete token (one-time use)
        tokenRepository.delete(verificationToken);

        // 5. Success message
        model.addAttribute("successMessage",
                "Email verified successfully. You can now login.");

        return "login";
    }
}
