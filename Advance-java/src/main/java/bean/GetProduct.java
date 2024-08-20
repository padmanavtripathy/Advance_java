package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GetProduct {
	public ArrayList<Productdetails> ava() {
		Connection con = ConnectionProvider.getCon();
		PreparedStatement st;
		ArrayList<Productdetails> products = new ArrayList<>();
		try {
			
			st = con.prepareStatement("SELECT * FROM products");
			ResultSet rs = st.executeQuery();
			

			while (rs.next()) {
				Productdetails p = new Productdetails();
				p.setId(rs.getString(1));
				p.setName(rs.getString(2));
				p.setDescripation(rs.getString(3));
				p.setUserid(rs.getString(5));
				p.setType(rs.getString(6));
				p.setImagename(rs.getString(7));
				p.setPrice(rs.getFloat(4));
				products.add(p);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;

	}
}
