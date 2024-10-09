package dao;

import com.Hexaware.EntityModel.Item;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.Hexaware.Util.Connectionns;

public class ItemDao {
	 public void addItem(Item item) {
	        String sql = "INSERT INTO items (itemName, price, category) VALUES (?, ?, ?)";
	        try (Connection connection = Connectionns.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	            preparedStatement.setString(1, item.getItemName());
	            preparedStatement.setDouble(2, item.getPrice());
	            preparedStatement.setString(3, item.getCategory());
	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	

}
