package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GetOrders {
	public ArrayList<MyOrders> getProduct()
	{
		
		ArrayList<MyOrders> myorder=new ArrayList<>();
		Connection con = ConnectionProvider.getCon();
		PreparedStatement st1;
		try {
			st1 = con.prepareStatement("SELECT * from myorders");
			ResultSet rs = st1.executeQuery();
			while(rs.next())
			{
				MyOrders m=new MyOrders();
				System.out.println(rs.getString(1));
				m.setPid(rs.getString(1));
				m.setPrice(rs.getFloat(2));
				m.setQuantity(rs.getInt(3));
				myorder.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return myorder;
	}
}
