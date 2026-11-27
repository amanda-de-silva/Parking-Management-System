package com.example.parkingsystem.design.strategy;

import com.example.parkingsystem.model.Payment;

public interface PaymentStrategy {
    void validate(Payment payment);
    String generateTransactionId();
}