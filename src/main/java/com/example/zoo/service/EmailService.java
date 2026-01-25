package com.example.zoo.service;

public interface EmailService {

    void sendSimpleMessage(String to, String subject, String text);

    void sendActivationEmail(String to, String activationCode);
}