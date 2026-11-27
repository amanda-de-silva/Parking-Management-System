package com.example.parkingsystem.repository;


import com.example.parkingsystem.model.Promotion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface PromotionRepository extends JpaRepository<Promotion, Integer> {

    Optional<Promotion> findByPromoCode(String promoCode);

    List<Promotion> findByIsActiveTrue();

    @Query("SELECT p FROM Promotion p WHERE p.isActive = true " +
            "AND p.startDate <= :currentDate AND p.endDate >= :currentDate")
    List<Promotion> findActivePromotions(Date currentDate);

    @Query("SELECT p FROM Promotion p WHERE p.startDate <= :currentDate " +
            "AND p.endDate >= :currentDate ORDER BY p.createdAt DESC")
    List<Promotion> findCurrentPromotions(Date currentDate);
}