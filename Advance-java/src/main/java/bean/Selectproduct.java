package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Selectproduct {
	public Productdetails getproduct(String pid)
	{
		Productdetails p=new Productdetails();
		System.out.println("inside class select from db1");
		Connection con = ConnectionProvider.getCon();
		PreparedStatement st;
		try {
			System.out.println("inside class select from db2");
			st = con.prepareStatement("SELECT * FROM products where id=?");
			System.out.println("inside class select from db3");
			st.setString(1, pid);
			System.out.println("inside class select from db4");
			ResultSet rs = st.executeQuery();
			System.out.println("inside class select from db5");
			while(rs.next())
			{
			p.setId(rs.getString(1));
			System.out.println("hii1");
			p.setName(rs.getString(2));
			System.out.println("hii2");
			p.setDescripation(rs.getString(3));
			System.out.println("hii3");
			p.setUserid(rs.getString(5));
			System.out.println("hii4");
			p.setType(rs.getString(6));
			System.out.println("hii5");
			p.setImagename(rs.getString(7));
			System.out.println("hii6");
			p.setPrice(rs.getFloat(4));
			System.out.println("hii7");
			System.out.println(rs.getString(1));
			System.out.println(rs.getString(3));
			System.out.println("inside class select from db6");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return p;
	}
}
