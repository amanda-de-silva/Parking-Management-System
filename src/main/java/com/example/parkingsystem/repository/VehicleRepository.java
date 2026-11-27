package com.example.parkingsystem.repository;

import com.example.parkingsystem.model.Vehicle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface VehicleRepository extends JpaRepository<Vehicle, Long> {
    List<Vehicle> findByUserIdAndActiveTrue(Long userId);

    Optional<Vehicle> findByVehicleNumberAndActiveTrue(String vehicleNumber);

    boolean existsByVehicleNumberAndActiveTrue(String vehicleNumber);
}