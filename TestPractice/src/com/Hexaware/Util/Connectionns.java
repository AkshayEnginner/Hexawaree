package com.Hexaware.Util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;
import java.sql.Statement;


public class Connectionns {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Get connection to the database
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ShopSmart", "root", "Akshay3012@#");
        System.out.println("Connection established");

        Statement s = con.createStatement();

		/*s.execute("create table student (username varchar(20), password varchar(20))");

		

		System.out.println("table created");*/
        
        
        
        
        
        
        
        
        
        
        
        
        // Prepare the SQL INSERT statement with placeholders
        PreparedStatement ps = con.prepareStatement("INSERT INTO users (username, password) VALUES (?, ?)");
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter your username");
        String name = sc.next();
        ps.setString(1, name); // Set the first placeholder

        System.out.println("Enter your password");
        String pass = sc.next();
        ps.setString(2, pass); // Set the second placeholder

        // Execute the update
        ps.executeUpdate();
        System.out.println("Insertion done");

        // Close resources
        ps.close();
        con.close();
        sc.close();
    }

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/ShopSmart", "root", "Akshay3012@#");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null; // or throw an exception
        }
    }
}      