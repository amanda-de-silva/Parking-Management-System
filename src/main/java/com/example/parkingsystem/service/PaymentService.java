package com.example.parkingsystem.service;

import com.example.parkingsystem.design.strategy.CreditCardPaymentStrategy;
import com.example.parkingsystem.design.strategy.PaymentStrategy;
import com.example.parkingsystem.model.Payment;
import com.example.parkingsystem.repository.PaymentRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
public class PaymentService {
    private final PaymentRepository paymentRepository;
    private PaymentStrategy paymentStrategy;

    public PaymentService(PaymentRepository paymentRepository) {
        this.paymentRepository = paymentRepository;
    }

    public void setPaymentStrategy(PaymentStrategy strategy) {
        this.paymentStrategy = strategy;
    }

    public Payment processPayment(Payment payment) {
        if (paymentStrategy == null) {
            paymentStrategy = new CreditCardPaymentStrategy();
        }

        paymentStrategy.validate(payment);
        payment.setTransactionId(paymentStrategy.generateTransactionId());
        payment.setDate(LocalDateTime.now());

        if (payment.getStatus() == null || payment.getStatus().isEmpty()) {
            payment.setStatus("SUCCESS");
        }

        return paymentRepository.save(payment);
    }

    public List<Payment> getAllPayments() {
        return paymentRepository.findAll();
    }

    public Payment getPaymentById(Long id) {
        return paymentRepository.findById(id);
    }

    public List<Payment> getPaymentsByReservationId(Long reservationId) {
        return paymentRepository.findByReservationId(reservationId);
    }
}