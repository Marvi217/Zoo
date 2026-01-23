package com.example.zoo.controller.admin;

import com.example.zoo.SecurityHelper;
import com.example.zoo.entity.Category;
import com.example.zoo.entity.User;
import com.example.zoo.enums.OrderStatus;
import com.example.zoo.service.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/main")
@RequiredArgsConstructor
public class AdminDashboardController {

    private final OrderService orderService;
    private final ProductService productService;
    private final UserService userService;
    private final ReviewService reviewService;
    private final CategoryService categoryService;
    private final SecurityHelper securityHelper;

    @GetMapping({"/dashboard"})
    public String showDashboard(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = securityHelper.getCurrentUser(session);

        if (currentUser == null || !currentUser.isAdmin()) {
            redirectAttributes.addFlashAttribute("error", "Brak dostępu");
            return "redirect:/";
        }

        // Statystyki ogólne
        model.addAttribute("totalOrders", orderService.getTotalOrdersCount());
        model.addAttribute("pendingOrders", orderService.getOrdersByStatus(OrderStatus.PENDING).size());
        model.addAttribute("totalRevenue", orderService.getTotalRevenue());

        // KLUCZOWE DLA WYKRESU: Dzisiejszy przychód i sprzedaż z 30 dni
        model.addAttribute("todayRevenue", orderService.getTodayRevenue()); // Musisz mieć tę metodę w serwisie
        Map<String, Double> weeklySales = orderService.getWeeklySalesStats();
        model.addAttribute("weeklySales", weeklySales);

        // Dane dla wykresu 30-dniowego (opcjonalnie)
        model.addAttribute("monthlySales", orderService.getMonthlySalesStats());

        // Kategorie i użytkownicy
        LocalDateTime thirtyDaysAgo = LocalDateTime.now().minusDays(30);
        model.addAttribute("newUsersThisMonth", userService.getNewUsersCount(thirtyDaysAgo, LocalDateTime.now()));
        model.addAttribute("averageRating", reviewService.getAverageRating());
        model.addAttribute("topCategories", getCategoryStats()); // Przeniesione do helpera poniżej

        model.addAttribute("recentOrders", orderService.getRecentOrders(5));
        model.addAttribute("currentUser", currentUser);

        return "admin/dashboard";
    }

    private List<Map<String, Object>> getCategoryStats() {
        List<Category> categories = categoryService.getTopCategories(4);
        List<Map<String, Object>> categoryStats = new ArrayList<>();
        for (Category cat : categories) {
            Map<String, Object> stat = new HashMap<>();
            stat.put("name", cat.getName());
            stat.put("icon", cat.getIcon());
            stat.put("percentage", categoryService.calculateCategoryPercentage(cat));
            categoryStats.add(stat);
        }
        return categoryStats;
    }

    /**
     * Strona zamówień
     */
    @GetMapping("/orders")
    public String showOrders(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = securityHelper.getCurrentUser(session);

        if (currentUser == null || !currentUser.isAdmin()) {
            redirectAttributes.addFlashAttribute("error", "Brak dostępu");
            return "redirect:/";
        }

        model.addAttribute("currentUser", currentUser);
        return "admin/orders";
    }

    /**
     * Strona produktów
     */
    @GetMapping("/products")
    public String showProducts(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = securityHelper.getCurrentUser(session);

        if (currentUser == null || !currentUser.isAdmin()) {
            redirectAttributes.addFlashAttribute("error", "Brak dostępu");
            return "redirect:/";
        }

        model.addAttribute("currentUser", currentUser);
        return "admin/products";
    }

    /**
     * Strona marek
     */
    @GetMapping("/brands")
    public String showBrands(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = securityHelper.getCurrentUser(session);

        if (currentUser == null || !currentUser.isAdmin()) {
            redirectAttributes.addFlashAttribute("error", "Brak dostępu");
            return "redirect:/";
        }

        model.addAttribute("currentUser", currentUser);
        return "admin/brands";
    }

    /**
     * Strona promocji
     */
    @GetMapping("/promotions")
    public String showPromotions(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = securityHelper.getCurrentUser(session);

        if (currentUser == null || !currentUser.isAdmin()) {
            redirectAttributes.addFlashAttribute("error", "Brak dostępu");
            return "redirect:/";
        }

        model.addAttribute("currentUser", currentUser);
        return "admin/promotions";
    }

    /**
     * Strona recenzji
     */
    @GetMapping("/reviews")
    public String showReviews(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = securityHelper.getCurrentUser(session);

        if (currentUser == null || !currentUser.isAdmin()) {
            redirectAttributes.addFlashAttribute("error", "Brak dostępu");
            return "redirect:/";
        }

        model.addAttribute("currentUser", currentUser);
        model.addAttribute("pendingReviews", reviewService.getPendingReviewsCount());
        return "admin/reviews";
    }

    /**
     * Strona użytkowników
     */
    @GetMapping("/users")
    public String showUsers(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = securityHelper.getCurrentUser(session);

        if (currentUser == null || !currentUser.isAdmin()) {
            redirectAttributes.addFlashAttribute("error", "Brak dostępu");
            return "redirect:/";
        }

        model.addAttribute("currentUser", currentUser);
        return "admin/users";
    }

    /**
     * Strona ustawień
     */
    @GetMapping("/settings")
    public String showSettings(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = securityHelper.getCurrentUser(session);

        if (currentUser == null || !currentUser.isAdmin()) {
            redirectAttributes.addFlashAttribute("error", "Brak dostępu");
            return "redirect:/";
        }

        model.addAttribute("currentUser", currentUser);
        return "admin/settings";
    }

    /**
     * Helper method - ostatnia aktywność (przykładowa)
     */
    private Map<String, Object> getRecentActivity() {
        Map<String, Object> activity = new HashMap<>();
        // Tu można dodać rzeczywistą logikę pobierania aktywności z bazy
        activity.put("lastOrderTime", LocalDateTime.now().minusMinutes(5));
        activity.put("lastReviewTime", LocalDateTime.now().minusMinutes(12));
        activity.put("lastUserRegistration", LocalDateTime.now().minusMinutes(25));
        return activity;
    }
}