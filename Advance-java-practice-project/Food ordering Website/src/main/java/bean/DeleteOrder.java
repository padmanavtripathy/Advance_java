package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeleteOrder {
	public void deleteOrder(String oid)
	{
		Connection con = ConnectionProvider.getCon();
		try {
			 
			PreparedStatement stmt=con.prepareStatement("delete from ordered where oid=?");  
			stmt.setString(1, oid); 
			  
			int i=stmt.executeUpdate();  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
	}
}
