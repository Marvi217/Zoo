package com.example.zoo.controller;

import com.example.zoo.dto.UserRegistrationDto;
import com.example.zoo.entity.User;
import com.example.zoo.enums.UserRole;
import com.example.zoo.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new UserRegistrationDto());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") UserRegistrationDto dto,
                               RedirectAttributes redirectAttributes) {
        try {
            User user = new User();
            user.setEmail(dto.getEmail());
            user.setFirstName(dto.getFirstName());
            user.setLastName(dto.getLastName());
            user.setPassword(dto.getPassword());
            user.setRole(UserRole.USER);

            userService.register(user);

            redirectAttributes.addFlashAttribute("success",
                    "Rejestracja zakończona pomyślnie! Sprawdź swoją skrzynkę email, aby aktywować konto.");
            return "redirect:/login?registered=true";
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/register";
        }
    }

    @GetMapping("/activate")
    public String activateAccount(@RequestParam("code") String code,
                                  RedirectAttributes redirectAttributes) {
        boolean activated = userService.activateUser(code);

        if (activated) {
            redirectAttributes.addFlashAttribute("success",
                    "Twoje konto zostało aktywowane! Możesz się teraz zalogować.");
        } else {
            redirectAttributes.addFlashAttribute("error",
                    "Nieprawidłowy lub wygasły kod aktywacyjny.");
        }

        return "redirect:/login";
    }
}