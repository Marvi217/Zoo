package com.example.zoo.controller;

import com.example.zoo.SecurityHelper;
import com.example.zoo.dto.CartViewModel;
import com.example.zoo.dto.CheckoutForm;
import com.example.zoo.entity.*;
import com.example.zoo.enums.OrderStatus;
import com.example.zoo.enums.PaymentMethod;
import com.example.zoo.enums.DeliveryMethod;
import com.example.zoo.repository.OrderRepository;
import com.example.zoo.repository.UserCartRepository;
import com.example.zoo.repository.UserRepository;
import com.example.zoo.service.EmailService;
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
import java.util.stream.Collectors;

@Controller
@RequestMapping("/checkout")
@RequiredArgsConstructor
public class CheckoutController {

    private final OrderService orderService;
    private final UserRepository userRepository;
    private final SecurityHelper securityHelper;
    private final UserAddressService addressService;
    private final PromotionService promotionService;
    private final UserCartRepository userCartRepository;
    private final EmailService emailService;

    private static class CartData {
        BigDecimal total;
        List<CartItem> items;
        boolean isEmpty;

        CartData(BigDecimal total, List<CartItem> items, boolean isEmpty) {
            this.total = total;
            this.items = items;
            this.isEmpty = isEmpty;
        }
    }

    private CartData getCartData(HttpSession session) {
        User user = securityHelper.getCurrentUser(session);

        if (user != null) {
            UserCart userCart = userCartRepository.findByUser(user).orElse(null);
            if (userCart == null || userCart.isEmpty()) {
                return new CartData(BigDecimal.ZERO, new ArrayList<>(), true);
            }
            List<CartItem> items = userCart.getItems().stream()
                    .map(item -> new CartItem(item.getProduct(), item.getQuantity()))
                    .collect(Collectors.toList());
            return new CartData(userCart.getTotal(), items, false);
        } else {
            Cart cart = getSessionCart(session);
            return new CartData(cart.getTotal(), cart.getItems(), cart.isEmpty());
        }
    }

    private void clearCart(HttpSession session) {
        User user = securityHelper.getCurrentUser(session);

        if (user != null) {
            userCartRepository.findByUser(user).ifPresent(userCart -> {
                userCart.clear();
                userCartRepository.save(userCart);
            });
        } else {
            Cart cart = getSessionCart(session);
            cart.clear();
        }
    }

    @GetMapping
    public String showCheckout(HttpSession session, Model model) {
        CartData cartData = getCartData(session);
        if (cartData.isEmpty) {
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
            UserAddress defaultAddress = addressService.getDefaultAddress(user).orElse(null);
            model.addAttribute("defaultAddress", defaultAddress);
        }

        model.addAttribute("cartItems", cartData.items);
        model.addAttribute("total", cartData.total);
        model.addAttribute("isGuest", isGuest);
        model.addAttribute("checkoutForm", new CheckoutForm());
        model.addAttribute("cart", new CartViewModel(cartData.items, cartData.total));

        return "checkout";
    }

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
            @RequestParam(required = false) String inpostLockerId,
            @RequestParam(required = false) String inpostLockerName,
            @RequestParam(required = false) String inpostLockerAddress,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        CartData cartData = getCartData(session);

        if (cartData.isEmpty) {
            redirectAttributes.addFlashAttribute("error", "Koszyk jest pusty");
            return "redirect:/cart";
        }

        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            User currentUser = null;

