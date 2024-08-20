package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Printcart {
	ArrayList<CartDetails> cart = new ArrayList<>();
	public ArrayList<CartDetails> printcart2() {
		System.out.println("inside printcart");
		Connection con = ConnectionProvider.getCon();
		System.out.println("inside printcart");
		
		System.out.println("inside printcart");
		try {
			PreparedStatement st1 = con.prepareStatement("SELECT * from ordered");
			ResultSet rs = st1.executeQuery();
			System.out.println("inside printcart");

			while (rs.next()) {
				CartDetails cd=new CartDetails();
				String pid=rs.getString(2);
				int oid=rs.getInt(3);
				cd.setPid(pid);
				cd.setOid(oid);
				cart.add(cd);
				System.out.println(rs.getString(2));
	
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cart;

	}
}
