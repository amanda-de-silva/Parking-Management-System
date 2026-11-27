package com.example.parkingsystem.design.factory;

import com.example.parkingsystem.model.Vehicle;

public interface VehicleValidator {
    boolean validate(Vehicle vehicle);
    String getValidationError();
}