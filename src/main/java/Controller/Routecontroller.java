package Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Route;

public class Routecontroller {
	private Connection conn ;
	
	public Routecontroller(Connection conn) {
		this.conn =conn;
	}
	
	
	    public boolean createRoute(Route route) {
	       
	       
	        PreparedStatement statement = null;
	        boolean success = false;

	        try {
	            conn = DBconnection.getconnection();
	            String sql = "INSERT INTO routes (from_location, to_location, start_time, finish_time, route_number, bus_reg_number , availability, price, seats, air_conditioned) VALUES (?, ?, ?, ?, ?,?, ?, ?, ?, ?)";
	            statement = conn.prepareStatement(sql);
	            statement.setString(1, route.getFromLocation());
	            statement.setString(2, route.getToLocation());
	            statement.setString(3, route.getStartTime());
	            statement.setString(4, route.getFinishTime());
	            statement.setString(5, route.getRouteNumber());
	            statement.setString(6, route.getBusRegNum());
	            statement.setInt(7, route.getAvailability());
	            statement.setDouble(8, route.getPrice());
	            statement.setInt(9, route.getSeats());
	            statement.setInt(10, route.isAirConditioned());
	            
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
	                if (conn != null) {
	                    conn.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return success;
	    }
	    public boolean updateAvailability(int routeId, int newAvailability) {
	        PreparedStatement statement = null;
	        boolean success = false;

	        try {
	            conn = DBconnection.getconnection();
	            String sql = "UPDATE routes SET availability = ? WHERE r_id = ?";
	            statement = conn.prepareStatement(sql);
	            statement.setInt(1, newAvailability);
	            statement.setInt(2, routeId);

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
	                if (conn != null) {
	                    conn.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return success;
	    }
	
	    public boolean updateRoute(Route route) {
	        PreparedStatement statement = null;
	        boolean success = false;

	        try {
	            conn = DBconnection.getconnection();
	            String sql = "UPDATE routes SET from_location = ?, to_location = ?, start_time = ?, finish_time = ?, route_number = ?, bus_reg_number = ?, availability = ?, price = ?, seats = ?, air_conditioned = ? WHERE r_id = ?";
	            statement = conn.prepareStatement(sql);
	            statement.setString(1, route.getFromLocation());
	            statement.setString(2, route.getToLocation());
	            statement.setString(3, route.getStartTime());
	            statement.setString(4, route.getFinishTime());
	            statement.setString(5, route.getRouteNumber());
	            statement.setString(6, route.getBusRegNum());
	            statement.setInt(7, route.getAvailability());
	            statement.setDouble(8, route.getPrice());
	            statement.setInt(9, route.getSeats());
	            statement.setInt(10, route.isAirConditioned());
	            statement.setInt(11, route.getId()); // Assuming routeId is present in the Route object

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
	    
	    public boolean deleteRoute(int routeId) {
	        PreparedStatement statement = null;
	        boolean success = false;

	        try {
	            conn = DBconnection.getconnection();
	            String sql = "DELETE FROM routes WHERE r_id = ?";
	            statement = conn.prepareStatement(sql);
	            statement.setInt(1, routeId);

	            int rowsDeleted = statement.executeUpdate();
	            if (rowsDeleted > 0) {
	                success = true;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (statement != null) {
	                    statement.close();
	                }
	                if (conn != null) {
	                    conn.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return success;
	    }
	    public List<Route> searchRoutes(String fromLocation, String toLocation) {
	        List<Route> searchResults = new ArrayList<>();
	        
	        PreparedStatement ps = null;
	        ResultSet rs = null;

	        try {
	            conn = DBconnection.getconnection();
	            String sql = "SELECT * FROM routes WHERE from_location = ? AND to_location = ?";
	            ps = conn.prepareStatement(sql);
	            ps.setString(1, fromLocation);
	            ps.setString(2, toLocation);
	            rs = ps.executeQuery();

	            while (rs.next()) {
	            	int id = rs.getInt("r_id");
					String fromLoc = rs.getString("from_location");
					String toLoc = rs.getString("to_location");
					String startTime = rs.getString("start_time");
					String finishTime = rs.getString("finish_time");
					String routeNumber = rs.getString("route_number");
					String busRegNumber = rs.getString("bus_reg_number");
					int availability = rs.getInt("availability");
					double price = rs.getDouble("price");
					int seats = rs.getInt("seats");
					int airConditioned = rs.getInt("air_conditioned");
					
					Route route = new Route(id, fromLoc, toLoc,startTime,finishTime,routeNumber,availability,price,seats,airConditioned,busRegNumber);
	                searchResults.add(route);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (rs != null) rs.close();
	                if (ps != null) ps.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	        return searchResults;
	    }
	

}
