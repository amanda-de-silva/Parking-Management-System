package com.example.parkingsystem.service;

import com.example.parkingsystem.dto.RegisterRequest;
import com.example.parkingsystem.dto.LoginResponse;
import com.example.parkingsystem.dto.UserProfileResponse;
import com.example.parkingsystem.model.LoginRequest;
import com.example.parkingsystem.model.User;
import com.example.parkingsystem.model.UserRole;
import com.example.parkingsystem.repository.UserRepository;
import com.example.parkingsystem.util.PasswordValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final PasswordValidator passwordValidator;

    @Autowired
    public UserServiceImpl(UserRepository userRepository,
                           PasswordEncoder passwordEncoder,
                           JwtService jwtService,
                           PasswordValidator passwordValidator) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtService = jwtService;
        this.passwordValidator = passwordValidator;
    }

    @Override
    public User registerUser(RegisterRequest registerRequest) {
        // Check if email already exists
        if (userRepository.existsByEmail(registerRequest.getEmail())) {
            throw new RuntimeException("Email is already registered");
        }

        // Validate password
        if (!passwordValidator.isValid(registerRequest.getPassword())) {
            throw new RuntimeException(passwordValidator.getPasswordRequirements());
        }

        // Check if passwords match
        if (!registerRequest.getPassword().equals(registerRequest.getConfirmPassword())) {
            throw new RuntimeException("Passwords do not match");
        }

        // Validate role selection
        UserRole userRole;
        if (registerRequest.getRole() != null && !registerRequest.getRole().isEmpty()) {
            try {
                userRole = UserRole.valueOf(registerRequest.getRole());
            } catch (IllegalArgumentException e) {
                throw new RuntimeException("Invalid role selected");
            }
        } else {
            // Default to VEHICLE_OWNER if no role provided
            userRole = UserRole.VEHICLE_OWNER;
        }

        // Validate only allowed roles during registration
        if (userRole != UserRole.VEHICLE_OWNER && userRole != UserRole.PARKING_OWNER) {
            throw new RuntimeException("Invalid role selection. Only VEHICLE_OWNER or PARKING_OWNER allowed.");
        }

        // Create new user
        User user = new User();
        user.setFirstName(registerRequest.getFirstName());
        user.setLastName(registerRequest.getLastName());
        user.setEmail(registerRequest.getEmail());
        user.setPassword(passwordEncoder.encode(registerRequest.getPassword()));
        user.setRole(userRole); // Set the selected role

        return userRepository.save(user);
    }

    @Override
    public LoginResponse loginUser(LoginRequest loginRequest) {
        Optional<User> userOptional = userRepository.findByEmail(loginRequest.getEmail());

        if (userOptional.isEmpty()) {
            throw new RuntimeException("Invalid email or password");
        }

        User user = userOptional.get();

        if (!passwordEncoder.matches(loginRequest.getPassword(), user.getPassword())) {
            throw new RuntimeException("Invalid email or password");
        }

        String token = jwtService.generateToken(user);

        return new LoginResponse(
                token,
                user.getEmail(),
                user.getFirstName(),
                user.getLastName(),
                user.getRole().toString()
        );
    }

    @Override
    public UserProfileResponse getUserProfile(String email) {
        User user = findByEmail(email);

        return new UserProfileResponse(
                user.getId(),
                user.getFirstName(),
                user.getLastName(),
                user.getEmail(),
                user.getRole().toString(),
                user.getCreatedAt(),
                user.getUpdatedAt()
        );
    }

    @Override
    public UserProfileResponse updateUserProfile(String email, RegisterRequest updateRequest) {
        User user = findByEmail(email);

        // Update user fields
        user.setFirstName(updateRequest.getFirstName());
        user.setLastName(updateRequest.getLastName());

        // Check if email is being changed and if it's already taken
        if (!user.getEmail().equals(updateRequest.getEmail())) {
            if (userRepository.existsByEmail(updateRequest.getEmail())) {
                throw new RuntimeException("Email is already registered");
            }
            user.setEmail(updateRequest.getEmail());
        }

        // Update role if provided and valid
        if (updateRequest.getRole() != null && !updateRequest.getRole().isEmpty()) {
            try {
                UserRole newRole = UserRole.valueOf(updateRequest.getRole());
                // Only allow VEHICLE_OWNER and PARKING_OWNER role changes
                if (newRole == UserRole.VEHICLE_OWNER || newRole == UserRole.PARKING_OWNER) {
                    user.setRole(newRole);
                }
            } catch (IllegalArgumentException e) {
                // Ignore invalid role, keep existing
            }
        }

        // Update password if provided
        if (updateRequest.getPassword() != null && !updateRequest.getPassword().isEmpty()) {
            if (!passwordValidator.isValid(updateRequest.getPassword())) {
                throw new RuntimeException(passwordValidator.getPasswordRequirements());
            }

            if (!updateRequest.getPassword().equals(updateRequest.getConfirmPassword())) {
                throw new RuntimeException("Passwords do not match");
            }

            user.setPassword(passwordEncoder.encode(updateRequest.getPassword()));
        }

        User savedUser = userRepository.save(user);

        return new UserProfileResponse(
                savedUser.getId(),
                savedUser.getFirstName(),
                savedUser.getLastName(),
                savedUser.getEmail(),
                savedUser.getRole().toString(),
                savedUser.getCreatedAt(),
                savedUser.getUpdatedAt()
        );
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found with email: " + email));
    }

    @Override
    public boolean existsByEmail(String email) {
        return userRepository.existsByEmail(email);
    }

    @Override
    public void deleteUser(String email) {
        User user = findByEmail(email);
        userRepository.delete(user);
    }
    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public User findById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found with id: " + id));
    }

    @Override
    public void deleteUserById(Long id) {
        User user = findById(id);
        userRepository.delete(user);
    }

    @Override
    public UserProfileResponse updateUserById(Long id, RegisterRequest updateRequest) {
        User user = findById(id);

        // Update user fields
        user.setFirstName(updateRequest.getFirstName());
        user.setLastName(updateRequest.getLastName());

        // Check if email is being changed and if it's already taken
        if (!user.getEmail().equals(updateRequest.getEmail())) {
            if (userRepository.existsByEmail(updateRequest.getEmail())) {
                throw new RuntimeException("Email is already registered");
            }
            user.setEmail(updateRequest.getEmail());
        }

        // Update role if provided and valid
        if (updateRequest.getRole() != null && !updateRequest.getRole().isEmpty()) {
            try {
                UserRole newRole = UserRole.valueOf(updateRequest.getRole());
                user.setRole(newRole);
            } catch (IllegalArgumentException e) {
                // Ignore invalid role, keep existing
            }
        }

        // Update password if provided
        if (updateRequest.getPassword() != null && !updateRequest.getPassword().isEmpty()) {
            if (!passwordValidator.isValid(updateRequest.getPassword())) {
                throw new RuntimeException(passwordValidator.getPasswordRequirements());
            }

            if (updateRequest.getConfirmPassword() != null &&
                    !updateRequest.getPassword().equals(updateRequest.getConfirmPassword())) {
                throw new RuntimeException("Passwords do not match");
            }

            user.setPassword(passwordEncoder.encode(updateRequest.getPassword()));
        }

        User savedUser = userRepository.save(user);

        return new UserProfileResponse(
                savedUser.getId(),
                savedUser.getFirstName(),
                savedUser.getLastName(),
                savedUser.getEmail(),
                savedUser.getRole().toString(),
                savedUser.getCreatedAt(),
                savedUser.getUpdatedAt()
        );
    }
}