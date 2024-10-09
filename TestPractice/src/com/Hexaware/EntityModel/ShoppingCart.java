package com.Hexaware.EntityModel;

import java.util.ArrayList;
import java.util.List;


public class ShoppingCart {
	 private List<Item> cartItems;

	    public ShoppingCart() {
	        this.cartItems = new ArrayList<>();
	    }

	    public void addItem(Item item) {
	        cartItems.add(item);
	    }

	    public void removeItem(Item item) {
	        cartItems.remove(item);
	    }

	    public List<Item> listCartItems() {
	        return cartItems;
	    }

	    public void clearCart() {
	        cartItems.clear();
	    }
	

}
