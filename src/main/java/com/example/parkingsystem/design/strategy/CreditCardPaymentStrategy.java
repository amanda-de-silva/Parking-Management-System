package com.example.parkingsystem.design.strategy;

import com.example.parkingsystem.model.Payment;

import java.util.UUID;

public class CreditCardPaymentStrategy implements PaymentStrategy {
    @Override
    public void validate(Payment payment) {
        // Dummy validation for credit card
        System.out.println("[STRATEGY] Validating credit card payment");
    }

    @Override
    public String generateTransactionId() {
        return "CC-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
}
