package com.example.parkingsystem.controller;

import com.example.parkingsystem.model.Booking;
import com.example.parkingsystem.model.ParkingPlace;
import com.example.parkingsystem.model.User;
import com.example.parkingsystem.model.Vehicle;
import com.example.parkingsystem.repository.UserRepository;

import com.example.parkingsystem.service.BookingService;
import com.example.parkingsystem.service.ParkingPlaceService;
import com.example.parkingsystem.service.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/booking")
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private ParkingPlaceService parkingPlaceService;

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
    public String listBookings(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        List<Booking> bookings = bookingService.getAllBookingsByUser(currentUser.getId());
        model.addAttribute("bookings", bookings);
        model.addAttribute("currentUser", currentUser);
        return "booking-list";
    }

    @GetMapping("/create")
    public String showCreateForm(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }


        List<Vehicle> vehicles = vehicleService.getAllVehiclesByUser(currentUser.getId());
        List<ParkingPlace> parkingPlaces = parkingPlaceService.getAvailableParkingPlaces();

        model.addAttribute("vehicles", vehicles);
        model.addAttribute("parkingPlaces", parkingPlaces);
        model.addAttribute("booking", new Booking());
        model.addAttribute("currentUser", currentUser);
        return "booking-create";
    }


    @PostMapping("/create")
    public String createBooking(@RequestParam("vehicleId") Long vehicleId,
                                @RequestParam("parkingPlaceId") Long parkingPlaceId,
                                @RequestParam("bookingStartTime") String bookingStartTime,
                                @RequestParam("bookingEndTime") String bookingEndTime,
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {

        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        if (parkingPlaceId == null) {
            redirectAttributes.addFlashAttribute("error", "Please select a parking place");
            return "redirect:/parking/available";
        }

        try {
            Booking booking = new Booking();
            booking.setUserId(currentUser.getId());
            booking.setVehicleId(vehicleId);
            booking.setParkingPlaceId(parkingPlaceId);
            booking.setBookingStartTime(LocalDateTime.parse(bookingStartTime));
            booking.setBookingEndTime(LocalDateTime.parse(bookingEndTime));

            // Save and get booking ID
            Booking savedBooking = bookingService.createBooking(booking);
            Long bookingId = savedBooking.getId();

            redirectAttributes.addFlashAttribute("message", "Booking created successfully!");
            return "redirect:/payments/form?reservationId=" + bookingId;
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error: " + e.getMessage());
            return "redirect:/booking/create";
        }
    }


    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        Optional<Booking> booking = bookingService.getBookingById(id);
        if (booking.isPresent() && booking.get().getUserId().equals(currentUser.getId())) {
            List<Vehicle> vehicles = vehicleService.getAllVehiclesByUser(currentUser.getId());

            model.addAttribute("booking", booking.get());
            model.addAttribute("vehicles", vehicles);
            model.addAttribute("currentUser", currentUser);
            return "booking-edit";
        }

        redirectAttributes.addFlashAttribute("error", "Booking not found or access denied");
        return "redirect:/booking/list";
    }

    @PostMapping("/edit/{id}")
    public String updateBooking(@PathVariable Long id,
                                @RequestParam("vehicleId") Long vehicleId,
                                @RequestParam("bookingStartTime") String bookingStartTime,
                                @RequestParam("bookingEndTime") String bookingEndTime,
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        try {
            Optional<Booking> existing = bookingService.getBookingById(id);
            if (!existing.isPresent() || !existing.get().getUserId().equals(currentUser.getId())) {
                redirectAttributes.addFlashAttribute("error", "Access denied");
                return "redirect:/booking/list";
            }

            Booking booking = new Booking();
            booking.setVehicleId(vehicleId);
            booking.setBookingStartTime(LocalDateTime.parse(bookingStartTime));
            booking.setBookingEndTime(LocalDateTime.parse(bookingEndTime));

            bookingService.updateBooking(id, booking);
            redirectAttributes.addFlashAttribute("message", "Booking updated successfully!");
            return "redirect:/booking/list";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error: " + e.getMessage());
            return "redirect:/booking/edit/" + id;
        }
    }

    @GetMapping("/cancel/{id}")
    public String cancelBooking(@PathVariable Long id, HttpSession session, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        Optional<Booking> booking = bookingService.getBookingById(id);
        if (booking.isPresent() && booking.get().getUserId().equals(currentUser.getId())) {
            bookingService.cancelBooking(id);
            redirectAttributes.addFlashAttribute("message", "Booking cancelled successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Access denied");
        }

        return "redirect:/booking/list";
    }

    @GetMapping("/view/{id}")
    public String viewBooking(@PathVariable Long id, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        Optional<Booking> booking = bookingService.getBookingById(id);
        if (booking.isPresent() && booking.get().getUserId().equals(currentUser.getId())) {
            Optional<Vehicle> vehicle = vehicleService.getVehicleById(booking.get().getVehicleId());
            Optional<ParkingPlace> parkingPlace = parkingPlaceService.getParkingPlaceById(booking.get().getParkingPlaceId());

            model.addAttribute("booking", booking.get());
            model.addAttribute("vehicle", vehicle.orElse(null));
            model.addAttribute("parkingPlace", parkingPlace.orElse(null));
            model.addAttribute("currentUser", currentUser);
            return "booking-view";
        }

        redirectAttributes.addFlashAttribute("error", "Booking not found or access denied");
        return "redirect:/booking/list";
    }

    @GetMapping("/owner/bookings")
    public String listBookingsForOwner(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return "redirect:/login";
        }

        // Get all parking places owned by this user
        List<ParkingPlace> ownerParkingPlaces = parkingPlaceService.getParkingPlacesByOwnerNew(currentUser.getId());

        // Get all bookings related to those parking places
        List<Booking> bookings = bookingService.getBookingsByOwnerId(currentUser.getId());

        // Create maps to store related data
        Map<Long, String> vehicleMap = new HashMap<>();
        Map<Long, String> userMap = new HashMap<>();
        Map<Long, String> parkingPlaceMap = new HashMap<>();

        // Populate maps with data for all bookings
        for (Booking booking : bookings) {
            // Get vehicle details
            Optional<Vehicle> vehicle = vehicleService.getVehicleById(booking.getVehicleId());
            vehicle.ifPresent(v -> vehicleMap.put(v.getId(), v.getVehicleNumber()));

            // Get user details
            Optional<User> user = userRepository.findById(booking.getUserId());
            user.ifPresent(u -> userMap.put(u.getId(), u.getFirstName() + u.getLastName()));

            // Get parking place details
            Optional<ParkingPlace> parkingPlace = parkingPlaceService.getParkingPlaceById(booking.getParkingPlaceId());
            parkingPlace.ifPresent(p -> parkingPlaceMap.put(p.getId(), p.getParkingName()));
        }

        model.addAttribute("ownerParkingPlaces", ownerParkingPlaces);
        model.addAttribute("bookings", bookings);
        model.addAttribute("vehicleMap", vehicleMap);
        model.addAttribute("userMap", userMap);
        model.addAttribute("parkingPlaceMap", parkingPlaceMap);
        model.addAttribute("currentUser", currentUser);

        return "owner-booking-list";
    }


    @GetMapping("/owner/list")
    public String listOwnerBookings(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return "redirect:/login";
        }

        // Get all parking places for the current owner
        List<ParkingPlace> parkingPlaces = parkingPlaceService.getParkingPlacesByOwner(currentUser.getId());

        // Get all bookings for these parking places
        List<Booking> bookings = bookingService.getBookingsByParkingPlaces(parkingPlaces);

        // Create maps to store related data
        Map<Long, String> vehicleMap = new HashMap<>();
        Map<Long, String> userMap = new HashMap<>();
        Map<Long, String> parkingPlaceMap = new HashMap<>();

        // Populate maps with data for all bookings
        for (Booking booking : bookings) {
            // Get vehicle details
            Optional<Vehicle> vehicle = vehicleService.getVehicleById(booking.getVehicleId());
            vehicle.ifPresent(v -> vehicleMap.put(v.getId(), v.getVehicleNumber()));

            // Get user details
            Optional<User> user = userRepository.findById(booking.getUserId());
            user.ifPresent(u -> userMap.put(u.getId(), u.getFirstName() + u.getLastName()));

            // Get parking place details
            Optional<ParkingPlace> parkingPlace = parkingPlaceService.getParkingPlaceById(booking.getParkingPlaceId());
            parkingPlace.ifPresent(p -> parkingPlaceMap.put(p.getId(), p.getParkingName()));
        }

        model.addAttribute("bookings", bookings);
        model.addAttribute("vehicleMap", vehicleMap);
        model.addAttribute("userMap", userMap);
        model.addAttribute("parkingPlaceMap", parkingPlaceMap);
        model.addAttribute("currentUser", currentUser);

        return "owner-booking-list";
    }


    @GetMapping("/owner/cancel/{id}")
    public String cancelBookingByOwner(@PathVariable Long id, HttpSession session, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return "redirect:/login";
        }

        Optional<Booking> bookingOpt = bookingService.getBookingById(id);
        if (!bookingOpt.isPresent()) {
            redirectAttributes.addFlashAttribute("error", "Booking not found");
            return "redirect:/booking/owner/bookings";
        }

        Booking booking = bookingOpt.get();
        Optional<ParkingPlace> placeOpt = parkingPlaceService.getParkingPlaceById(booking.getParkingPlaceId());

        if (placeOpt.isPresent() && placeOpt.get().getOwnerId().equals(currentUser.getId())) {
            bookingService.cancelBooking(id);
            redirectAttributes.addFlashAttribute("message", "Booking cancelled successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Access denied – You don't own this parking place");
        }

        return "redirect:/booking/owner/bookings";
    }

    @GetMapping("/owner/delete/{id}")
    public String deleteBookingByOwner(@PathVariable Long id, HttpSession session, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return "redirect:/login";
        }

        Optional<Booking> bookingOpt = bookingService.getBookingById(id);
        if (!bookingOpt.isPresent()) {
            redirectAttributes.addFlashAttribute("error", "Booking not found");
            return "redirect:/booking/owner/bookings";
        }

        Booking booking = bookingOpt.get();
        Optional<ParkingPlace> placeOpt = parkingPlaceService.getParkingPlaceById(booking.getParkingPlaceId());

        if (placeOpt.isPresent() && placeOpt.get().getOwnerId().equals(currentUser.getId())) {
            bookingService.deleteBookingRecord(id);
            redirectAttributes.addFlashAttribute("message", "Booking deleted successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Access denied – You don't own this parking place");
        }

        return "redirect:/booking/owner/bookings";
    }

    @GetMapping("/admin/list")
    public String listBookingsAdmin(Model model) {
        List<Booking> bookings = bookingService.getAllBooking();
        model.addAttribute("bookings", bookings);
        return "booking-admin-list";
    }
}