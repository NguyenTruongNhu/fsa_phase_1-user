package com.example.usermanagement.service;

import jakarta.mail.MessagingException;
import org.springframework.stereotype.Service;

@Service
public interface MailService {
    public void sendEmail(String to, String subject, String text) throws MessagingException;
}
