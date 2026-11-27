package com.example.parkingsystem.service;

import com.example.parkingsystem.dto.RegisterRequest;
import com.example.parkingsystem.dto.LoginResponse;
import com.example.parkingsystem.dto.UserProfileResponse;
import com.example.parkingsystem.model.LoginRequest;
import com.example.parkingsystem.model.User;

import java.util.List;

public interface UserService {
    User registerUser(RegisterRequest registerRequest);
    LoginResponse loginUser(LoginRequest loginRequest);
    UserProfileResponse getUserProfile(String email);
    UserProfileResponse updateUserProfile(String email, RegisterRequest updateRequest);
    User findByEmail(String email);
    boolean existsByEmail(String email);
    void deleteUser(String email);
    List<User> getAllUsers();
    User findById(Long id);
    void deleteUserById(Long id);
    UserProfileResponse updateUserById(Long id, RegisterRequest updateRequest);
}