package com.example.zoo.controller;

import com.example.zoo.SecurityHelper;
import com.example.zoo.entity.*;
import com.example.zoo.enums.OrderStatus;
import com.example.zoo.enums.PaymentMethod;
import com.example.zoo.enums.DeliveryMethod;
import com.example.zoo.repository.OrderRepository;
import com.example.zoo.repository.UserRepository;
import com.example.zoo.service.OrderService;
import com.example.zoo.service.PromotionService;
import com.example.zoo.service.UserAddressService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/checkout")
@RequiredArgsConstructor
public class CheckoutController {

    private final OrderService orderService;
    private final UserRepository userRepository;
    private final SecurityHelper securityHelper;
    private final UserAddressService addressService;
    private final PromotionService promotionService;

    @GetMapping
    public String showCheckout(HttpSession session, Model model) {
        Cart cart = getCart(session);
        if (cart.isEmpty()) {
            return "redirect:/cart";
        }

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        boolean isGuest = auth == null || !auth.isAuthenticated() ||
                "anonymousUser".equals(auth.getPrincipal());

        List<UserAddress> savedAddresses;
        if (!isGuest) {
            User user = securityHelper.getCurrentUser(session);
            savedAddresses = addressService.getUserAddresses(user);
            model.addAttribute("user", user);
            model.addAttribute("savedAddresses", savedAddresses);
        }

        model.addAttribute("cartItems", cart.getItems());
        model.addAttribute("total", cart.getTotal());
        model.addAttribute("isGuest", isGuest);

        return "checkout";
    }

    /**
     * Walidacja kodu rabatowego (AJAX)
     */
    @GetMapping("/validate-voucher")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> validateVoucher(
            @RequestParam String code,
            @RequestParam BigDecimal total) {
        
        Map<String, Object> response = new HashMap<>();
        
        return promotionService.getPromotionByCode(code)
                .map(promotion -> {
                    if (!promotion.isCurrentlyActive()) {
                        response.put("valid", false);
                        response.put("message", "Ten kod promocyjny wygasł lub jest nieaktywny");
                        return ResponseEntity.ok(response);
                    }
                    
                    if (!promotion.isApplicableForAmount(total)) {
                        response.put("valid", false);
                        response.put("message", "Minimalna wartość zamówienia: " + promotion.getMinOrderAmount() + " zł");
                        return ResponseEntity.ok(response);
                    }
                    
                    BigDecimal discount = promotion.calculateDiscount(total);
                    response.put("valid", true);
                    response.put("discount", discount);
                    response.put("promotionId", promotion.getId());
                    response.put("message", "Kod zastosowany! Zniżka: " + discount.setScale(2) + " zł");
                    return ResponseEntity.ok(response);
                })
                .orElseGet(() -> {
                    response.put("valid", false);
                    response.put("message", "Nieprawidłowy kod rabatowy");
                    return ResponseEntity.ok(response);
                });
    }

