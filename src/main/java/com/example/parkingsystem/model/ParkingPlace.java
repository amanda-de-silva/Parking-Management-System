package com.example.parkingsystem.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalTime;
import java.util.List;

@Entity
@Table(name = "parking_places")
public class ParkingPlace {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String parkingName;

    @Column(length = 1000)
    private String description;

    @Column(nullable = false)
    private String parkingType; // Car Park, Motorbike Park, Truck Park, All vehicle

    @Column(nullable = false)
    private String address;

    @Column(nullable = false)
    private String city;

    @Column(nullable = false)
    private String district;

    private Double latitude;
    private Double longitude;

    @Column(nullable = false)
    private Integer availableSlots;

    @Column(nullable = false)
    private Integer totalSlots;

    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal hourlyRate;

    @Column(nullable = false)
    private LocalTime openingTime;

    @Column(nullable = false)
    private LocalTime closingTime;

    @Column(nullable = false)
    private Boolean evChargingAvailable = false;

    @Column(length = 2000)
    private String parkingImages; // Comma-separated image paths

    @Column(nullable = false)
    private String contactNumber;

    @Column(nullable = false)
    private Long ownerId; // User ID of parking owner

    @Column(nullable = false)
    private Boolean active = true;

    // Constructors
    public ParkingPlace() {}

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getParkingName() { return parkingName; }
    public void setParkingName(String parkingName) { this.parkingName = parkingName; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getParkingType() { return parkingType; }
    public void setParkingType(String parkingType) { this.parkingType = parkingType; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getDistrict() { return district; }
    public void setDistrict(String district) { this.district = district; }

    public Double getLatitude() { return latitude; }
    public void setLatitude(Double latitude) { this.latitude = latitude; }

    public Double getLongitude() { return longitude; }
    public void setLongitude(Double longitude) { this.longitude = longitude; }

    public Integer getAvailableSlots() { return availableSlots; }
    public void setAvailableSlots(Integer availableSlots) { this.availableSlots = availableSlots; }

    public Integer getTotalSlots() { return totalSlots; }
    public void setTotalSlots(Integer totalSlots) { this.totalSlots = totalSlots; }

    public BigDecimal getHourlyRate() { return hourlyRate; }
    public void setHourlyRate(BigDecimal hourlyRate) { this.hourlyRate = hourlyRate; }

    public LocalTime getOpeningTime() { return openingTime; }
    public void setOpeningTime(LocalTime openingTime) { this.openingTime = openingTime; }

    public LocalTime getClosingTime() { return closingTime; }
    public void setClosingTime(LocalTime closingTime) { this.closingTime = closingTime; }

    public Boolean getEvChargingAvailable() { return evChargingAvailable; }
    public void setEvChargingAvailable(Boolean evChargingAvailable) { this.evChargingAvailable = evChargingAvailable; }

    public String getParkingImages() { return parkingImages; }
    public void setParkingImages(String parkingImages) { this.parkingImages = parkingImages; }

    public String getContactNumber() { return contactNumber; }
    public void setContactNumber(String contactNumber) { this.contactNumber = contactNumber; }

    public Long getOwnerId() { return ownerId; }
    public void setOwnerId(Long ownerId) { this.ownerId = ownerId; }

    public Boolean getActive() { return active; }
    public void setActive(Boolean active) { this.active = active; }
}
