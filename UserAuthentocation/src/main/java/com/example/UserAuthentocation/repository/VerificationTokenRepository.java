package com.example.UserAuthentocation.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.UserAuthentocation.entity.VerificationToken;

public interface VerificationTokenRepository extends JpaRepository<VerificationToken, Long> {

	VerificationToken findByToken(String token);
}
