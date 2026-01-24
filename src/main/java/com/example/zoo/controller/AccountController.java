package com.example.zoo.controller;

import com.example.zoo.SecurityHelper;
import com.example.zoo.dto.OrderStatsDto;
import com.example.zoo.entity.Order;
import com.example.zoo.entity.OrderItem;
import com.example.zoo.entity.Product;
import com.example.zoo.entity.User;
import com.example.zoo.enums.OrderStatus;
import com.example.zoo.enums.UserRole;
import com.example.zoo.service.OrderService;
import com.example.zoo.service.ProductService;
import com.example.zoo.service.UserService;
import com.example.zoo.service.WishlistService;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/account")
@RequiredArgsConstructor
public class AccountController {

    private final UserService userService;
    private final OrderService orderService;
    private final WishlistService wishlistService;
    private final SecurityHelper securityHelper;
    private final ProductService productService;

    @GetMapping
    public String showAccount(Model model, HttpSession session) {
        User user = securityHelper.getCurrentUser(session);

        if (user == null) {
            return "redirect:/login";
        }

        long count = orderService.getTotalOrdersCount(user);
        BigDecimal spent = orderService.getTotalAmountSpent(user);

        List<Order> recentOrders = orderService.findRecentByUser(user, 3);
        OrderStatsDto orderStats = new OrderStatsDto(count, spent);

        long wishlistCount = wishlistService.getWishlistCount(user.getId());

        model.addAttribute("user", user);
        model.addAttribute("orderStats", orderStats);
        model.addAttribute("recentOrders", recentOrders);
        model.addAttribute("wishlistCount", wishlistCount);

        return "account/account";
    }

    @GetMapping("/orders")
    public String orders(Model model, @AuthenticationPrincipal UserDetails userDetails) {
        User user = userService.findByEmail(userDetails.getUsername());
        model.addAttribute("user", user);
        model.addAttribute("orders", orderService.findAllByUser(user));
        model.addAttribute("activePage", "orders");
        return "account/orders";
    }

    @GetMapping("/profile")
    public String profile(Model model, @AuthenticationPrincipal UserDetails userDetails) {
        User user = userService.findByEmail(userDetails.getUsername());
        model.addAttribute("user", user);
        model.addAttribute("activePage", "profile");
        return "account/profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@RequestParam String firstName,
                                @RequestParam String lastName,
                                @RequestParam String phone,
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {
        try {
            User currentUser = securityHelper.getCurrentUser(session);

            if (currentUser != null) {
                currentUser.setFirstName(firstName);
                currentUser.setLastName(lastName);
                currentUser.setPhone(phone);

                userService.save(currentUser);

                session.setAttribute("user", currentUser);

                redirectAttributes.addFlashAttribute("success", "Dane zostały zaktualizowane!");
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Błąd podczas aktualizacji danych.");
        }
        return "redirect:/account/profile";
    }

    @GetMapping("/security")
    public String security(Model model, @AuthenticationPrincipal UserDetails userDetails) {
        User user = userService.findByEmail(userDetails.getUsername());
        model.addAttribute("user", user);
        model.addAttribute("activePage", "security");
        return "account/security";
    }

    @GetMapping("/orders/{id}")
    public String showOrderDetails(@PathVariable Long id, HttpSession session, Model model) {
        User user = securityHelper.getCurrentUser(session);

        if (user == null) {
            return "redirect:/login?returnUrl=/account/orders/" + id;
        }

        Order order = orderService.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Zamówienie nie istnieje"));

        if (!order.getUser().getId().equals(user.getId())) {
            return "redirect:/account/orders";
        }

        model.addAttribute("order", order);
        model.addAttribute("user", user);

        return "account/order-details";
    }

    @PostMapping("/security/update-password")
    public String updatePassword(@RequestParam String currentPassword,
                                 @RequestParam String newPassword,
                                 @RequestParam String confirmPassword,
                                 @AuthenticationPrincipal UserDetails userDetails,
                                 RedirectAttributes redirectAttributes) {

        if (!newPassword.equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("error", "Nowe hasła nie są identyczne.");
            return "redirect:/account/security";
        }

        try {
            userService.changePassword(userDetails.getUsername(), currentPassword, newPassword);
            redirectAttributes.addFlashAttribute("success", true);
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }

        return "redirect:/account/security";
    }

    @PostMapping("/orders/{id}/cancel")
    public String cancelOrder(@PathVariable("id") Long id,
                              HttpSession session,
                              RedirectAttributes redirectAttributes) {
        User currentUser = securityHelper.getCurrentUser(session);
        if (currentUser == null) return "redirect:/login";

        try {
            orderService.findById(id)
                    .orElseThrow(() -> new IllegalArgumentException("Nie znaleziono zamówienia."));

            orderService.cancelOrder(id, currentUser);

            redirectAttributes.addFlashAttribute("success", "Zamówienie zostało pomyślnie anulowane.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Nie udało się anulować zamówienia: " + e.getMessage());
        }

        return "redirect:/account";
    }
}