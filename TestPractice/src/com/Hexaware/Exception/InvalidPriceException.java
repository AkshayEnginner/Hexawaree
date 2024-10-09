package com.Hexaware.Exception;

public class InvalidPriceException extends RuntimeException 
{
    public InvalidPriceException(String message)
    {
        super(message);
    }
}