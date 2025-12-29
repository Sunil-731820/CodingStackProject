package com.example.UserAuthentocation.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.UserAuthentocation.entity.PasswordResetOtp;

public interface OtpRepository extends JpaRepository<PasswordResetOtp, Long> {
    PasswordResetOtp findByEmailAndOtp(String email, String otp);
}
