package com.example.parkingsystem.design.factory;

import com.example.parkingsystem.model.Vehicle;

public class TruckValidator implements VehicleValidator {
    @Override
    public boolean validate(Vehicle vehicle) {
        System.out.println("[FACTORY] Validating truck: " + vehicle.getVehicleNumber());
        return vehicle.getVehicleNumber() != null && !vehicle.getVehicleNumber().isEmpty();
    }

    @Override
    public String getValidationError() {
        return "Invalid truck registration";
    }
}
