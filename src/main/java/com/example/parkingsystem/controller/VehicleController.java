package com.example.parkingsystem.controller;


import com.example.parkingsystem.model.User;
import com.example.parkingsystem.model.Vehicle;
import com.example.parkingsystem.repository.UserRepository;

import com.example.parkingsystem.service.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/vehicle")
public class VehicleController {

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private UserRepository userRepository;

    private User getCurrentUser(HttpSession session) {
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) {
            return null;
        }
        return userRepository.findByEmail(userEmail).orElse(null);
    }

    @GetMapping("/list")
    public String listVehicles(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        List<Vehicle> vehicles = vehicleService.getAllVehiclesByUser(currentUser.getId());
        model.addAttribute("vehicles", vehicles);
        model.addAttribute("currentUser", currentUser);
        return "vehicle-list";
    }

    @GetMapping("/create")
    public String showCreateForm(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        model.addAttribute("vehicle", new Vehicle());
        model.addAttribute("currentUser", currentUser);
        return "vehicle-create";
    }

    @PostMapping("/create")
    public String createVehicle(@ModelAttribute Vehicle vehicle,
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        try {
            vehicle.setUserId(currentUser.getId());
            vehicleService.createVehicle(vehicle);
            redirectAttributes.addFlashAttribute("message", "Vehicle registered successfully!");
            return "redirect:/vehicle/list";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error: " + e.getMessage());
            return "redirect:/vehicle/create";
        }
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        Optional<Vehicle> vehicle = vehicleService.getVehicleById(id);
        if (vehicle.isPresent() && vehicle.get().getUserId().equals(currentUser.getId())) {
            model.addAttribute("vehicle", vehicle.get());
            model.addAttribute("currentUser", currentUser);
            return "vehicle-edit";
        }

        redirectAttributes.addFlashAttribute("error", "Vehicle not found or access denied");
        return "redirect:/vehicle/list";
    }

    @PostMapping("/edit/{id}")
    public String updateVehicle(@PathVariable Long id,
                                @ModelAttribute Vehicle vehicle,
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        try {
            Optional<Vehicle> existing = vehicleService.getVehicleById(id);
            if (!existing.isPresent() || !existing.get().getUserId().equals(currentUser.getId())) {
                redirectAttributes.addFlashAttribute("error", "Access denied");
                return "redirect:/vehicle/list";
            }

            vehicleService.updateVehicle(id, vehicle);
            redirectAttributes.addFlashAttribute("message", "Vehicle updated successfully!");
            return "redirect:/vehicle/list";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error: " + e.getMessage());
            return "redirect:/vehicle/edit/" + id;
        }
    }

    @GetMapping("/delete/{id}")
    public String deleteVehicle(@PathVariable Long id, HttpSession session, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        Optional<Vehicle> vehicle = vehicleService.getVehicleById(id);
        if (vehicle.isPresent() && vehicle.get().getUserId().equals(currentUser.getId())) {
            vehicleService.deleteVehicle(id);
            redirectAttributes.addFlashAttribute("message", "Vehicle deleted successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Access denied");
        }

        return "redirect:/vehicle/list";
    }

    @GetMapping("/admin/list")
    public String listVehiclesAdmin(Model model) {
        List<Vehicle> vehicles = vehicleService.getAllVehicles();
        model.addAttribute("vehicles", vehicles);  // Add to model for JSP
        return "vehicle-list-admin";
    }

}
