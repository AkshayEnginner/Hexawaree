package com.Hexaware.EntityModel;

import java.util.List;

public class Order {
	 private String orderID;
	    private List<Item> itemList;
	    private double totalPrice;

	    public Order(String orderID, List<Item> itemList) {
	        this.orderID = orderID;
	        this.itemList = itemList;
	        this.totalPrice = calculateTotalPrice();
	    }

	    public String getOrderID() {
	        return orderID;
	    }

	    public List<Item> getItemList() {
	        return itemList;
	    }

	    public double getTotalPrice() {
	        return totalPrice;
	    }

	    public double calculateTotalPrice() {
	        return itemList.stream().mapToDouble(Item::getPrice).sum();
	    }

}
