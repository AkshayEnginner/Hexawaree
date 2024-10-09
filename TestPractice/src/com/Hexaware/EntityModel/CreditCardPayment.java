package com.Hexaware.EntityModel;

public class CreditCardPayment extends Payment {
	private String cardNumber;

    public CreditCardPayment(String payerName, double amount, String cardNumber) {
        super(payerName, amount);
        this.cardNumber = cardNumber;
    }

    @Override
    public void processPayment() {
        // Process credit card payment logic
        System.out.println("Processing credit card payment for " + payerName);
    }

}
