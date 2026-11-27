package com.example.parkingsystem.service;

import com.example.parkingsystem.model.Booking;
import com.example.parkingsystem.model.ParkingPlace;
import com.example.parkingsystem.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class BookingService {

    @Autowired
    private BookingRepository bookingRepository;

    @Autowired
    private ParkingPlaceService parkingPlaceService;

    public Booking createBooking(Booking booking) throws Exception {
        // Validate parking place exists
        Optional<ParkingPlace> parkingPlace = parkingPlaceService.getParkingPlaceById(booking.getParkingPlaceId());
        if (!parkingPlace.isPresent()) {
            throw new Exception("Parking place not found");
        }

        ParkingPlace place = parkingPlace.get();

        // Check if slots are available
        if (place.getAvailableSlots() <= 0) {
            throw new Exception("No available slots");
        }

        // Check for overlapping bookings and slot availability
        Long activeBookings = bookingRepository.countActiveBookingsInTimeRange(
                booking.getParkingPlaceId(),
                booking.getBookingStartTime(),
                booking.getBookingEndTime()
        );

        if (activeBookings >= place.getTotalSlots()) {
            throw new Exception("All slots are booked for the selected time period");
        }

        // Calculate total amount
        Duration duration = Duration.between(booking.getBookingStartTime(), booking.getBookingEndTime());
        long hours = duration.toHours();
        if (hours < 1) hours = 1; // Minimum 1 hour

        BigDecimal totalAmount = place.getHourlyRate().multiply(BigDecimal.valueOf(hours));
        booking.setTotalAmount(totalAmount);
        booking.setBookingStatus("CONFIRMED");

        // Decrement available slots
        parkingPlaceService.decrementAvailableSlots(booking.getParkingPlaceId());

        return bookingRepository.save(booking);
    }

    public List<Booking> getAllBookingsByUser(Long userId) {
        return bookingRepository.findByUserIdOrderByCreatedAtDesc(userId);
    }

    public Optional<Booking> getBookingById(Long id) {
        return bookingRepository.findById(id);
    }

    public Booking updateBooking(Long id, Booking updatedBooking) throws Exception {
        Optional<Booking> existing = bookingRepository.findById(id);
        if (!existing.isPresent()) {
            throw new Exception("Booking not found");
        }

        Booking booking = existing.get();

        // Only allow updates if booking is PENDING or CONFIRMED
        if ("END".equals(booking.getBookingStatus()) || "COMPLETED".equals(booking.getBookingStatus())) {
            throw new Exception("Cannot update completed or cancelled booking");
        }

        // If time is being changed, validate availability
        boolean timeChanged = !booking.getBookingStartTime().equals(updatedBooking.getBookingStartTime()) ||
                !booking.getBookingEndTime().equals(updatedBooking.getBookingEndTime());

        if (timeChanged) {
            Optional<ParkingPlace> parkingPlace = parkingPlaceService.getParkingPlaceById(booking.getParkingPlaceId());
            if (parkingPlace.isPresent()) {
                Long activeBookings = bookingRepository.countActiveBookingsInTimeRange(
                        booking.getParkingPlaceId(),
                        updatedBooking.getBookingStartTime(),
                        updatedBooking.getBookingEndTime()
                );

                // Subtract current booking from count
                activeBookings--;

                if (activeBookings >= parkingPlace.get().getTotalSlots()) {
                    throw new Exception("All slots are booked for the selected time period");
                }

                // Recalculate amount
                Duration duration = Duration.between(updatedBooking.getBookingStartTime(), updatedBooking.getBookingEndTime());
                long hours = duration.toHours();
                if (hours < 1) hours = 1;

                BigDecimal totalAmount = parkingPlace.get().getHourlyRate().multiply(BigDecimal.valueOf(hours));
                booking.setTotalAmount(totalAmount);
            }
        }

        booking.setVehicleId(updatedBooking.getVehicleId());
        booking.setBookingStartTime(updatedBooking.getBookingStartTime());
        booking.setBookingEndTime(updatedBooking.getBookingEndTime());
        booking.setUpdatedAt(LocalDateTime.now());

        return bookingRepository.save(booking);
    }

    public boolean cancelBooking(Long id) {
        Optional<Booking> existing = bookingRepository.findById(id);
        if (existing.isPresent()) {
            Booking booking = existing.get();
            if ("CONFIRMED".equals(booking.getBookingStatus()) || "PENDING".equals(booking.getBookingStatus())) {
                booking.setBookingStatus("END");
                booking.setUpdatedAt(LocalDateTime.now());
                bookingRepository.save(booking);

                // Increment available slots
                parkingPlaceService.incrementAvailableSlots(booking.getParkingPlaceId());
                return true;
            }
        }
        return false;
    }

    public boolean deleteBooking(Long id) {
        return cancelBooking(id);
    }

    public List<Booking>getAllBooking(){
        return bookingRepository.findAll();
    }

    public List<Booking> getBookingsByOwnerId(Long ownerId) {
        return bookingRepository.findBookingsByParkingOwnerId(ownerId);
    }

    public List<Booking> getBookingsByParkingPlaces(List<ParkingPlace> parkingPlaces) {
        List<Booking> allBookings = new ArrayList<>();

        for (ParkingPlace parkingPlace : parkingPlaces) {
            List<Booking> bookings = bookingRepository.findByParkingPlaceId(parkingPlace.getId());
            allBookings.addAll(bookings);
        }

        return allBookings;
    }

    // In BookingService.java
    public void deleteBookingRecord(Long id) {
        bookingRepository.deleteById(id);
    }
}
