package com.example.parkingsystem.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "bookings")
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long userId;

    @Column(nullable = false)
    private Long vehicleId;

    @Column(nullable = false)
    private Long parkingPlaceId;

    @Column(nullable = false)
    private LocalDateTime bookingStartTime;

    @Column(nullable = false)
    private LocalDateTime bookingEndTime;

    @Column(nullable = false)
    private String bookingStatus; // PENDING, CONFIRMED, CANCELLED, COMPLETED

    @Column(precision = 10, scale = 2)
    private BigDecimal totalAmount;

    @Column(nullable = false)
    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;

    // Constructors
    public Booking() {
        this.createdAt = LocalDateTime.now();
        this.bookingStatus = "PENDING";
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }

    public Long getVehicleId() { return vehicleId; }
    public void setVehicleId(Long vehicleId) { this.vehicleId = vehicleId; }

    public Long getParkingPlaceId() { return parkingPlaceId; }
    public void setParkingPlaceId(Long parkingPlaceId) { this.parkingPlaceId = parkingPlaceId; }

    public LocalDateTime getBookingStartTime() { return bookingStartTime; }
    public void setBookingStartTime(LocalDateTime bookingStartTime) { this.bookingStartTime = bookingStartTime; }

    public LocalDateTime getBookingEndTime() { return bookingEndTime; }
    public void setBookingEndTime(LocalDateTime bookingEndTime) { this.bookingEndTime = bookingEndTime; }

    public String getBookingStatus() { return bookingStatus; }
    public void setBookingStatus(String bookingStatus) { this.bookingStatus = bookingStatus; }

    public BigDecimal getTotalAmount() { return totalAmount; }
    public void setTotalAmount(BigDecimal totalAmount) { this.totalAmount = totalAmount; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
}
