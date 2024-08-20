package bean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.*;
public class Ordered {
	public void placeorder(Orderdetails od)
	{
		System.out.println("we are in placeorder");
		String userid=od.getUserid();
		String pid=od.getPid();
		Connection con = ConnectionProvider.getCon();
		try {
			PreparedStatement ps = con.prepareStatement("insert into ordered (userid,productid) values(?,?)");
			ps.setString(1, userid);
			ps.setString(2,pid);
			
		
			int status = ps.executeUpdate();
		} catch (SQLException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
}
