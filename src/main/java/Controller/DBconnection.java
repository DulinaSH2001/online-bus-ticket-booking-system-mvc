package Controller;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {
	private static String url = "jdbc:mysql://localhost:3306/bus_ticket";
	private static String user = "root";
	private static String pass = "dulina2001";
	private static Connection conn;
	
	public static Connection getconnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			 conn = DriverManager.getConnection(url, user, pass);
			
		}
		catch (Exception e) {
			System.out.println("database connection is poor");
			e.printStackTrace();
			
			
		}
		return conn;
	}



}



