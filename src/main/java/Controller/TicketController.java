package Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class TicketController {
	private Connection conn;

	public TicketController(Connection conn) {
		this.conn = conn;

	}

	public boolean createTicket(String userId, String routeId,String username,String price) {

		PreparedStatement stmt = null;
		boolean success = false;
		try {
			conn = DBconnection.getconnection();
			String sql = "INSERT INTO tickets (user_id, route_id,user_name,price) VALUES (?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, userId);
			stmt.setString(2, routeId);
			stmt.setString(3, username);
			stmt.setString(4, price);
			int rowsAffected = stmt.executeUpdate();
			if (rowsAffected > 0) {
				success = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return success;
	}

}
