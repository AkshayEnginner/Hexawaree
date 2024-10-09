package com.Hexaware.EntityModel;

import com.Hexaware.Exception.InvalidPriceException;

public class Item {
	 private String itemName;
	    private double price;
	    private String category;

	    public Item(String itemName, double price, String category) {
	        this.itemName = itemName;
	        setPrice(price); // use setter to validate
	        this.category = category;
	    }

	    public String getItemName() {
	        return itemName;
	    }

	    public double getPrice() {
	        return price;
	    }

	    public void setPrice(double price) {
	        if (price <= 0) {
	            throw new InvalidPriceException("Price must be positive");
	        }
	        this.price = price;
	    }

	    public String getCategory() {
	        return category;
	    }

	    @Override
	    public String toString() {
	        return "Item{name='" + itemName + "', price=" + price + ", category='" + category + "'}";
	    }

}
