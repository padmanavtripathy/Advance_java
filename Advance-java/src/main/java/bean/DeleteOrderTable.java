package bean;

import java.sql.Connection;

public class DeleteOrderTable {
	public void deleteorders() {
		try {
			Connection con = ConnectionProvider.getCon();
			
			java.sql.Statement stmt = con.createStatement();
			  stmt.executeUpdate("TRUNCATE myorders");			 
			  System.out.println("Successfully truncated test_table");
			}
			catch(Exception e)
			{
				System.out.println("Not truncted");
			}
		
	}
}
