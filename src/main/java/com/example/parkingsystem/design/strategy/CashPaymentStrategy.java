package com.example.parkingsystem.design.strategy;

import com.example.parkingsystem.model.Payment;

import java.util.UUID;

public class CashPaymentStrategy implements PaymentStrategy {
    @Override
    public void validate(Payment payment) {
        // Dummy validation for digital wallet
        System.out.println("[STRATEGY] Validating cash payment");
    }

    @Override
    public String generateTransactionId() {
        return "DW-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
}