            if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal())) {
                currentUser = userRepository.findByEmail(auth.getName()).orElse(null);
            }

            Order order = new Order();
            order.setUser(currentUser);
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

            Address address = null;

            if (addressId != null && currentUser != null) {
                UserAddress userAddress = addressService.getAddressById(addressId, currentUser)
                        .orElseThrow(() -> new IllegalArgumentException("Wybrany adres nie istnieje"));

                address = new Address();
                address.setStreet(userAddress.getStreet());
                address.setCity(userAddress.getCity());
                address.setZipCode(userAddress.getZipCode());
                address.setCountry(userAddress.getCountry());
            }
            else if (street != null && !street.isEmpty()) {
                address = new Address();
                address.setStreet(street);
                address.setCity(city);
                address.setZipCode(zipCode);
                address.setCountry(country != null ? country : "Poland");

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

                        UserAddress savedAddress = addressService.saveAddress(newUserAddress, currentUser);

                        System.out.println("✓ Adres został zapisany dla przyszłych zamówień");
                        System.out.println("  - ID: " + savedAddress.getId());
                        System.out.println("  - Label: " + savedAddress.getLabel());
                        System.out.println("  - Is Default: " + savedAddress.isDefault());
                    } catch (Exception e) {
                        System.err.println("⚠ Nie udało się zapisać adresu: " + e.getMessage());
                        e.printStackTrace();
                    }
                }
            }

            // Map form delivery method values to DeliveryMethod enum
            DeliveryMethod delivery;
            switch (deliveryMethod.toLowerCase()) {
                case "inpost":
                    delivery = DeliveryMethod.LOCKER;
                    break;
                case "pickup":
                    delivery = DeliveryMethod.PICKUP;
                    break;
                case "courier":
                default:
                    delivery = DeliveryMethod.COURIER;
                    break;
            }
            order.setDeliveryMethod(delivery);

            // Handle paczkomat (InPost locker) address
            if (delivery == DeliveryMethod.LOCKER && inpostLockerId != null && !inpostLockerId.isEmpty()) {
                address = new Address();
                String lockerName = inpostLockerName != null ? inpostLockerName : inpostLockerId;
                String lockerAddr = inpostLockerAddress != null ? inpostLockerAddress : "";
                
                // Parse address format: "street, zipCode city"
                String streetPart = "";
                String cityPart = "";
                String zipCodePart = "";
                
                if (!lockerAddr.isEmpty()) {
                    int commaIndex = lockerAddr.indexOf(',');
                    if (commaIndex > 0) {
                        streetPart = lockerAddr.substring(0, commaIndex).trim();
                        String rest = lockerAddr.substring(commaIndex + 1).trim();
                        // Try to extract zip code (format: XX-XXX) and city
                        if (rest.length() >= 6 && rest.charAt(2) == '-') {
                            zipCodePart = rest.substring(0, 6).trim();
                            cityPart = rest.substring(6).trim();
                        } else {
                            cityPart = rest;
                        }
                    } else {
                        streetPart = lockerAddr;
                    }
                }
                
                address.setStreet("Paczkomat " + lockerName + (streetPart.isEmpty() ? "" : ", " + streetPart));
                address.setCity(cityPart.isEmpty() ? "Paczkomat" : cityPart);
                address.setZipCode(zipCodePart.isEmpty() ? "00-000" : zipCodePart);
                address.setCountry("Poland");
            }

            order.setShippingAddress(address);

            BigDecimal deliveryCost = calculateDeliveryCost(delivery, cartData.total);
            order.setDeliveryCost(deliveryCost);

            try {
                order.setPaymentMethod(PaymentMethod.valueOf(paymentMethod));
            } catch (IllegalArgumentException e) {
                order.setPaymentMethod(PaymentMethod.CARD);
            }

            List<OrderItem> orderItems = new ArrayList<>();
            for (var cartItem : cartData.items) {
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

            order.setSubtotal(cartData.total);

            BigDecimal discountAmount = BigDecimal.ZERO;
            if (voucherCode != null && !voucherCode.trim().isEmpty()) {
                var promotionOpt = promotionService.getPromotionByCode(voucherCode.trim());
                if (promotionOpt.isPresent()) {
                    Promotion promotion = promotionOpt.get();
                    if (promotion.isCurrentlyActive() && promotion.isApplicableForAmount(cartData.total)) {
                        discountAmount = promotion.calculateDiscount(cartData.total);
                        order.setPromotion(promotion);
                        order.setDiscountAmount(discountAmount);

                        promotion.setCurrentUsage(promotion.getCurrentUsage() + 1);
                    }
                }
            }

            order.setTotalAmount(cartData.total.subtract(discountAmount).add(deliveryCost));

            orderService.save(order);

            System.out.println("=== NEW ORDER ===");
            System.out.println("Order Number: " + order.getOrderNumber());
            System.out.println("Customer Type: " + (currentUser != null ? "Logged User" : "Guest"));
            System.out.println("Customer Name: " + (currentUser != null ? currentUser.getFullName() : order.getGuestName()));
            System.out.println("Delivery Method: " + delivery);
            System.out.println("Address Saved: " + (Boolean.TRUE.equals(saveAddress) && currentUser != null ? "Yes" : "No"));

            clearCart(session);

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

    private Cart getSessionCart(HttpSession session) {
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