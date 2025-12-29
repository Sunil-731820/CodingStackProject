package com.example.UserAuthentocation.handler;


import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.example.UserAuthentocation.Exceptions.OtpExpiredException;
import com.example.UserAuthentocation.Exceptions.OtpInvalidException;


@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(OtpInvalidException.class)
    public String handleInvalidOtp(OtpInvalidException ex, Model model) {
        model.addAttribute("errorMessage", ex.getMessage());
        return "verify-otp"; // return OTP verification page with error
    }

    @ExceptionHandler(OtpExpiredException.class)
    public String handleOtpExpired(OtpExpiredException ex, Model model) {
        model.addAttribute("errorMessage", ex.getMessage());
        return "verify-otp"; // return OTP verification page with error
    }
}
