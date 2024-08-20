package bean;

import java.sql.Connection;

import com.mysql.cj.xdevapi.Statement;

public class Clear {
	public void clear()
	{
		try {
		Connection con = ConnectionProvider.getCon();
		
		java.sql.Statement stmt = con.createStatement();
		 
		 
		 
		  stmt.executeUpdate("TRUNCATE ordered");
		 
		 
		  System.out.println("Successfully truncated test_table");
		}
		catch(Exception e)
		{
			System.out.println("Not truncted");
		}
	}
}
