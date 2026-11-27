package com.example.parkingsystem.service;

import com.example.parkingsystem.model.Promotion;
import com.example.parkingsystem.repository.PromotionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@Transactional
public class PromotionService {

    @Autowired
    private PromotionRepository promotionRepository;

    public Promotion createPromotion(Promotion promotion) {
        return promotionRepository.save(promotion);
    }

    public List<Promotion> getAllPromotions() {
        return promotionRepository.findAll();
    }

    public Optional<Promotion> getPromotionById(Integer id) {
        return promotionRepository.findById(id);
    }

    public List<Promotion> getActivePromotions() {
        return promotionRepository.findActivePromotions(new Date());
    }

    public List<Promotion> getActivePromotion() {
        return promotionRepository.findByIsActiveTrue();
    }

    public List<Promotion> getCurrentPromotions() {
        return promotionRepository.findCurrentPromotions(new Date());
    }

    public Promotion updatePromotion(Integer id, Promotion promotionDetails) {
        Promotion promotion = promotionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Promotion not found"));

        promotion.setTitle(promotionDetails.getTitle());
        promotion.setDescription(promotionDetails.getDescription());
        promotion.setLotName(promotionDetails.getLotName());
        promotion.setImagePath(promotionDetails.getImagePath());
        promotion.setDiscountPercentage(promotionDetails.getDiscountPercentage());
        promotion.setDiscountAmount(promotionDetails.getDiscountAmount());
        promotion.setPromoCode(promotionDetails.getPromoCode());
        promotion.setStartDate(promotionDetails.getStartDate());
        promotion.setEndDate(promotionDetails.getEndDate());
        promotion.setIsActive(promotionDetails.getIsActive());

        return promotionRepository.save(promotion);
    }

    public void deletePromotion(Integer id) {
        promotionRepository.deleteById(id);
    }

    public Promotion togglePromotionStatus(Integer id) {
        Promotion promotion = promotionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Promotion not found"));
        promotion.setIsActive(!promotion.getIsActive());
        return promotionRepository.save(promotion);
    }

    public Map<String, Object> validatePromoCode(String promoCode, Double bookingAmount) {
        Map<String, Object> result = new HashMap<>();

        Optional<Promotion> promoOpt = promotionRepository.findByPromoCode(promoCode);

        if (!promoOpt.isPresent()) {
            result.put("valid", false);
            result.put("message", "Invalid promo code");
            return result;
        }

        Promotion promo = promoOpt.get();
        Date now = new Date();

        if (!promo.getIsActive()) {
            result.put("valid", false);
            result.put("message", "Promotion is not active");
            return result;
        }

        if (now.before(promo.getStartDate()) || now.after(promo.getEndDate())) {
            result.put("valid", false);
            result.put("message", "Promotion has expired or not yet started");
            return result;
        }

        Double discount = 0.0;
        if (promo.getDiscountPercentage() != null) {
            discount = bookingAmount * (promo.getDiscountPercentage() / 100.0);
        } else if (promo.getDiscountAmount() != null) {
            discount = promo.getDiscountAmount();
        }

        Double finalAmount = bookingAmount - discount;
        if (finalAmount < 0) finalAmount = 0.0;

        result.put("valid", true);
        result.put("promotion", promo);
        result.put("discount", discount);
        result.put("finalAmount", finalAmount);
        result.put("message", "Promo code applied successfully");

        return result;
    }

    public Promotion validatePromoCode(String promoCode, String parkingPlaceName, Date bookingDate) {
        Optional<Promotion> promoOpt = promotionRepository.findByPromoCode(promoCode);

        if (!promoOpt.isPresent()) {
            return null; // Promo code not found
        }

        Promotion promo = promoOpt.get();
        Date validationDate = (bookingDate != null) ? bookingDate : new Date();

        System.out.println("Found promo: " + promo.getTitle());
        System.out.println("Is Active: " + promo.getIsActive());
        System.out.println("Start Date: " + promo.getStartDate());
        System.out.println("End Date: " + promo.getEndDate());
        System.out.println("Validation Date: " + validationDate);
        System.out.println("Promo Lot Name: " + promo.getLotName());
        System.out.println("Parking Place Name: " + parkingPlaceName);
        // Check if promo is active
        if (!promo.getIsActive()) {
            return null;
        }

        // Check if promo is within valid date range using the booking date
        if (validationDate.before(promo.getStartDate()) || validationDate.after(promo.getEndDate())) {
            return null;
        }

        // Check if promo applies to this parking place
        // If lotName is null or empty, it applies to all parking places
        if (promo.getLotName() != null && !promo.getLotName().isEmpty()) {
            if (!promo.getLotName().equalsIgnoreCase(parkingPlaceName)) {
                return null; // Promo doesn't apply to this parking place
            }
        }

        return promo;
    }
}