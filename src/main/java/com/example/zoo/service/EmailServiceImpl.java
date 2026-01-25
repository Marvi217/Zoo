package com.example.zoo.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

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
}