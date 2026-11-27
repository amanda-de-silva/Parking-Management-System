package com.example.parkingsystem.controller;

import com.example.parkingsystem.model.Booking;
import com.example.parkingsystem.model.ParkingPlace;
import com.example.parkingsystem.model.User;
import com.example.parkingsystem.repository.UserRepository;
import com.example.parkingsystem.service.BookingService;
import com.example.parkingsystem.service.ParkingPlaceService;
import com.example.parkingsystem.service.VehicleService;
import com.example.parkingsystem.service.PromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
public class DashboardController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ParkingPlaceService parkingPlaceService;

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private PromotionService promotionService;

    private User getCurrentUser(HttpSession session) {
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) {
            return null;
        }
        return userRepository.findByEmail(userEmail).orElse(null);
    }

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);

        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return "redirect:/login";
        }

        // Add user to model
        model.addAttribute("currentUser", currentUser);

        // Get statistics based on user role
        try {
            // Common statistics
            int vehicleCount = vehicleService.getAllVehiclesByUser(currentUser.getId()).size();
            model.addAttribute("vehicleCount", vehicleCount);

            List<Booking> userBookings = bookingService.getAllBookingsByUser(currentUser.getId());
            int bookingCount = userBookings.size();
            model.addAttribute("bookingCount", bookingCount);

            // Count active and completed bookings
            long activeBookings = userBookings.stream()
                    .filter(b -> "CONFIRMED".equals(b.getBookingStatus()) || "PENDING".equals(b.getBookingStatus()))
                    .count();
            long completedBookings = userBookings.stream()
                    .filter(b -> "COMPLETED".equals(b.getBookingStatus()))
                    .count();

            model.addAttribute("activeBookings", activeBookings);
            model.addAttribute("completedBookings", completedBookings);

            // Parking Owner specific statistics
            if ("PARKING_OWNER".equals(currentUser.getRole().toString())) {
                List<ParkingPlace> parkingPlaces = parkingPlaceService.getParkingPlacesByOwner(currentUser.getId());
                int parkingPlaceCount = parkingPlaces.size();
                model.addAttribute("parkingPlaceCount", parkingPlaceCount);

                // Calculate total and available slots
                int totalSlots = parkingPlaces.stream()
                        .mapToInt(ParkingPlace::getTotalSlots)
                        .sum();
                int availableSlots = parkingPlaces.stream()
                        .mapToInt(ParkingPlace::getAvailableSlots)
                        .sum();

                model.addAttribute("totalSlots", totalSlots);
                model.addAttribute("availableSlots", availableSlots);
            }

        } catch (Exception e) {
            // If there's an error getting statistics, just show 0
            model.addAttribute("vehicleCount", 0);
            model.addAttribute("bookingCount", 0);
            model.addAttribute("activeBookings", 0);
            model.addAttribute("completedBookings", 0);
            model.addAttribute("parkingPlaceCount", 0);
            model.addAttribute("totalSlots", 0);
            model.addAttribute("availableSlots", 0);
        }

        return "dashboard";
    }

    @GetMapping("/admin/dashboard")
    public String showAdminDashboard(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);

        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return "redirect:/login";
        }

        // Add user to model
        model.addAttribute("currentUser", currentUser);

        try {
            // ADMIN STATISTICS - System-wide data

            // 1. Total Parking Places (all in system)
            List<ParkingPlace> allParkingPlaces = parkingPlaceService.getAllParkingPlaces();
            int totalParkingPlaces = allParkingPlaces.size();
            model.addAttribute("parkingPlaceCount", totalParkingPlaces);

            // Calculate total slots across all parking places
            int totalSlots = allParkingPlaces.stream()
                    .mapToInt(ParkingPlace::getTotalSlots)
                    .sum();
            int availableSlots = allParkingPlaces.stream()
                    .mapToInt(ParkingPlace::getAvailableSlots)
                    .sum();
            model.addAttribute("totalSlots", totalSlots);
            model.addAttribute("availableSlots", availableSlots);

            // 2. Total Bookings (all users)
            // Since there's no getAllBookings() method, we'll count user's bookings
            // You may need to add a getAllBookings() method to BookingService
            List<Booking> userBookings = bookingService.getAllBooking();
            int totalBookings = userBookings.size();
            model.addAttribute("bookingCount", totalBookings);

            // Count bookings by status
            long activeBookings = userBookings.stream()
                    .filter(b -> "CONFIRMED".equals(b.getBookingStatus()) || "PENDING".equals(b.getBookingStatus()))
                    .count();
            long completedBookings = userBookings.stream()
                    .filter(b -> "COMPLETED".equals(b.getBookingStatus()))
                    .count();
            long cancelledBookings = userBookings.stream()
                    .filter(b -> "END".equals(b.getBookingStatus()))
                    .count();

            model.addAttribute("activeBookings", activeBookings);
            model.addAttribute("completedBookings", completedBookings);
            model.addAttribute("cancelledBookings", cancelledBookings);

            // 3. Total Vehicles (all users)
            // Since there's no getAllVehicles() method, we'll show current user's vehicles
            // You may need to add a getAllVehicles() method to VehicleService
            int totalVehicles = vehicleService.getAllVehicles().size();
            model.addAttribute("vehicleCount", totalVehicles);

            // 4. Active Promotions
            int activePromotions = promotionService.getActivePromotion().size();
            model.addAttribute("activePromotionsCount", activePromotions);

            // 5. Total Promotions
            int totalPromotions = promotionService.getAllPromotions().size();
            model.addAttribute("totalPromotionsCount", totalPromotions);

            // 6. Total Users (if you have a method to get all users)
            // This would require a new method in UserRepository/Service
            // For now, we'll just show the current user
            model.addAttribute("totalUsers", 1); // Placeholder

        } catch (Exception e) {
            // If there's an error getting statistics, show 0
            model.addAttribute("parkingPlaceCount", 0);
            model.addAttribute("bookingCount", 0);
            model.addAttribute("vehicleCount", 0);
            model.addAttribute("activePromotionsCount", 0);
            model.addAttribute("totalPromotionsCount", 0);
            model.addAttribute("activeBookings", 0);
            model.addAttribute("completedBookings", 0);
            model.addAttribute("cancelledBookings", 0);
            model.addAttribute("totalSlots", 0);
            model.addAttribute("availableSlots", 0);
            model.addAttribute("totalUsers", 0);

            // Log the error
            System.err.println("Error loading admin dashboard statistics: " + e.getMessage());
            e.printStackTrace();
        }

        return "admin-dashboard";
    }

    @GetMapping("/")
    public String home(HttpSession session) {
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail != null) {
            // User is logged in, redirect to dashboard
            return "redirect:/dashboard";
        }

        // User is not logged in, redirect to login
        return "redirect:/login";
    }

    @GetMapping("/welcome")
    public String welcome(HttpSession session, Model model) {
        User currentUser = getCurrentUser(session);

        if (currentUser != null) {
            model.addAttribute("currentUser", currentUser);
            return "welcome";
        }

        return "redirect:/login";
    }
}