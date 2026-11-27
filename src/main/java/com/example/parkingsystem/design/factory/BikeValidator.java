package com.example.parkingsystem.design.factory;

import com.example.parkingsystem.model.Vehicle;

public class BikeValidator implements VehicleValidator {
    @Override
    public boolean validate(Vehicle vehicle) {
        System.out.println("[FACTORY] Validating bike: " + vehicle.getVehicleNumber());
        return vehicle.getVehicleNumber() != null && !vehicle.getVehicleNumber().isEmpty();
    }

    @Override
    public String getValidationError() {
        return "Invalid bike registration";
    }
}
