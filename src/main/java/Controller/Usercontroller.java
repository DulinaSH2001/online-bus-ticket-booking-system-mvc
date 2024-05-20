package Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import Model.User;

public class Usercontroller {
	
	private Connection conn ;
	
	public Usercontroller(Connection conn) {
		this.conn =conn;
	}
	

	    
	    // User login
	    public User login(String username, String password) throws SQLException {
	    	 if (conn == null) {
	             throw new SQLException("Database connection is null");
	         }
	    	
	    	
	        String query = "SELECT * FROM users WHERE u_username = ? AND u_password = ?";
	        try (PreparedStatement statement = conn.prepareStatement(query)) {
	            statement.setString(1, username);
	            statement.setString(2, password);
	            try (ResultSet resultSet = statement.executeQuery()) {
	                if (resultSet.next()) {
	                    // User found, return user object
	                    return new User(resultSet.getInt("u_id"),
	                                    resultSet.getString("u_username"),
	                                    resultSet.getString("u_password"),
	                                    resultSet.getString("u_email"),
	                                    resultSet.getString("u_name"),
	                                    resultSet.getString("u_phone"),
	                                    resultSet.getString("u_nic"));
	                    
	                    
	                } else {
	                    System.out.println("user not found ");
	                    return null ;
	                }
	            }
	        }
	    }

	    // User registration
	    public boolean register(User user) throws SQLException {
	        String query = "INSERT INTO users (u_username, u_password, u_email, u_name, u_phone,u_nic) VALUES (?, ?, ?, ?, ?,?)";
	        try (PreparedStatement statement = conn.prepareStatement(query)) {
	            statement.setString(1, user.getUsername());
	            statement.setString(2, user.getPassword());
	            statement.setString(3, user.getEmail());
	            statement.setString(4, user.getName());
	            statement.setString(5, user.getPhoneNumber());
	            statement.setString(6, user.getNic());
	            int rowsAffected = statement.executeUpdate();
	            return rowsAffected > 0;
	        }
	    }

	    // Update user details
	    public boolean updateUser(User user) throws SQLException {
	    	String query = "UPDATE users SET u_name = ?, u_email = ?, u_phone = ?, u_nic = ?, u_username = ?, u_password = ? WHERE u_id = ?";
	        try (PreparedStatement statement = conn.prepareStatement(query)) {
	            statement.setString(1, user.getName());
	            statement.setString(2, user.getEmail());
	            statement.setString(3, user.getPhoneNumber());
	            statement.setString(4, user.getNic());
	            statement.setString(5, user.getUsername());
	            statement.setString(6, user.getPassword());
	            statement.setInt(7, user.getId());
	            int rowsAffected = statement.executeUpdate();
	            return rowsAffected > 0;
	        }catch(SQLException e) {
	        	e.printStackTrace();
	        	return false;
	        }
	    }

	   
	    public boolean deleteUser(int userId) throws SQLException {
	        String query = "DELETE FROM users WHERE u_id = ?";
	        try (PreparedStatement statement = conn.prepareStatement(query)) {
	            statement.setInt(1, userId);
	            int rowsAffected = statement.executeUpdate();
	            return rowsAffected > 0;
	        }
	    }
	    public boolean checkAdminCredentials(String email, String password) throws SQLException {
	        // Hardcoded admin credentials for demonstration, replace with database query
	        if ("admin@gmail.com".equals(email) && "admin123".equals(password)) {
	            return true; // Admin credentials are correct
	        } else {
	            return false; // Admin credentials are incorrect
	        }
	    }
	}