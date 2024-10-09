package Main;

import com.Hexaware.EntityModel.Item;
import com.Hexaware.Exception.InvalidPriceException;

import dao.ItemDao;

import java.util.Scanner;

public class MainModule {
	 public static void main(String[] args) {
	        ItemDao itemDao = new ItemDao();
	        Scanner scanner = new Scanner(System.in);

	        while (true) {
	            System.out.println("1. Add Item\n2. Exit");
	            int choice = scanner.nextInt();

	            switch (choice) {
	                case 1:
	                    System.out.println("Enter item name:");
	                    String name = scanner.next();
	                    System.out.println("Enter item price:");
	                    double price = scanner.nextDouble();
	                    System.out.println("Enter item category:");
	                    String category = scanner.next();
	                    try {
	                        Item item = new Item(name, price, category);
	                        itemDao.addItem(item);
	                        System.out.println("Item added successfully.");
	                    } catch (InvalidPriceException e) {
	                        System.out.println(e.getMessage());
	                    }
	                    break;
	                case 2:
	                    System.exit(0);
	            }
	        }
	    }

}
