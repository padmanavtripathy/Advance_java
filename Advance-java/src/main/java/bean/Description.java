package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Description {
	public Productdetails description(String id) {
		Productdetails p = new Productdetails();
		Connection con = ConnectionProvider.getCon();
		PreparedStatement st;
		try {
			st = con.prepareStatement("SELECT * FROM products where id=?");
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				p.setId(rs.getString(1));
				p.setName(rs.getString(2));
				p.setDescripation(rs.getString(3));
				p.setUserid(rs.getString(5));
				p.setType(rs.getString(6));
				p.setImagename(rs.getString(7));
				p.setPrice(rs.getFloat(4));
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return p;			
	}

}
