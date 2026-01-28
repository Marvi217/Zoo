package com.example.zoo.service;

import com.example.zoo.entity.Order;
import com.example.zoo.enums.DeliveryMethod;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.example.zoo.entity.Order;
import com.example.zoo.entity.OrderItem;
import com.example.zoo.enums.DeliveryMethod;
import java.math.BigDecimal;

@Slf4j
@Service
@RequiredArgsConstructor
public class EmailServiceImpl implements EmailService {

    private final JavaMailSender mailSender;

    @Value("${app.base-url:http://localhost:8088}")
    private String baseUrl;

    @Value("${spring.mail.username}")
    private String fromEmail;

    @Override
    public void sendSimpleMessage(String to, String subject, String text) {
        try {
            log.info("Wysyłanie wiadomości email do: {}", to);
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(to);
            message.setSubject(subject);
            message.setText(text);

            mailSender.send(message);
            log.info("Email został wysłany pomyślnie.");
        } catch (MailException e) {
            log.error("Błąd wysyłania emaila do {}: {}", to, e.getMessage());
            throw new RuntimeException("Nie udało się wysłać wiadomości email", e);
        }
    }

    @Override
    public void sendActivationEmail(String to, String activationCode) {
        String activationLink = baseUrl + "/activate?code=" + activationCode;

        String subject = "Aktywacja konta - Zoo";
        String text = String.format(
                "Witamy!\n\n" +
                        "Dziękujemy za rejestrację w naszym sklepie Zoo.\n\n" +
                        "Aby aktywować swoje konto, kliknij poniższy link:\n" +
                        "%s\n\n" +
                        "Jeśli nie rejestrowałeś się w naszym serwisie, zignoruj tę wiadomość.\n\n" +
                        "Pozdrawiamy,\n" +
                        "Zespół Zoo",
                activationLink);

        sendSimpleMessage(to, subject, text);
    }

    @Override
    public void sendShippingNotification(Order order) {
        String customerEmail = order.getCustomerEmail();
        String customerName = order.getCustomerName();
        String trackingNumber = order.getTrackingNumber();
        String carrierName = order.getDeliveryMethod() != null
                ? order.getDeliveryMethod().getDescription()
                : "Kurier";

        String subject = "Twoje zamówienie #" + order.getOrderNumber() + " zostało wysłane!";

        String trackingInfo = "";
        if (order.getDeliveryMethod() == DeliveryMethod.LOCKER) {
            trackingInfo = "Możesz śledzić przesyłkę na stronie: https://inpost.pl/sledzenie-przesylek?number=" + trackingNumber;
        } else if (order.getDeliveryMethod() == DeliveryMethod.COURIER) {
            trackingInfo = "Numer przesyłki do śledzenia: " + trackingNumber;
        }

        String text = String.format(
                "Cześć %s!\n\n" +
                        "Mamy świetne wieści - Twoje zamówienie #%s zostało właśnie wysłane!\n\n" +
                        "Szczegóły przesyłki:\n" +
                        "- Przewoźnik: %s\n" +
                        "- Numer przesyłki: %s\n\n" +
                        "%s\n\n" +
                        "Dziękujemy za zakupy w naszym sklepie!\n\n" +
                        "Pozdrawiamy,\n" +
                        "Zespół PetMarket",
                customerName != null ? customerName : "Kliencie",
                order.getOrderNumber(),
                carrierName,
                trackingNumber,
                trackingInfo);

        sendSimpleMessage(customerEmail, subject, text);
        log.info("Wysłano powiadomienie o wysyłce do {} dla zamówienia {}", customerEmail, order.getOrderNumber());
    }

    @Override
    public void sendOrderConfirmationEmail(Order order) {
        String to = order.getCustomerEmail();
        if (to == null || to.isEmpty()) {
            log.warn("Brak adresu email dla zamówienia {}", order.getOrderNumber());
            return;
        }
        String subject = "Potwierdzenie zamówienia #" + order.getOrderNumber() + " - PetMarket";
        StringBuilder itemsList = new StringBuilder();
        if (order.getItems() != null) {
            for (OrderItem item : order.getItems()) {
                String productName = item.getProduct() != null ? item.getProduct().getName() : "Produkt";
                BigDecimal price = item.getPrice() != null ? item.getPrice() : BigDecimal.ZERO;
                int quantity = item.getQuantity();
                BigDecimal itemTotal = price.multiply(BigDecimal.valueOf(quantity));
                itemsList.append(String.format("- %s x%d: %.2f zł\n",
                        productName, quantity, itemTotal));
            }
        }
        StringBuilder text = new StringBuilder();
        text.append("Dziękujemy za złożenie zamówienia w PetMarket!\n\n");
        text.append("Numer zamówienia: ").append(order.getOrderNumber()).append("\n\n");
        text.append("=== ZAMÓWIONE PRODUKTY ===\n");
        text.append(itemsList);
        text.append("\n");
        if (order.getSubtotal() != null) {
            text.append("Wartość produktów: ").append(String.format("%.2f zł", order.getSubtotal())).append("\n");
        }
        if (order.getDeliveryCost() != null && order.getDeliveryCost().compareTo(BigDecimal.ZERO) > 0) {
            text.append("Koszt dostawy: ").append(String.format("%.2f zł", order.getDeliveryCost())).append("\n");
        }
        if (order.getDiscountAmount() != null && order.getDiscountAmount().compareTo(BigDecimal.ZERO) > 0) {
            text.append("Rabat: -").append(String.format("%.2f zł", order.getDiscountAmount())).append("\n");
        }
        text.append("\n");
        text.append("SUMA: ").append(String.format("%.2f zł", order.getTotalAmount())).append("\n\n");
        // Shipping notification - only add if NOT pickup
        if (order.getDeliveryMethod() != DeliveryMethod.PICKUP) {
            text.append("Zostaniesz powiadomiony, gdy przesyłka zostanie wysłana.\n\n");
        }
        text.append("Dziękujemy za zakupy!\n");
        text.append("Zespół PetMarket");
        try {
            sendSimpleMessage(to, subject, text.toString());
            log.info("Wysłano potwierdzenie zamówienia {} na adres {}", order.getOrderNumber(), to);
        } catch (Exception e) {
            log.error("Nie udało się wysłać potwierdzenia zamówienia {} na adres {}: {}",
                    order.getOrderNumber(), to, e.getMessage());
        }
    }
}