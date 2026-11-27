package com.example.parkingsystem.design.factory;

import com.example.parkingsystem.model.Vehicle;

public class DefaultVehicleValidator implements VehicleValidator {
    @Override
    public boolean validate(Vehicle vehicle) {
        return vehicle.getVehicleNumber() != null;
    }

    @Override
    public String getValidationError() {
        return "Invalid vehicle";
    }
}