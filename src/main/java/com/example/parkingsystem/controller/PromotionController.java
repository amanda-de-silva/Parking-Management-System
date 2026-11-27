package com.example.parkingsystem.controller;

import com.example.parkingsystem.model.ParkingPlace;
import com.example.parkingsystem.model.Promotion;
import com.example.parkingsystem.service.ParkingPlaceService;
import com.example.parkingsystem.service.PromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/promotions")
public class PromotionController {

    @Autowired
    private PromotionService promotionService;

    @Autowired
    private ParkingPlaceService parkingPlaceService;
    private static final String UPLOAD_DIR = "uploads/promotions/";

    @GetMapping
    public String listPromotions(Model model) {
        List<Promotion> promotions = promotionService.getAllPromotions();
        model.addAttribute("promotions", promotions);
        return "promotion-list";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("promotion", new Promotion());
        List<ParkingPlace> parkingPlaces = parkingPlaceService.getAllParkingPlaces();
        model.addAttribute("parkingPlaces", parkingPlaces);
        return "promotion-create";
    }

    @PostMapping("/create")
    public String createPromotion(
            @RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam(value = "lotName", required = false) String lotName,
            @RequestParam(value = "image", required = false) MultipartFile image,
            @RequestParam(value = "discountPercentage", required = false) Double discountPercentage,
            @RequestParam(value = "discountAmount", required = false) Double discountAmount,
            @RequestParam("promoCode") String promoCode,
            @RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
            @RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,
            @RequestParam(value = "isActive", defaultValue = "true") Boolean isActive,
            RedirectAttributes redirectAttributes) {

        try {
            Promotion promotion = new Promotion();
            promotion.setTitle(title);
            promotion.setDescription(description);
            promotion.setLotName(lotName);
            promotion.setDiscountPercentage(discountPercentage);
            promotion.setDiscountAmount(discountAmount);
            promotion.setPromoCode(promoCode);
            promotion.setStartDate(startDate);
            promotion.setEndDate(endDate);
            promotion.setIsActive(isActive);

            // Handle image upload
            if (image != null && !image.isEmpty()) {
                String imagePath = saveImage(image);
                promotion.setImagePath(imagePath);
            }

            promotionService.createPromotion(promotion);

            redirectAttributes.addFlashAttribute("successMessage",
                    "Promotion created successfully!");
            return "redirect:/promotions";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage",
                    "Error creating promotion: " + e.getMessage());
            return "redirect:/promotions/create";
        }
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Integer id, Model model,
                               RedirectAttributes redirectAttributes) {
        try {
            Promotion promotion = promotionService.getPromotionById(id)
                    .orElseThrow(() -> new RuntimeException("Promotion not found"));
            model.addAttribute("promotion", promotion);
            // Fetch all parking places for the dropdown
            List<ParkingPlace> parkingPlaces = parkingPlaceService.getAllParkingPlaces();
            model.addAttribute("parkingPlaces", parkingPlaces);
            return "promotion-edit";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage",
                    "Promotion not found");
            return "redirect:/promotions";
        }
    }

    @PostMapping("/edit/{id}")
    public String updatePromotion(
            @PathVariable Integer id,
            @RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam(value = "lotName", required = false) String lotName,
            @RequestParam(value = "image", required = false) MultipartFile image,
            @RequestParam(value = "discountPercentage", required = false) Double discountPercentage,
            @RequestParam(value = "discountAmount", required = false) Double discountAmount,
            @RequestParam("promoCode") String promoCode,
            @RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
            @RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,
            @RequestParam(value = "isActive", defaultValue = "false") Boolean isActive,
            RedirectAttributes redirectAttributes) {

        try {
            Promotion existingPromotion = promotionService.getPromotionById(id)
                    .orElseThrow(() -> new RuntimeException("Promotion not found"));

            existingPromotion.setTitle(title);
            existingPromotion.setDescription(description);
            existingPromotion.setLotName(lotName);
            existingPromotion.setDiscountPercentage(discountPercentage);
            existingPromotion.setDiscountAmount(discountAmount);
            existingPromotion.setPromoCode(promoCode);
            existingPromotion.setStartDate(startDate);
            existingPromotion.setEndDate(endDate);
            existingPromotion.setIsActive(isActive);

            // Handle image upload
            if (image != null && !image.isEmpty()) {
                // Delete old image if exists
                if (existingPromotion.getImagePath() != null) {
                    deleteImage(existingPromotion.getImagePath());
                }
                String imagePath = saveImage(image);
                existingPromotion.setImagePath(imagePath);
            }

            promotionService.updatePromotion(id, existingPromotion);

            redirectAttributes.addFlashAttribute("successMessage",
                    "Promotion updated successfully!");
            return "redirect:/promotions";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage",
                    "Error updating promotion: " + e.getMessage());
            return "redirect:/promotions/edit/" + id;
        }
    }

    @GetMapping("/delete/{id}")
    public String deletePromotion(@PathVariable Integer id,
                                  RedirectAttributes redirectAttributes) {
        try {
            Promotion promotion = promotionService.getPromotionById(id).orElse(null);
            if (promotion != null && promotion.getImagePath() != null) {
                deleteImage(promotion.getImagePath());
            }
            promotionService.deletePromotion(id);
            redirectAttributes.addFlashAttribute("successMessage",
                    "Promotion deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage",
                    "Error deleting promotion: " + e.getMessage());
        }
        return "redirect:/promotions";
    }

    @GetMapping("/toggle/{id}")
    public String toggleStatus(@PathVariable Integer id,
                               RedirectAttributes redirectAttributes) {
        try {
            promotionService.togglePromotionStatus(id);
            redirectAttributes.addFlashAttribute("successMessage",
                    "Promotion status updated!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage",
                    "Error updating status: " + e.getMessage());
        }
        return "redirect:/promotions";
    }

    // Public page to view active promotions
    @GetMapping("/active")
    public String viewActivePromotions(Model model) {
        List<Promotion> activePromotions = promotionService.getActivePromotion();
        model.addAttribute("promotions", activePromotions);
        return "promotion-active-list";
    }

    private String saveImage(MultipartFile file) throws IOException {
        // Create upload directory if it doesn't exist
        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Generate unique filename
        String originalFilename = file.getOriginalFilename();
        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
        String filename = UUID.randomUUID().toString() + extension;

        // Save file
        Path filePath = Paths.get(UPLOAD_DIR + filename);
        Files.write(filePath, file.getBytes());

        return UPLOAD_DIR + filename;
    }

    private void deleteImage(String imagePath) {
        try {
            File file = new File(imagePath);
            if (file.exists()) {
                file.delete();
            }
        } catch (Exception e) {
            // Log error but don't throw exception
            System.err.println("Error deleting image: " + e.getMessage());
        }
    }
}