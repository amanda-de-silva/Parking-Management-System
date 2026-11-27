package com.example.parkingsystem.service;

import com.example.parkingsystem.model.ParkingPlace;
import com.example.parkingsystem.repository.ParkingPlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class ParkingPlaceService {

    @Autowired
    private ParkingPlaceRepository parkingPlaceRepository;

    public ParkingPlace createParkingPlace(ParkingPlace parkingPlace) {
        parkingPlace.setTotalSlots(parkingPlace.getAvailableSlots());
        return parkingPlaceRepository.save(parkingPlace);
    }

    public List<ParkingPlace> getAllParkingPlaces() {
        return parkingPlaceRepository.findByActiveTrue();
    }

    public List<ParkingPlace> getParkingPlacesByOwner(Long ownerId) {
        return parkingPlaceRepository.findByOwnerIdAndActiveTrue(ownerId);
    }

    public Optional<ParkingPlace> getParkingPlaceById(Long id) {
        return parkingPlaceRepository.findById(id);
    }

    public ParkingPlace updateParkingPlace(Long id, ParkingPlace updatedPlace) {
        Optional<ParkingPlace> existing = parkingPlaceRepository.findById(id);
        if (existing.isPresent()) {
            ParkingPlace place = existing.get();
            place.setParkingName(updatedPlace.getParkingName());
            place.setDescription(updatedPlace.getDescription());
            place.setParkingType(updatedPlace.getParkingType());
            place.setAddress(updatedPlace.getAddress());
            place.setCity(updatedPlace.getCity());
            place.setDistrict(updatedPlace.getDistrict());
            place.setLatitude(updatedPlace.getLatitude());
            place.setLongitude(updatedPlace.getLongitude());

            // Update slots carefully
            int difference = updatedPlace.getTotalSlots() - place.getTotalSlots();
            place.setTotalSlots(updatedPlace.getTotalSlots());
            place.setAvailableSlots(place.getAvailableSlots() + difference);

            place.setHourlyRate(updatedPlace.getHourlyRate());
            place.setOpeningTime(updatedPlace.getOpeningTime());
            place.setClosingTime(updatedPlace.getClosingTime());
            place.setEvChargingAvailable(updatedPlace.getEvChargingAvailable());
            place.setParkingImages(updatedPlace.getParkingImages());
            place.setContactNumber(updatedPlace.getContactNumber());

            return parkingPlaceRepository.save(place);
        }
        return null;
    }

    public boolean deleteParkingPlace(Long id) {
        Optional<ParkingPlace> existing = parkingPlaceRepository.findById(id);
        if (existing.isPresent()) {
            ParkingPlace place = existing.get();
            place.setActive(false);
            parkingPlaceRepository.save(place);
            return true;
        }
        return false;
    }

    public List<ParkingPlace> getAvailableParkingPlaces() {
        return parkingPlaceRepository.findAvailableParkingPlaces();
    }

    public boolean decrementAvailableSlots(Long parkingPlaceId) {
        Optional<ParkingPlace> existing = parkingPlaceRepository.findById(parkingPlaceId);
        if (existing.isPresent()) {
            ParkingPlace place = existing.get();
            if (place.getAvailableSlots() > 0) {
                place.setAvailableSlots(place.getAvailableSlots() - 1);
                parkingPlaceRepository.save(place);
                return true;
            }
        }
        return false;
    }

    public void incrementAvailableSlots(Long parkingPlaceId) {
        Optional<ParkingPlace> existing = parkingPlaceRepository.findById(parkingPlaceId);
        if (existing.isPresent()) {
            ParkingPlace place = existing.get();
            place.setAvailableSlots(place.getAvailableSlots() + 1);
            parkingPlaceRepository.save(place);
        }
    }

    public Optional<ParkingPlace> getParkingPlaceByName(String name) {
        return parkingPlaceRepository.findByParkingName(name);
    }

    public List<ParkingPlace> getParkingPlacesByOwnerNew(Long ownerId) {
        return parkingPlaceRepository.findByOwnerId(ownerId);
    }


}