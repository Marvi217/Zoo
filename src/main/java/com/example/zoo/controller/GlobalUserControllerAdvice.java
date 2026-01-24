package com.example.zoo.controller;

import com.example.zoo.entity.Category;
import com.example.zoo.entity.User;
import com.example.zoo.repository.UserRepository;
import com.example.zoo.service.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@ControllerAdvice
@RequiredArgsConstructor
public class GlobalUserControllerAdvice {

    private final UserRepository userRepository;
    private final CategoryService categoryService;

    @ModelAttribute("currentUser")
    public User addCurrentUserToModel(Authentication authentication) {
        if (authentication == null || !authentication.isAuthenticated()) {
            return null;
        }
        return userRepository.findByEmail(authentication.getName()).orElse(null);
    }

    @ModelAttribute("globalCategories")
    public List<Category> addCategoriesToModel() {
        return categoryService.getAllActiveCategories();
    }
}