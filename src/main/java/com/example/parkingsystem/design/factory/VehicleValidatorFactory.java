package com.example.parkingsystem.design.factory;

public class VehicleValidatorFactory {
    public static VehicleValidator createValidator(String vehicleType) {
        switch (vehicleType.toUpperCase()) {
            case "CAR":
                return new CarValidator();
            case "BIKE":
                return new BikeValidator();
            case "TRUCK":
                return new TruckValidator();
            default:
                return new DefaultVehicleValidator();
        }
    }
}