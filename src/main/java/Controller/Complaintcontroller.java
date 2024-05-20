package Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Complaintcontroller {
	private Connection conn;

    public Complaintcontroller(Connection conn) {
        this.conn = conn;
    }

    public boolean submitComplaint(String fullName, String email, String complaint,String c_status) {
        boolean success = false;
        String sql = "INSERT INTO complaints (full_name, email, complaint,c_status) VALUES (?, ?, ?,?)";

        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, fullName);
            statement.setString(2, email);
            statement.setString(3, complaint);
            statement.setString(4, c_status);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }
    public boolean deleteComplaint(int complaintId) {
        boolean success = false;
        try {
            String sql = "DELETE FROM complaints WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, complaintId);
            int rowsDeleted = statement.executeUpdate();
            if (rowsDeleted > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }
    public boolean markComplaintAsRead(int complaintId) {
        String sql = "UPDATE complaints SET c_status = 'Read' WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, complaintId);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
