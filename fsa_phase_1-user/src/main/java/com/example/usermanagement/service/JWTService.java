package com.example.usermanagement.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;


public interface JWTService {
    String extractUserEmail(String token);

    boolean isTokenValid(String token, UserDetails userDetails);

    String generateToken(UserDetails userDetails);

    String generateRefreshToken(UserDetails userDetails);

    boolean isTokenExpired(String token);
}
