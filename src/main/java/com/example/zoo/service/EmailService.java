package com.example.zoo.service;

import com.example.zoo.entity.Order;

public interface EmailService {

    void sendSimpleMessage(String to, String subject, String text);

    void sendActivationEmail(String to, String activationCode);

    void sendShippingNotification(Order order);
}