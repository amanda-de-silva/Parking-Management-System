package com.example.parkingsystem.repository;


import com.example.parkingsystem.model.ParkingPlace;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ParkingPlaceRepository extends JpaRepository<ParkingPlace, Long> {
    List<ParkingPlace> findByOwnerIdAndActiveTrue(Long ownerId);

    List<ParkingPlace> findByActiveTrue();

    List<ParkingPlace> findByCityAndActiveTrue(String city);

    List<ParkingPlace> findByParkingTypeAndActiveTrue(String parkingType);

    @Query("SELECT p FROM ParkingPlace p WHERE p.active = true AND p.availableSlots > 0")
    List<ParkingPlace> findAvailableParkingPlaces();

    Optional<ParkingPlace> findByParkingName(String parkingName);

    List<ParkingPlace> findByOwnerId(Long ownerId);


}