package com.example.zoo.controller;

import com.example.zoo.SecurityHelper;
import com.example.zoo.entity.*;
import com.example.zoo.repository.UserCartRepository;
import com.example.zoo.service.ProductService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {

    private final ProductService productService;
    private final SecurityHelper securityHelper;
    private final UserCartRepository userCartRepository;

    // Get session-based cart (for anonymous users)
    private Cart getSessionCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    // Get or create database-backed cart for logged-in user
    private UserCart getUserCart(User user) {
        return userCartRepository.findByUser(user)
                .orElseGet(() -> {
                    UserCart newCart = new UserCart(user);
                    return userCartRepository.save(newCart);
                });
    }

    // Check if user is logged in
    private boolean isLoggedIn(HttpSession session) {
        return securityHelper.getCurrentUser(session) != null;
    }

    // Merge session cart to user cart on login
    public void mergeSessionCartToUserCart(HttpSession session, User user) {
        Cart sessionCart = (Cart) session.getAttribute("cart");
        if (sessionCart != null && !sessionCart.isEmpty()) {
            UserCart userCart = getUserCart(user);
            for (CartItem item : sessionCart.getItems()) {
                userCart.addItem(item.getProduct(), item.getQuantity());
            }
            userCartRepository.save(userCart);
            session.removeAttribute("cart");
        }
    }

    // Wyświetl koszyk
    @GetMapping
    public String showCart(HttpSession session, Model model) {
        User user = securityHelper.getCurrentUser(session);
        
        if (user != null) {
            // Logged-in user - use database cart
            UserCart userCart = getUserCart(user);
            // Convert UserCartItems to CartItems for template compatibility
            List<CartItem> cartItems = userCart.getItems().stream()
                    .map(item -> new CartItem(item.getProduct(), item.getQuantity()))
                    .collect(Collectors.toList());
            model.addAttribute("cartItems", cartItems);
            model.addAttribute("total", userCart.getTotal());
        } else {
            // Anonymous user - use session cart
            Cart cart = getSessionCart(session);
            model.addAttribute("cartItems", cart.getItems());
            model.addAttribute("total", cart.getTotal());
        }
        return "cart";
    }

    // Dodaj produkt do koszyka
    @PostMapping("/add")
    public String addToCart(
            @RequestParam Long productId,
            @RequestParam(defaultValue = "1") Integer quantity,
            HttpSession session,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {

        try {
            Product product = productService.getProductById(productId);

            if (product == null) {
                redirectAttributes.addFlashAttribute("error", "Produkt nie został znaleziony");
                return "redirect:/";
            }

            if (!product.isAvailable()) {
                redirectAttributes.addFlashAttribute("error", "Produkt jest niedostępny");
                return "redirect:/product/" + productId;
            }

            User user = securityHelper.getCurrentUser(session);
            if (user != null) {
                // Logged-in user - use database cart
                UserCart userCart = getUserCart(user);
                userCart.addItem(product, quantity);
                userCartRepository.save(userCart);
            } else {
                // Anonymous user - use session cart
                Cart cart = getSessionCart(session);
                cart.addItem(product, quantity);
            }

            redirectAttributes.addFlashAttribute("success", "Produkt dodany do koszyka!");

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Wystąpił błąd podczas dodawania produktu");
        }

        String referer = request.getHeader("Referer");
        return "redirect:" + (referer != null ? referer : "/");
    }

    // Aktualizuj ilość (AJAX)
    @PostMapping("/update")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateCart(
            @RequestParam Long productId,
            @RequestParam(required = false) String action,
            HttpSession session) {

        try {
            User user = securityHelper.getCurrentUser(session);
            
            if (user != null) {
                // Logged-in user - use database cart
                UserCart userCart = getUserCart(user);
                
                if ("increase".equals(action)) {
                    userCart.getItems().stream()
                            .filter(item -> item.getProduct().getId().equals(productId))
                            .findFirst()
                            .ifPresent(item -> {
                                int newQty = item.getQuantity() + 1;
                                if (newQty <= 99) {
                                    item.setQuantity(newQty);
                                }
                            });
                } else if ("decrease".equals(action)) {
                    userCart.getItems().stream()
                            .filter(item -> item.getProduct().getId().equals(productId))
                            .findFirst()
                            .ifPresent(item -> {
                                int newQty = item.getQuantity() - 1;
                                if (newQty > 0) {
                                    item.setQuantity(newQty);
                                }
                            });
                }
                userCartRepository.save(userCart);
            } else {
                // Anonymous user - use session cart
                Cart cart = getSessionCart(session);

                if ("increase".equals(action)) {
                    cart.getItems().stream()
                            .filter(item -> item.getProduct().getId().equals(productId))
                            .findFirst()
                            .ifPresent(item -> {
                                int newQty = item.getQuantity() + 1;
                                if (newQty <= 99) {
                                    item.setQuantity(newQty);
                                }
                            });
                } else if ("decrease".equals(action)) {
                    cart.getItems().stream()
                            .filter(item -> item.getProduct().getId().equals(productId))
                            .findFirst()
                            .ifPresent(item -> {
                                int newQty = item.getQuantity() - 1;
                                if (newQty > 0) {
                                    item.setQuantity(newQty);
                                }
                            });
                }
            }

            return ResponseEntity.ok(Map.of(
                    "success", true,
                    "message", "Koszyk zaktualizowany"
            ));

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of(
                    "success", false,
                    "message", "Wystąpił błąd: " + e.getMessage()
            ));
        }
    }

    // Usuń produkt (AJAX) - POST
    @PostMapping("/remove/{productId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> removeFromCartAjax(
            @PathVariable Long productId,
            HttpSession session) {

        try {
            User user = securityHelper.getCurrentUser(session);
            
            if (user != null) {
                UserCart userCart = getUserCart(user);
                userCart.removeItem(productId);
                userCartRepository.save(userCart);
            } else {
                Cart cart = getSessionCart(session);
                cart.removeItem(productId);
            }

            return ResponseEntity.ok(Map.of(
                    "success", true,
                    "message", "Produkt usunięty"
            ));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of(
                    "success", false,
                    "error", e.getMessage()
            ));
        }
    }

    // Usuń produkt (link) - GET
    @GetMapping("/remove/{productId}")
    public String removeFromCart(
            @PathVariable Long productId,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        User user = securityHelper.getCurrentUser(session);
        
        if (user != null) {
            UserCart userCart = getUserCart(user);
            userCart.removeItem(productId);
            userCartRepository.save(userCart);
        } else {
            Cart cart = getSessionCart(session);
            cart.removeItem(productId);
        }

        redirectAttributes.addFlashAttribute("success", "Produkt usunięty z koszyka");
        return "redirect:/cart";
    }

    // Podsumowanie koszyka (AJAX)
    @GetMapping("/summary")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getCartSummary(HttpSession session) {
        User user = securityHelper.getCurrentUser(session);
        
        BigDecimal subtotal;
        int itemCount;
        int itemsSize;
        
        if (user != null) {
            UserCart userCart = getUserCart(user);
            subtotal = userCart.getTotal();
            itemCount = userCart.getTotalItems();
            itemsSize = userCart.getItems().size();
        } else {
            Cart cart = getSessionCart(session);
            subtotal = cart.getTotal();
            itemCount = cart.getTotalItems();
            itemsSize = cart.getItems().size();
        }

        return ResponseEntity.ok(Map.of(
                "subtotal", subtotal,
                "itemCount", itemCount,
                "items", itemsSize
        ));
    }

    // Liczba produktów (AJAX)
    @GetMapping("/count")
    @ResponseBody
    public ResponseEntity<Map<String, Integer>> getCartCount(HttpSession session) {
        User user = securityHelper.getCurrentUser(session);
        int count;
        
        if (user != null) {
            UserCart userCart = getUserCart(user);
            count = userCart.getTotalItems();
        } else {
            Cart cart = getSessionCart(session);
            count = cart.getTotalItems();
        }
        
        return ResponseEntity.ok(Map.of("count", count));
    }

    // Wyczyść koszyk
    @PostMapping("/clear")
    public String clearCart(HttpSession session, RedirectAttributes redirectAttributes) {
        User user = securityHelper.getCurrentUser(session);
        
        if (user != null) {
            UserCart userCart = getUserCart(user);
            userCart.clear();
            userCartRepository.save(userCart);
        } else {
            Cart cart = getSessionCart(session);
            cart.clear();
        }

        redirectAttributes.addFlashAttribute("success", "Koszyk został wyczyszczony");
        return "redirect:/cart";
    }

    @PostMapping("/add-async")
    @ResponseBody
    public ResponseEntity<?> addToCartAsync(
            @RequestParam Long productId,
            @RequestParam int quantity,
            HttpSession session) {

        try {
            Product product = productService.getProductById(productId);

            if (product == null) {
                return ResponseEntity.status(404).body("Nie znaleziono produktu");
            }

            User user = securityHelper.getCurrentUser(session);
            int totalItems;
            
            if (user != null) {
                UserCart userCart = getUserCart(user);
                userCart.addItem(product, quantity);
                userCartRepository.save(userCart);
                totalItems = userCart.getTotalItems();
            } else {
                Cart cart = getSessionCart(session);
                cart.addItem(product, quantity);
                totalItems = cart.getTotalItems();
            }

            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("totalItems", totalItems);

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Błąd: " + e.getMessage());
        }
    }
}