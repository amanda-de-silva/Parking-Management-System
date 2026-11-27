package com.example.parkingsystem.design.factory;

import com.example.parkingsystem.model.Vehicle;

public class CarValidator implements VehicleValidator {
    @Override
    public boolean validate(Vehicle vehicle) {
        System.out.println("[FACTORY] Validating car: " + vehicle.getVehicleNumber());
        return vehicle.getVehicleNumber() != null && !vehicle.getVehicleNumber().isEmpty();
    }

    @Override
    public String getValidationError() {
        return "Invalid car registration";
    }
}
