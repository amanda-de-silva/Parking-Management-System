package com.example.parkingsystem.controller;


import com.example.parkingsystem.model.ParkingPlace;
import com.example.parkingsystem.model.User;
import com.example.parkingsystem.repository.UserRepository;
import com.example.parkingsystem.service.ParkingPlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/parking")
public class ParkingPlaceController {

    @Autowired
    private ParkingPlaceService parkingPlaceService;

    @Autowired
    private UserRepository userRepository;

    private static final String UPLOAD_DIR = "uploads/parking/";

    private User getCurrentUser(HttpSession session) {
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) {
            return null;
        }
        return userRepository.findByEmail(userEmail).orElse(null);
    }

    @GetMapping("/list")
    public String listParkingPlaces(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        List<ParkingPlace> parkingPlaces = parkingPlaceService.getParkingPlacesByOwner(currentUser.getId());
        model.addAttribute("parkingPlaces", parkingPlaces);
        model.addAttribute("currentUser", currentUser);
        return "parking-list";
    }

    @GetMapping("/create")
    public String showCreateForm(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        model.addAttribute("parkingPlace", new ParkingPlace());
        model.addAttribute("currentUser", currentUser);
        return "parking-create";
    }

    @PostMapping("/create")
    public String createParkingPlace(@RequestParam("parkingName") String parkingName,
                                     @RequestParam("description") String description,
                                     @RequestParam("parkingType") String parkingType,
                                     @RequestParam("address") String address,
                                     @RequestParam("city") String city,
                                     @RequestParam("district") String district,
                                     @RequestParam(value = "latitude", required = false) Double latitude,
                                     @RequestParam(value = "longitude", required = false) Double longitude,
                                     @RequestParam("availableSlots") Integer availableSlots,
                                     @RequestParam("hourlyRate") BigDecimal hourlyRate,
                                     @RequestParam("openingTime") String openingTime,
                                     @RequestParam("closingTime") String closingTime,
                                     @RequestParam(value = "evChargingAvailable", required = false) Boolean evChargingAvailable,
                                     @RequestParam(value = "images", required = false) MultipartFile[] images,
                                     @RequestParam("contactNumber") String contactNumber,
                                     HttpSession session,
                                     RedirectAttributes redirectAttributes) {

        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        try {
            ParkingPlace parkingPlace = new ParkingPlace();
            parkingPlace.setParkingName(parkingName);
            parkingPlace.setDescription(description);
            parkingPlace.setParkingType(parkingType);
            parkingPlace.setAddress(address);
            parkingPlace.setCity(city);
            parkingPlace.setDistrict(district);
            parkingPlace.setLatitude(latitude);
            parkingPlace.setLongitude(longitude);
            parkingPlace.setAvailableSlots(availableSlots);
            parkingPlace.setHourlyRate(hourlyRate);
            parkingPlace.setOpeningTime(LocalTime.parse(openingTime));
            parkingPlace.setClosingTime(LocalTime.parse(closingTime));
            parkingPlace.setEvChargingAvailable(evChargingAvailable != null ? evChargingAvailable : false);
            parkingPlace.setContactNumber(contactNumber);
            parkingPlace.setOwnerId(currentUser.getId());

            // Handle image uploads
            if (images != null && images.length > 0) {
                List<String> imagePaths = new ArrayList<>();
                for (MultipartFile image : images) {
                    if (!image.isEmpty()) {
                        String filename = UUID.randomUUID().toString() + "_" + image.getOriginalFilename();
                        Path path = Paths.get(UPLOAD_DIR + filename);
                        Files.createDirectories(path.getParent());
                        Files.write(path, image.getBytes());
                        imagePaths.add(filename);
                    }
                }
                parkingPlace.setParkingImages(String.join(",", imagePaths));
            }

            parkingPlaceService.createParkingPlace(parkingPlace);
            redirectAttributes.addFlashAttribute("message", "Parking place created successfully!");
            return "redirect:/parking/list";

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error creating parking place: " + e.getMessage());
            return "redirect:/parking/create";
        }
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        Optional<ParkingPlace> parkingPlace = parkingPlaceService.getParkingPlaceById(id);
        if (parkingPlace.isPresent() && parkingPlace.get().getOwnerId().equals(currentUser.getId())) {
            model.addAttribute("parkingPlace", parkingPlace.get());
            model.addAttribute("currentUser", currentUser);
            return "parking-edit";
        }

        redirectAttributes.addFlashAttribute("error", "Parking place not found or access denied");
        return "redirect:/parking/list";
    }

    @PostMapping("/edit/{id}")
    public String updateParkingPlace(@PathVariable Long id,
                                     @RequestParam("parkingName") String parkingName,
                                     @RequestParam("description") String description,
                                     @RequestParam("parkingType") String parkingType,
                                     @RequestParam("address") String address,
                                     @RequestParam("city") String city,
                                     @RequestParam("district") String district,
                                     @RequestParam(value = "latitude", required = false) Double latitude,
                                     @RequestParam(value = "longitude", required = false) Double longitude,
                                     @RequestParam("totalSlots") Integer totalSlots,
                                     @RequestParam("hourlyRate") BigDecimal hourlyRate,
                                     @RequestParam("openingTime") String openingTime,
                                     @RequestParam("closingTime") String closingTime,
                                     @RequestParam(value = "evChargingAvailable", required = false) Boolean evChargingAvailable,
                                     @RequestParam(value = "images", required = false) MultipartFile[] images,
                                     @RequestParam("contactNumber") String contactNumber,
                                     HttpSession session,
                                     RedirectAttributes redirectAttributes) {

        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        try {
            Optional<ParkingPlace> existing = parkingPlaceService.getParkingPlaceById(id);
            if (!existing.isPresent() || !existing.get().getOwnerId().equals(currentUser.getId())) {
                redirectAttributes.addFlashAttribute("error", "Access denied");
                return "redirect:/parking/list";
            }

            ParkingPlace parkingPlace = new ParkingPlace();
            parkingPlace.setParkingName(parkingName);
            parkingPlace.setDescription(description);
            parkingPlace.setParkingType(parkingType);
            parkingPlace.setAddress(address);
            parkingPlace.setCity(city);
            parkingPlace.setDistrict(district);
            parkingPlace.setLatitude(latitude);
            parkingPlace.setLongitude(longitude);
            parkingPlace.setTotalSlots(totalSlots);
            parkingPlace.setHourlyRate(hourlyRate);
            parkingPlace.setOpeningTime(LocalTime.parse(openingTime));
            parkingPlace.setClosingTime(LocalTime.parse(closingTime));
            parkingPlace.setEvChargingAvailable(evChargingAvailable != null ? evChargingAvailable : false);
            parkingPlace.setContactNumber(contactNumber);

            // Handle new image uploads
            if (images != null && images.length > 0 && !images[0].isEmpty()) {
                List<String> imagePaths = new ArrayList<>();
                for (MultipartFile image : images) {
                    if (!image.isEmpty()) {
                        String filename = UUID.randomUUID().toString() + "_" + image.getOriginalFilename();
                        Path path = Paths.get(UPLOAD_DIR + filename);
                        Files.createDirectories(path.getParent());
                        Files.write(path, image.getBytes());
                        imagePaths.add(filename);
                    }
                }
                parkingPlace.setParkingImages(String.join(",", imagePaths));
            } else {
                parkingPlace.setParkingImages(existing.get().getParkingImages());
            }

            parkingPlaceService.updateParkingPlace(id, parkingPlace);
            redirectAttributes.addFlashAttribute("message", "Parking place updated successfully!");
            return "redirect:/parking/list";

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error updating parking place: " + e.getMessage());
            return "redirect:/parking/edit/" + id;
        }
    }

    @GetMapping("/delete/{id}")
    public String deleteParkingPlace(@PathVariable Long id, HttpSession session, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        Optional<ParkingPlace> parkingPlace = parkingPlaceService.getParkingPlaceById(id);
        if (parkingPlace.isPresent() && parkingPlace.get().getOwnerId().equals(currentUser.getId())) {
            parkingPlaceService.deleteParkingPlace(id);
            redirectAttributes.addFlashAttribute("message", "Parking place deleted successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Access denied");
        }

        return "redirect:/parking/list";
    }

    @GetMapping("/view/{id}")
    public String viewParkingPlace(@PathVariable Long id, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);

        Optional<ParkingPlace> parkingPlace = parkingPlaceService.getParkingPlaceById(id);
        if (parkingPlace.isPresent()) {
            model.addAttribute("parkingPlace", parkingPlace.get());
            model.addAttribute("currentUser", currentUser);
            return "parking-view";
        }

        redirectAttributes.addFlashAttribute("error", "Parking place not found");
        return "redirect:/parking/list";
    }


    @GetMapping("/user/list")
    public String listParkingPlacesUsers(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        List<ParkingPlace> parkingPlaces = parkingPlaceService.getAllParkingPlaces();
        model.addAttribute("parkingPlaces", parkingPlaces);
        model.addAttribute("currentUser", currentUser);
        return "parking-user-list";
    }


    @GetMapping("/owner/list")
    public String listParkingPlacesOwners(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = getCurrentUser(session);
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first");
            return  "redirect:/login";
        }

        List<ParkingPlace> parkingPlaces = parkingPlaceService.getAllParkingPlaces();
        model.addAttribute("parkingPlaces", parkingPlaces);
        model.addAttribute("currentUser", currentUser);
        return "parking-owner-list";
    }
}