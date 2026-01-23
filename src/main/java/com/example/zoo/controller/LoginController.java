package com.example.zoo.controller;

import com.example.zoo.entity.User;
import com.example.zoo.enums.UserRole;
import com.example.zoo.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/login")
@RequiredArgsConstructor
public class LoginController {
    private final UserService userService;

    @GetMapping()
    public String showLoginPage() {
        return "login";
    }

    @PostMapping()
    public String login(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        try {
            User user = userService.authenticate(email, password);

            if (user != null) {
                session.setAttribute("user", user);

                // Przekierowanie w zależności od roli użytkownika
                if (user.getRole() == UserRole.ADMIN || user.getRole() == UserRole.SUPERUSER) {
                    return "redirect:/admin/dashboard/main";
                } else {
                    return "redirect:/";
                }
            } else {
                redirectAttributes.addFlashAttribute("error", "Nieprawidłowy email lub hasło");
                return "redirect:/login";
            }

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Błąd logowania");
            return "redirect:/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.invalidate();
        redirectAttributes.addFlashAttribute("success", "Zostałeś wylogowany");
        return "redirect:/login";
    }
}