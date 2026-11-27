package com.example.parkingsystem.controller;

import com.example.parkingsystem.model.*;
import com.example.parkingsystem.repository.UserRepository;
import com.example.parkingsystem.service.BookingService;
import com.example.parkingsystem.service.ParkingPlaceService;
import com.example.parkingsystem.service.PaymentService;
import com.example.parkingsystem.service.PromotionService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/payments")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BookingService bookingService;


    @Autowired
    private PromotionService promotionService;

    @Autowired
    private ParkingPlaceService parkingPlaceService;

    private User getCurrentUser(HttpSession session) {
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) return null;
        return userRepository.findByEmail(userEmail).orElse(null);
    }

    @GetMapping("/form")
    public String showPaymentForm(@RequestParam("reservationId") Long reservationId,
                                  HttpSession session, Model model,
                                  RedirectAttributes redirectAttributes) {

        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        // Get booking details
        Optional<Booking> bookingOpt = bookingService.getBookingById(reservationId);
        if (!bookingOpt.isPresent()) {
            redirectAttributes.addFlashAttribute("error", "Booking not found");
            return "redirect:/booking/list";
        }

        Booking booking = bookingOpt.get();

        // Get parking place to fetch hourly rate
        Optional<ParkingPlace> parkingPlaceOpt = parkingPlaceService.getParkingPlaceById(booking.getParkingPlaceId());
        if (!parkingPlaceOpt.isPresent()) {
            redirectAttributes.addFlashAttribute("error", "Parking place not found");
            return "redirect:/booking/list";
        }

        ParkingPlace parkingPlace = parkingPlaceOpt.get();
        double hourlyRate = parkingPlace.getHourlyRate().doubleValue();

        // Calculate amount based on duration and parking place's hourly rate
        Duration duration = Duration.between(booking.getBookingStartTime(), booking.getBookingEndTime());
        long hours = duration.toHours();
        if (hours == 0) hours = 1; // Minimum 1 hour
        double amount = hours * hourlyRate;

        model.addAttribute("reservationId", reservationId);
        model.addAttribute("customerName", currentUser.getFirstName() + " " + currentUser.getLastName());
        model.addAttribute("amount", amount);
        model.addAttribute("hourlyRate", hourlyRate);
        model.addAttribute("hours", hours);
        model.addAttribute("parkingPlaceName", parkingPlace.getParkingName());
        model.addAttribute("booking", booking);

        return "payment-form";
    }

    @PostMapping("/process")
    public String processPayment(@RequestParam String customerName,
                                 @RequestParam Long reservationId,
                                 @RequestParam double amount,
                                 @RequestParam String paymentMethod,
                                 HttpSession session,
                                 Model model,
                                 RedirectAttributes redirectAttributes) {

        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        try {
            // Create payment
            Payment payment = new Payment();
            payment.setCustomerName(customerName);
            payment.setReservationId(reservationId);
            payment.setAmount(amount);
            payment.setPaymentMethod(paymentMethod);
            payment.setStatus("SUCCESS");

            Payment savedPayment = paymentService.processPayment(payment);

            // Get booking and parking place details for receipt
            Optional<Booking> bookingOpt = bookingService.getBookingById(reservationId);
            Optional<ParkingPlace> parkingPlaceOpt = Optional.empty();

            if (bookingOpt.isPresent()) {
                Booking booking = bookingOpt.get();
                parkingPlaceOpt = parkingPlaceService.getParkingPlaceById(booking.getParkingPlaceId());

                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                model.addAttribute("bookingStartTime", booking.getBookingStartTime().format(formatter));
                model.addAttribute("bookingEndTime", booking.getBookingEndTime().format(formatter));
            }

            // Add data to model for receipt
            model.addAttribute("receiptId", "REC-" + savedPayment.getId());
            model.addAttribute("paymentDate", savedPayment.getDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
            model.addAttribute("customerName", savedPayment.getCustomerName());
            model.addAttribute("customerEmail", currentUser.getEmail());
            model.addAttribute("reservationId", savedPayment.getReservationId());
            model.addAttribute("paymentMethod", savedPayment.getPaymentMethod());
            model.addAttribute("transactionId", savedPayment.getTransactionId());
            model.addAttribute("amount", String.format("%.2f", savedPayment.getAmount()));
            model.addAttribute("status", savedPayment.getStatus());
            model.addAttribute("parkingPlaceName", parkingPlaceOpt.isPresent() ? parkingPlaceOpt.get().getParkingName() : "N/A");

            return "receipt";

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Payment processing failed: " + e.getMessage());
            return "redirect:/payments/form?reservationId=" + reservationId;
        }
    }

    @GetMapping("/list")
    public String listPayments(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        model.addAttribute("payments", paymentService.getAllPayments());
        model.addAttribute("currentUser", currentUser);
        return "payment-list";
    }

    @GetMapping("/receipt/{id}")
    public String viewReceipt(@PathVariable Long id, HttpSession session,
                              Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        Payment payment = paymentService.getPaymentById(id);
        if (payment == null) {
            redirectAttributes.addFlashAttribute("error", "Payment not found");
            return "redirect:/payments/list";
        }

        // Get booking and parking place details
        Optional<Booking> bookingOpt = bookingService.getBookingById(payment.getReservationId());
        Optional<ParkingPlace> parkingPlaceOpt = Optional.empty();

        if (bookingOpt.isPresent()) {
            Booking booking = bookingOpt.get();
            parkingPlaceOpt = parkingPlaceService.getParkingPlaceById(booking.getParkingPlaceId());

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
            model.addAttribute("bookingStartTime", booking.getBookingStartTime().format(formatter));
            model.addAttribute("bookingEndTime", booking.getBookingEndTime().format(formatter));
        }

        // Add data to model
        model.addAttribute("receiptId", "REC-" + payment.getId());
        model.addAttribute("paymentDate", payment.getDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        model.addAttribute("customerName", payment.getCustomerName());
        model.addAttribute("customerEmail", currentUser.getEmail());
        model.addAttribute("reservationId", payment.getReservationId());
        model.addAttribute("paymentMethod", payment.getPaymentMethod());
        model.addAttribute("transactionId", payment.getTransactionId());
        model.addAttribute("amount", String.format("%.2f", payment.getAmount()));
        model.addAttribute("status", payment.getStatus());
        model.addAttribute("parkingPlaceName", parkingPlaceOpt.isPresent() ? parkingPlaceOpt.get().getParkingName() : "N/A");

        return "receipt";
    }


    @PostMapping("/validate-promo")
    @ResponseBody
    public Map<String, Object> validatePromoCode(@RequestParam String promoCode,
                                                 @RequestParam String parkingPlaceName,
                                                 @RequestParam double originalAmount,
                                                 @RequestParam(required = false) Long reservationId) {
        Map<String, Object> response = new HashMap<>();

        // Get booking date if reservationId is provided
        Date bookingDate = null;
        if (reservationId != null) {
            Optional<Booking> bookingOpt = bookingService.getBookingById(reservationId);
            if (bookingOpt.isPresent()) {
                Booking booking = bookingOpt.get();
                // Convert LocalDateTime to Date
                bookingDate = Date.from(booking.getBookingStartTime().atZone(ZoneId.systemDefault()).toInstant());
            }
        }

        Promotion promo = promotionService.validatePromoCode(promoCode, parkingPlaceName, bookingDate);

        if (promo == null) {
            response.put("valid", false);
            response.put("message", "Invalid or expired promo code");
            return response;
        }

        double discount = 0;
        double finalAmount = originalAmount;

        // Calculate discount
        if (promo.getDiscountPercentage() != null && promo.getDiscountPercentage() > 0) {
            discount = (originalAmount * promo.getDiscountPercentage()) / 100;
            finalAmount = originalAmount - discount;
        } else if (promo.getDiscountAmount() != null && promo.getDiscountAmount() > 0) {
            discount = promo.getDiscountAmount();
            finalAmount = originalAmount - discount;
        }

        // Ensure final amount is not negative
        if (finalAmount < 0) {
            finalAmount = 0;
        }

        response.put("valid", true);
        response.put("message", "Promo code applied successfully!");
        response.put("discountPercentage", promo.getDiscountPercentage());
        response.put("discountAmount", promo.getDiscountAmount());
        response.put("discount", discount);
        response.put("finalAmount", finalAmount);
        response.put("originalAmount", originalAmount);

        return response;
    }
}