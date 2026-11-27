package com.example.parkingsystem.service;


import com.example.parkingsystem.design.factory.VehicleValidator;
import com.example.parkingsystem.design.factory.VehicleValidatorFactory;
import com.example.parkingsystem.model.Vehicle;
import com.example.parkingsystem.repository.VehicleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class VehicleService {
    @Autowired
    private VehicleRepository vehicleRepository;

    public Vehicle createVehicle(Vehicle vehicle) {
        VehicleValidator validator = VehicleValidatorFactory.createValidator(vehicle.getVehicleType());

        if (!validator.validate(vehicle)) {
            throw new RuntimeException(validator.getValidationError());
        }

        if (vehicleRepository.existsByVehicleNumberAndActiveTrue(vehicle.getVehicleNumber())) {
            throw new RuntimeException("Vehicle with this number already exists");
        }
        return vehicleRepository.save(vehicle);
    }

    public List<Vehicle> getAllVehiclesByUser(Long userId) {
        return vehicleRepository.findByUserIdAndActiveTrue(userId);
    }

    public Optional<Vehicle> getVehicleById(Long id) {
        return vehicleRepository.findById(id);
    }

    public Vehicle updateVehicle(Long id, Vehicle updatedVehicle) {
        Optional<Vehicle> existing = vehicleRepository.findById(id);
        if (existing.isPresent()) {
            Vehicle vehicle = existing.get();

            if (!vehicle.getVehicleNumber().equals(updatedVehicle.getVehicleNumber())) {
                if (vehicleRepository.existsByVehicleNumberAndActiveTrue(updatedVehicle.getVehicleNumber())) {
                    throw new RuntimeException("Vehicle with this number already exists");
                }
            }

            vehicle.setVehicleNumber(updatedVehicle.getVehicleNumber());
            vehicle.setVehicleType(updatedVehicle.getVehicleType());
            vehicle.setVehicleBrand(updatedVehicle.getVehicleBrand());
            vehicle.setVehicleModel(updatedVehicle.getVehicleModel());
            vehicle.setVehicleColor(updatedVehicle.getVehicleColor());

            return vehicleRepository.save(vehicle);
        }
        return null;
    }

    public boolean deleteVehicle(Long id) {
        Optional<Vehicle> existing = vehicleRepository.findById(id);
        if (existing.isPresent()) {
            Vehicle vehicle = existing.get();
            vehicle.setActive(false);
            vehicleRepository.save(vehicle);
            return true;
        }
        return false;
    }

    public List<Vehicle> getAllVehicles() {
        return vehicleRepository.findAll();
    }
}
