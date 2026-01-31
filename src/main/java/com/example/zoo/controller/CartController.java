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

    private Cart getSessionCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    private UserCart getUserCart(User user) {
        return userCartRepository.findByUser(user)
                .orElseGet(() -> {
                    UserCart newCart = new UserCart(user);
                    return userCartRepository.save(newCart);
                });
    }

    private boolean isLoggedIn(HttpSession session) {
        return securityHelper.getCurrentUser(session) != null;
    }

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

    @GetMapping
    public String showCart(HttpSession session, Model model) {
        User user = securityHelper.getCurrentUser(session);

        if (user != null) {
            UserCart userCart = getUserCart(user);
            // Convert UserCart items to Cart for template compatibility
            Cart cart = new Cart();
            userCart.getItems().forEach(item -> cart.addItem(item.getProduct(), item.getQuantity()));
            model.addAttribute("cart", cart);
            model.addAttribute("cartItems", cart.getItems());
            model.addAttribute("total", cart.getTotal());
        } else {
            Cart cart = getSessionCart(session);
            model.addAttribute("cart", cart);
            model.addAttribute("cartItems", cart.getItems());
            model.addAttribute("total", cart.getTotal());
        }
        return "cart";
    }

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

            // Check stock availability
            int currentInCart = 0;
            User user = securityHelper.getCurrentUser(session);
            if (user != null) {
                UserCart userCart = getUserCart(user);
                currentInCart = userCart.getItems().stream()
                        .filter(item -> item.getProduct().getId().equals(productId))
                        .findFirst()
                        .map(item -> item.getQuantity())
                        .orElse(0);
            } else {
                Cart cart = getSessionCart(session);
                currentInCart = cart.getItems().stream()
                        .filter(item -> item.getProduct().getId().equals(productId))
                        .findFirst()
                        .map(item -> item.getQuantity())
                        .orElse(0);
            }

            int totalRequested = currentInCart + quantity;
            if (totalRequested > product.getStockQuantity()) {
                int canAdd = product.getStockQuantity() - currentInCart;
                if (canAdd <= 0) {
                    redirectAttributes.addFlashAttribute("error", 
                            "Nie możesz dodać więcej sztuk tego produktu. Maksymalna ilość: " + product.getStockQuantity());
                } else {
                    redirectAttributes.addFlashAttribute("error", 
                            "Możesz dodać jeszcze tylko " + canAdd + " szt. tego produktu (dostępne: " + product.getStockQuantity() + ")");
                }
                return "redirect:/product/" + productId;
            }

            if (user != null) {
                UserCart userCart = getUserCart(user);
                userCart.addItem(product, quantity);
                userCartRepository.save(userCart);
            } else {
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

    @PostMapping("/update")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateCart(
            @RequestParam Long productId,
            @RequestParam(required = false) String action,
            HttpSession session) {

        try {
            Product product = productService.getProductById(productId);
            int stockQuantity = product.getStockQuantity();
            
            User user = securityHelper.getCurrentUser(session);

            if (user != null) {
                UserCart userCart = getUserCart(user);

                if ("increase".equals(action)) {
                    userCart.getItems().stream()
                            .filter(item -> item.getProduct().getId().equals(productId))
                            .findFirst()
                            .ifPresent(item -> {
                                int newQty = item.getQuantity() + 1;
                                if (newQty <= stockQuantity) {
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
                Cart cart = getSessionCart(session);

                if ("increase".equals(action)) {
                    cart.getItems().stream()
                            .filter(item -> item.getProduct().getId().equals(productId))
                            .findFirst()
                            .ifPresent(item -> {
                                int newQty = item.getQuantity() + 1;
                                if (newQty <= stockQuantity) {
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

    @PostMapping("/clear-async")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> clearCartAsync(HttpSession session) {
        try {
            User user = securityHelper.getCurrentUser(session);

            if (user != null) {
                UserCart userCart = getUserCart(user);
                userCart.clear();
                userCartRepository.save(userCart);
            } else {
                Cart cart = getSessionCart(session);
                cart.clear();
            }

            return ResponseEntity.ok(Map.of(
                    "success", true,
                    "message", "Koszyk został wyczyszczony"
            ));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of(
                    "success", false,
                    "message", "Wystąpił błąd: " + e.getMessage()
            ));
        }
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

            if (!product.isAvailable()) {
                return ResponseEntity.status(400).body("Produkt jest niedostępny");
            }

            // Check stock availability
            int currentInCart = 0;
            User user = securityHelper.getCurrentUser(session);
            if (user != null) {
                UserCart userCart = getUserCart(user);
                currentInCart = userCart.getItems().stream()
                        .filter(item -> item.getProduct().getId().equals(productId))
                        .findFirst()
                        .map(item -> item.getQuantity())
                        .orElse(0);
            } else {
                Cart cart = getSessionCart(session);
                currentInCart = cart.getItems().stream()
                        .filter(item -> item.getProduct().getId().equals(productId))
                        .findFirst()
                        .map(item -> item.getQuantity())
                        .orElse(0);
            }

            int totalRequested = currentInCart + quantity;
            if (totalRequested > product.getStockQuantity()) {
                int canAdd = product.getStockQuantity() - currentInCart;
                if (canAdd <= 0) {
                    return ResponseEntity.status(400).body(
                            "Nie możesz dodać więcej sztuk tego produktu. Maksymalna ilość: " + product.getStockQuantity());
                } else {
                    return ResponseEntity.status(400).body(
                            "Możesz dodać jeszcze tylko " + canAdd + " szt. tego produktu");
                }
            }

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