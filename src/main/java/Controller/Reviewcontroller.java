package Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Model.Review;

public class Reviewcontroller {
	 private Connection conn;

	    public Reviewcontroller(Connection conn) {
	        this.conn = conn;
	    }

	    public boolean addReview(Review review) {
	        PreparedStatement statement = null;
	        boolean success = false;

	        try {
	            String sql = "INSERT INTO reviews (user_id, user_name, user_email, review_content) VALUES (?, ?, ?, ?)";
	            statement = conn.prepareStatement(sql);
	            statement.setInt(1, review.getUserId());
	            statement.setString(2, review.getUserName());
	            statement.setString(3, review.getUserEmail());
	            statement.setString(4, review.getReviewContent());

	            int rowsInserted = statement.executeUpdate();
	            if (rowsInserted > 0) {
	                success = true;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (statement != null) {
	                    statement.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return success;
	    }

	    public boolean deleteReview(int reviewId) {
	        try {
	            String sql = "DELETE FROM reviews WHERE id = ?";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setInt(1, reviewId);
	            int rowsDeleted = ps.executeUpdate();
	            return rowsDeleted > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle SQL exception
	        }
	        return false;
	    }
	    
	    public boolean updateReview(int reviewId, String reviewContent) {
	        PreparedStatement statement = null;
	        boolean success = false;

	        try {
	            String sql = "UPDATE reviews SET review_content = ? WHERE id = ?";
	            statement = conn.prepareStatement(sql);
	            statement.setString(1, reviewContent);
	            statement.setInt(2, reviewId);

	            int rowsUpdated = statement.executeUpdate();
	            if (rowsUpdated > 0) {
	                success = true;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (statement != null) {
	                    statement.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return success;
	    }
	   
}
