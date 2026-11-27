package com.example.parkingsystem.repository;

import com.example.parkingsystem.model.Booking;
import com.example.parkingsystem.model.ParkingPlace;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {
    List<Booking> findByUserId(Long userId);

    List<Booking> findByUserIdOrderByCreatedAtDesc(Long userId);

    List<Booking> findByParkingPlaceId(Long parkingPlaceId);

    List<Booking> findByVehicleId(Long vehicleId);

    @Query("SELECT b FROM Booking b WHERE b.parkingPlaceId = :parkingPlaceId " +
            "AND b.bookingStatus IN ('CONFIRMED', 'PENDING') " +
            "AND ((b.bookingStartTime <= :endTime AND b.bookingEndTime >= :startTime))")
    List<Booking> findOverlappingBookings(
            @Param("parkingPlaceId") Long parkingPlaceId,
            @Param("startTime") LocalDateTime startTime,
            @Param("endTime") LocalDateTime endTime
    );

    @Query("SELECT COUNT(b) FROM Booking b WHERE b.parkingPlaceId = :parkingPlaceId " +
            "AND b.bookingStatus IN ('CONFIRMED', 'PENDING') " +
            "AND ((b.bookingStartTime <= :endTime AND b.bookingEndTime >= :startTime))")
    Long countActiveBookingsInTimeRange(
            @Param("parkingPlaceId") Long parkingPlaceId,
            @Param("startTime") LocalDateTime startTime,
            @Param("endTime") LocalDateTime endTime
    );

    @Query("SELECT b FROM Booking b JOIN ParkingPlace p ON b.parkingPlaceId = p.id WHERE p.ownerId = :ownerId")
    List<Booking> findBookingsByParkingOwnerId(@Param("ownerId") Long ownerId);


}
