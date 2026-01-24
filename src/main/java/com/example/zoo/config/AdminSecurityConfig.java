package com.example.zoo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;

/**
 * Admin security is handled by SecurityConfig.
 * This class is kept for @EnableMethodSecurity annotation.
 * Admin login uses the regular /login page and CustomLoginSuccessHandler
 * redirects admins to /admin/main/dashboard after successful login.
 */
@Configuration
@EnableMethodSecurity
public class AdminSecurityConfig {
    // Admin security filter chain removed - using unified security config
    // to avoid conflicts between multiple filter chains.
    // Admin authorization is handled in SecurityConfig with:
    // .requestMatchers("/admin/**").hasRole("ADMIN")
}