    @PostMapping("/process")
    public String processCheckout(
            @RequestParam(required = false) String email,
            @RequestParam(required = false, name = "shippingName") String name,
            @RequestParam(required = false, name = "shippingPhone") String phone,
            @RequestParam(required = false, name = "shippingStreet") String street,
            @RequestParam(required = false, name = "shippingCity") String city,
            @RequestParam(required = false, name = "shippingZipCode") String zipCode,
            @RequestParam(defaultValue = "Poland", name = "shippingCountry") String country,
            @RequestParam String deliveryMethod,
            @RequestParam String paymentMethod,
            @RequestParam(required = false) Long addressId,
            @RequestParam(required = false) Boolean saveAddress,
            @RequestParam(required = false) String voucherCode,
            @RequestParam(required = false) String addressLabel,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        Cart cart = getCart(session);

        if (cart.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Koszyk jest pusty");
            return "redirect:/cart";
        }

        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            User currentUser = null;

            // Sprawdzanie czy użytkownik jest zalogowany
            if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal())) {
                currentUser = userRepository.findByEmail(auth.getName()).orElse(null);
            }

            Order order = new Order();
            order.setUser(currentUser); // Może być null dla gościa
            order.setOrderNumber(generateOrderNumber());
            order.setOrderDate(LocalDateTime.now());
            order.setStatus(OrderStatus.PENDING);

            if (currentUser != null) {
                order.setGuestName(currentUser.getFullName());
                order.setGuestEmail(currentUser.getEmail());
                order.setGuestPhone(phone != null ? phone : "");
            } else {
                order.setGuestName(name);
                order.setGuestEmail(email);
                order.setGuestPhone(phone);
            }

            // ✅ OBSŁUGA ADRESU - WYBÓR ZAPISANEGO LUB NOWY
            Address address = null;

            // Jeśli użytkownik wybrał zapisany adres
            if (addressId != null && currentUser != null) {
                UserAddress userAddress = addressService.getAddressById(addressId, currentUser)
                        .orElseThrow(() -> new IllegalArgumentException("Wybrany adres nie istnieje"));

                address = new Address();
                address.setStreet(userAddress.getStreet());
                address.setCity(userAddress.getCity());
                address.setZipCode(userAddress.getZipCode());
                address.setCountry(userAddress.getCountry());
            }
            // Jeśli podano nowy adres
            else if (street != null && !street.isEmpty()) {
                address = new Address();
                address.setStreet(street);
                address.setCity(city);
                address.setZipCode(zipCode);
                address.setCountry(country != null ? country : "Poland");

                // ✅ ZAPISZ ADRES JEŚLI UŻYTKOWNIK ZAZNACZY CHECKBOX
                if (Boolean.TRUE.equals(saveAddress) && currentUser != null) {
                    try {
                        UserAddress newUserAddress = new UserAddress();
                        newUserAddress.setUser(currentUser);
                        newUserAddress.setLabel(addressLabel != null && !addressLabel.isEmpty()
                                ? addressLabel
                                : "Adres z zamówienia " + LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd.MM.yyyy")));
                        newUserAddress.setName(currentUser.getFullName());
                        newUserAddress.setStreet(street);
                        newUserAddress.setCity(city);
                        newUserAddress.setZipCode(zipCode);
                        newUserAddress.setCountry(country != null ? country : "Poland");
                        newUserAddress.setPhoneNumber(phone);

                        // ✅ OPCJA 3: Użyj zwróconej wartości
                        UserAddress savedAddress = addressService.saveAddress(newUserAddress, currentUser);

                        System.out.println("✓ Adres został zapisany dla przyszłych zamówień");
                        System.out.println("  - ID: " + savedAddress.getId());
                        System.out.println("  - Label: " + savedAddress.getLabel());
                        System.out.println("  - Is Default: " + savedAddress.isDefault());
                    } catch (Exception e) {
                        // Nie przerywaj procesu zamówienia jeśli zapisanie adresu się nie powiodło
                        System.err.println("⚠ Nie udało się zapisać adresu: " + e.getMessage());
                        e.printStackTrace();
                    }
                }
            }

            order.setShippingAddress(address);

            DeliveryMethod delivery;
            try {
                delivery = DeliveryMethod.valueOf(deliveryMethod);
            } catch (IllegalArgumentException e) {
                delivery = DeliveryMethod.COURIER;
            }
            order.setDeliveryMethod(delivery);

            BigDecimal deliveryCost = calculateDeliveryCost(delivery, cart.getTotal());
            order.setDeliveryCost(deliveryCost);

            // Obsługa Metody Płatności
            try {
                order.setPaymentMethod(PaymentMethod.valueOf(paymentMethod));
            } catch (IllegalArgumentException e) {
                order.setPaymentMethod(PaymentMethod.CARD);
            }

            List<OrderItem> orderItems = new ArrayList<>();
            for (var cartItem : cart.getItems()) {
                OrderItem orderItem = new OrderItem();
                orderItem.setOrder(order);
                orderItem.setProduct(cartItem.getProduct());
                orderItem.setQuantity(cartItem.getQuantity());

                BigDecimal price = cartItem.getProduct().getPrice();
                if (price == null) {
                    price = BigDecimal.ZERO;
                }
                orderItem.setPrice(price);
                orderItems.add(orderItem);
            }
            order.setItems(orderItems);

            order.setSubtotal(cart.getTotal());
            
            // Obsługa kodu rabatowego (voucher)
            BigDecimal discountAmount = BigDecimal.ZERO;
            if (voucherCode != null && !voucherCode.trim().isEmpty()) {
                var promotionOpt = promotionService.getPromotionByCode(voucherCode.trim());
                if (promotionOpt.isPresent()) {
                    Promotion promotion = promotionOpt.get();
                    if (promotion.isCurrentlyActive() && promotion.isApplicableForAmount(cart.getTotal())) {
                        discountAmount = promotion.calculateDiscount(cart.getTotal());
                        order.setPromotion(promotion);
                        order.setDiscountAmount(discountAmount);
                        
                        // Zwiększ licznik użyć promocji
                        promotion.setCurrentUsage(promotion.getCurrentUsage() + 1);
                    }
                }
            }
            
            order.setTotalAmount(cart.getTotal().subtract(discountAmount).add(deliveryCost));

            orderService.save(order);

            System.out.println("=== NEW ORDER ===");
            System.out.println("Order Number: " + order.getOrderNumber());
            System.out.println("Customer Type: " + (currentUser != null ? "Logged User" : "Guest"));
            System.out.println("Customer Name: " + (currentUser != null ? currentUser.getFullName() : order.getGuestName()));
            System.out.println("Delivery Method: " + delivery);
            System.out.println("Address Saved: " + (Boolean.TRUE.equals(saveAddress) && currentUser != null ? "Yes" : "No"));

            cart.clear();

            redirectAttributes.addFlashAttribute("orderNumber", order.getOrderNumber());
            redirectAttributes.addFlashAttribute("success", "Zamówienie zostało złożone!");
            return "redirect:/checkout/confirmation";

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Błąd podczas składania zamówienia: " + e.getMessage());
            return "redirect:/checkout";
        }
    }

    @GetMapping("/confirmation")
    public String orderConfirmation(Model model) {
        return "order-success";
    }

    private Cart getCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    private String generateOrderNumber() {
        return "ORD-" + System.currentTimeMillis();
    }

    private BigDecimal calculateDeliveryCost(DeliveryMethod method, BigDecimal cartTotal) {
        if (cartTotal.compareTo(new BigDecimal("199")) >= 0) {
            return BigDecimal.ZERO;
        }
        return method.getPrice();
    }
}