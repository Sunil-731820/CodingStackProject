package com.example.UserAuthentocation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.webmvc.autoconfigure.error.ErrorMvcAutoConfiguration;

@SpringBootApplication(exclude = {ErrorMvcAutoConfiguration.class})
public class UserAuthentocationApplication {

    public static void main(String[] args) {
        SpringApplication.run(UserAuthentocationApplication.class, args);
    }
}
