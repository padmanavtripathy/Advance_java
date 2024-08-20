package bean;

import java.sql.*;

public class ConnectionProvider {
	private static Connection con = null;
	static {
		try {
			String DRIVER = "com.mysql.cj.jdbc.Driver";
			String CONNECTION_URL = "jdbc:mysql://localhost:3306/registration";
			String USERNAME = "root";
			String PASSWORD = "Pintu@123";
//System.out.println("you are in connection provider class");
			Class.forName("com.mysql.cj.jdbc.Driver");
//System.out.println("you are in connection provider class");
			con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
			System.out.println(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection getCon() {
		return con;
	}
}