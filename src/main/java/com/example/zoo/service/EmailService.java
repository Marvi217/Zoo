package com.example.zoo.service;

/**
 * Interface for sending email messages.
 */
public interface EmailService {

    /**
     * Sends a simple text email.
     *
     * @param to      recipient email address
     * @param subject email subject
     * @param text    email body text
     */
    void sendEmail(String to, String subject, String text);

    /**
     * Sends an activation email with a link to activate the user account.
     *
     * @param to             recipient email address
     * @param activationCode the activation code for the user
     */
    void sendActivationEmail(String to, String activationCode);
}
