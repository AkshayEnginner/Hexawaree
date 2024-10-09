package com.Hexaware.Exception;

public class InsufficientPaymentException extends RuntimeException
{
    public InsufficientPaymentException(String message)
    {
        super(message);
    }
}