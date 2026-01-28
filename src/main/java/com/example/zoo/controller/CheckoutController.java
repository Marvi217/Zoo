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
        model.addAttribute("deliveryMethods", DeliveryMethod.values());
        model.addAttribute("paymentMethods", PaymentMethod.values());

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
            DeliveryMethod delivery = mapDeliveryMethod(deliveryMethod);

            // Handle InPost locker - use locker address as shipping address
            if (delivery == DeliveryMethod.LOCKER && inpostLockerAddress != null && !inpostLockerAddress.isEmpty()) {
                address = new Address();
                // Parse InPost locker address (format: "street, city" or just address)
                String lockerAddress = inpostLockerAddress;
                String lockerCity = "";
                if (lockerAddress.contains(",")) {
                    String[] parts = lockerAddress.split(",", 2);
                    address.setStreet(parts[0].trim());
                    lockerCity = parts.length > 1 ? parts[1].trim() : "";
                    address.setCity(lockerCity);
                } else {
                    address.setStreet(lockerAddress);
                    address.setCity("");
                }
                address.setZipCode("");
                address.setCountry("Poland");

                // Add locker name to notes
                if (inpostLockerName != null && !inpostLockerName.isEmpty()) {
                    order.setNotes((order.getNotes() != null ? order.getNotes() + "\n" : "") +
                            "Paczkomat InPost: " + inpostLockerName);
                }
            } else if (addressId != null && currentUser != null) {
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

            order.setShippingAddress(address);

            order.setDeliveryMethod(delivery);

            BigDecimal deliveryCost = calculateDeliveryCost(delivery, cartData.total);
            order.setDeliveryCost(deliveryCost);

            PaymentMethod payment = mapPaymentMethod(paymentMethod);
            order.setPaymentMethod(payment);
            BigDecimal paymentFee = payment.getPrice();

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

            order.setTotalAmount(cartData.total.subtract(discountAmount).add(deliveryCost).add(paymentFee));

            orderService.save(order);

            System.out.println("=== NEW ORDER ===");
            System.out.println("Order Number: " + order.getOrderNumber());
            System.out.println("Customer Type: " + (currentUser != null ? "Logged User" : "Guest"));
            System.out.println("Customer Name: " + (currentUser != null ? currentUser.getFullName() : order.getGuestName()));
            System.out.println("Delivery Method: " + delivery);
            System.out.println("Address Saved: " + (Boolean.TRUE.equals(saveAddress) && currentUser != null ? "Yes" : "No"));

            clearCart(session);

            // Redirect to payment gateway simulation
            return "redirect:/checkout/payment?orderNumber=" + order.getOrderNumber();

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Błąd podczas składania zamówienia: " + e.getMessage());
            return "redirect:/checkout";
        }
    }

    @GetMapping("/payment")
    public String showPaymentGateway(@RequestParam String orderNumber, Model model, RedirectAttributes redirectAttributes) {
        try {
            Order order = orderService.getOrderByNumber(orderNumber);
            model.addAttribute("order", order);
            return "payment-gateway";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Zamówienie nie zostało znalezione");
            return "redirect:/";
        }
    }

    @PostMapping("/payment/simulate")
    public String simulatePayment(
            @RequestParam String orderNumber,
            @RequestParam String status,
            RedirectAttributes redirectAttributes) {

        try {
            Order order = orderService.getOrderByNumber(orderNumber);

            switch (status.toUpperCase()) {
                case "PAID":
                    order.setPaymentStatus(com.example.zoo.enums.PaymentStatus.PAID);
                    order.setStatus(OrderStatus.CONFIRMED);
                    orderService.save(order);

                    // Send confirmation email
                    try {
                        emailService.sendOrderConfirmationEmail(order);
                    } catch (Exception e) {
                        System.err.println("Nie udało się wysłać emaila: " + e.getMessage());
                    }

                    redirectAttributes.addFlashAttribute("orderNumber", order.getOrderNumber());
                    redirectAttributes.addFlashAttribute("success", "Płatność zakończona sukcesem!");
                    return "redirect:/checkout/confirmation";

                case "FAILED":
                    order.setPaymentStatus(com.example.zoo.enums.PaymentStatus.FAILED);
                    orderService.save(order);
                    redirectAttributes.addFlashAttribute("error", "Płatność nie powiodła się. Spróbuj ponownie.");
                    return "redirect:/checkout/payment?orderNumber=" + orderNumber;

                case "CANCELLED":
                    order.setPaymentStatus(com.example.zoo.enums.PaymentStatus.CANCELLED);
                    order.setStatus(OrderStatus.CANCELLED);
                    orderService.save(order);
                    redirectAttributes.addFlashAttribute("error", "Płatność została anulowana.");
                    return "redirect:/";

                default:
                    redirectAttributes.addFlashAttribute("error", "Nieznany status płatności");
                    return "redirect:/checkout/payment?orderNumber=" + orderNumber;
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Błąd podczas przetwarzania płatności: " + e.getMessage());
            return "redirect:/";
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

    private DeliveryMethod mapDeliveryMethod(String method) {
        if (method == null) {
            return DeliveryMethod.COURIER;
        }
        return switch (method.toLowerCase()) {
            case "courier" -> DeliveryMethod.COURIER;
            case "inpost" -> DeliveryMethod.LOCKER;
            case "pickup" -> DeliveryMethod.PICKUP;
            default -> DeliveryMethod.COURIER;
        };
    }

    private PaymentMethod mapPaymentMethod(String method) {
        if (method == null) {
            return PaymentMethod.CARD;
        }
        return switch (method.toLowerCase()) {
            case "transfer" -> PaymentMethod.TRANSFER;
            case "cod" -> PaymentMethod.CASH_ON_DELIVERY;
            case "blik" -> PaymentMethod.BLIK;
            default -> PaymentMethod.CARD;
        };
    }
}