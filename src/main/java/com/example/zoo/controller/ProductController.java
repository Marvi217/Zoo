package com.example.zoo.controller;

import com.example.zoo.SecurityHelper;
import com.example.zoo.StarHelper;
import com.example.zoo.entity.Product;
import com.example.zoo.entity.Review;
import com.example.zoo.entity.User;
import com.example.zoo.enums.ReviewStatus;
import com.example.zoo.repository.ReviewRepository;
import com.example.zoo.service.OrderService;
import com.example.zoo.service.ProductService;
import com.example.zoo.service.ReviewService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/product")
public class ProductController {

    private final ProductService productService;
    private final ReviewRepository reviewRepository;
    private final ReviewService reviewService;
    private final OrderService orderService;
    private final SecurityHelper securityHelper;

    public ProductController(ProductService productService,
                             ReviewRepository reviewRepository,
                             ReviewService reviewService,
                             OrderService orderService,
                             SecurityHelper securityHelper) {
        this.productService = productService;
        this.reviewRepository = reviewRepository;
        this.reviewService = reviewService;
        this.orderService = orderService;
        this.securityHelper = securityHelper;
    }

    @GetMapping("/{id}")
    public String showProduct(@PathVariable Long id, Model model, HttpSession session) {
        Product product = productService.getProductById(id);

        List<Review> reviews = reviewRepository.findByProductOrderByCreatedAtDesc(product)
                .stream()
                .filter(r -> r.getStatus() == ReviewStatus.APPROVED)
                .collect(Collectors.toList());

        List<Product> relatedProducts = productService.getProductsByCategory(product.getCategory())
                .stream()
                .filter(p -> !p.getId().equals(id))
                .limit(4)
                .toList();

        User currentUser = securityHelper.getCurrentUser(session);
        boolean canReview = false;
        boolean hasReviewed = false;

        if (currentUser != null) {
            canReview = orderService.canUserReviewProduct(currentUser.getId(), id);
            hasReviewed = reviewService.hasUserReviewedProduct(currentUser.getId(), id);
        }

        model.addAttribute("starHelper", new StarHelper());
        model.addAttribute("product", product);
        model.addAttribute("reviews", reviews);
        model.addAttribute("relatedProducts", relatedProducts);
        model.addAttribute("canReview", canReview && !hasReviewed);
        model.addAttribute("hasReviewed", hasReviewed);
        model.addAttribute("reviewCount", reviews.size());

        return "product";
    }

    @PostMapping("/{id}/review")
    public String addReview(@PathVariable Long id,
                            @RequestParam int rating,
                            @RequestParam(required = false) String comment,
                            HttpSession session,
                            RedirectAttributes redirectAttributes) {

        User currentUser = securityHelper.getCurrentUser(session);

        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Musisz być zalogowany, aby dodać opinię");
            return "redirect:/login?returnUrl=/product/" + id;
        }

        if (!orderService.canUserReviewProduct(currentUser.getId(), id)) {
            redirectAttributes.addFlashAttribute("error", "Możesz oceniać tylko produkty które kupiłeś i otrzymałeś");
            return "redirect:/product/" + id;
        }

        if (reviewService.hasUserReviewedProduct(currentUser.getId(), id)) {
            redirectAttributes.addFlashAttribute("error", "Już oceniłeś ten produkt");
            return "redirect:/product/" + id;
        }

        if (rating < 1 || rating > 5) {
            redirectAttributes.addFlashAttribute("error", "Ocena musi być w zakresie 1-5");
            return "redirect:/product/" + id;
        }

        try {
            reviewService.createCustomerReview(id, currentUser, rating, comment);
            redirectAttributes.addFlashAttribute("success", "Dziękujemy za opinię! Twoja recenzja została opublikowana.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Błąd podczas dodawania opinii: " + e.getMessage());
        }

        return "redirect:/product/" + id;
    }
}