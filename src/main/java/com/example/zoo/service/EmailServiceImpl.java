package com.example.zoo.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

/**
 * Implementation of EmailService for sending email messages.
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class EmailServiceImpl implements EmailService {

    private final JavaMailSender mailSender;

    @Value("${app.base-url}")
    private String baseUrl;

    @Value("${spring.mail.username}")
    private String fromEmail;

    @Override
    public void sendEmail(String to, String subject, String text) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(to);
            message.setSubject(subject);
            message.setText(text);
            mailSender.send(message);
            log.info("Email sent successfully to: {}", to);
        } catch (Exception e) {
            log.error("Failed to send email to: {}", to, e);
            throw new RuntimeException("Nie udało się wysłać wiadomości email", e);
        }
    }

    @Override
    public void sendActivationEmail(String to, String activationCode) {
        String activationLink = baseUrl + "/activate?code=" + activationCode;
        String subject = "Aktywacja konta - Zoo";
        String text = "Witamy!\n\n" +
                "Dziękujemy za rejestrację w naszym sklepie Zoo.\n\n" +
                "Aby aktywować swoje konto, kliknij poniższy link:\n" +
                activationLink + "\n\n" +
                "Jeśli nie rejestrowałeś się w naszym serwisie, zignoruj tę wiadomość.\n\n" +
                "Pozdrawiamy,\n" +
                "Zespół Zoo";

        sendEmail(to, subject, text);
    }
}
