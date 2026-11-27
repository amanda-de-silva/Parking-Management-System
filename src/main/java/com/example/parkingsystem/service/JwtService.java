package com.example.parkingsystem.service;

import com.example.parkingsystem.model.User;

public interface JwtService {
    String generateToken(User user);
    String extractUsername(String token);
    boolean validateToken(String token, String email);
}