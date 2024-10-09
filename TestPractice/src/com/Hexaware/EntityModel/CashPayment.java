package com.Hexaware.EntityModel;

import com.Hexaware.Exception.InsufficientPaymentException;

public class CashPayment extends Payment  {
	private double cashReceived;

    public CashPayment(String payerName, double amount, double cashReceived) {
        super(payerName, amount);
        this.cashReceived = cashReceived;
    }

    @Override
    public void processPayment() {
        if (cashReceived < amount) {
            throw new InsufficientPaymentException("Insufficient cash provided");
        }
        System.out.println("Processing cash payment for " + payerName);
    }

}
