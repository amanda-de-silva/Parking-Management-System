package com.example.parkingsystem.controller;

import com.example.parkingsystem.dto.UserProfileResponse;
import com.example.parkingsystem.model.User;
import com.example.parkingsystem.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ViewController {

    @Autowired
    private UserService userService;

    @GetMapping("/home")
    public String homePage() {
        return "home"; // maps to /WEB-INF/jsp/home.jsp
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login"; // maps to /WEB-INF/jsp/login.jsp
    }

    @GetMapping("/register")
    public String registerPage() {
        return "register"; // maps to /WEB-INF/jsp/register.jsp
    }

    @GetMapping("/profile")
    public String profilePage(HttpSession session, Model model) {
        String email = (String) session.getAttribute("userEmail");
        if (email == null) {
            return "redirect:/login";
        }

        UserProfileResponse profile = userService.getUserProfile(email);
        model.addAttribute("userProfile", profile);

        return "profile"; // maps to /WEB-INF/jsp/profile.jsp
    }
}