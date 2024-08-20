package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class registeradmin
 */
@WebServlet("/registeradmin")
public class Registeradmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static int register(User u) {
		int status = 0;
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("insert into sellers (Fname,Mname,Lname,Email,Phone,Gender,Userid,Password) values(?,?,?,?,?,?,?,?)");
			PreparedStatement pk = con.prepareStatement("SELECT Userid FROM registred_user");
			ResultSet ls=pk.executeQuery();
			boolean status1=false;
			while(ls.next())
			{
				
				System.out.println(ls.getString(1));
				
				
				if(ls.getString(1).equals(u.getUserid()))
				{
					status1=true;
				}
					
			}
			if(status1 == false)
			{
				ps.setString(1, u.getFname());
				ps.setString(2, u.getMname());
				ps.setString(3, u.getLname());
				ps.setString(4, u.getEmail());
				ps.setString(5, u.getPhone());
				ps.setString(6, u.getGender());
				ps.setString(7, u.getUserid());
				ps.setString(8, u.getPassword());
			
				status = ps.executeUpdate();
			}
			else {
				status = 0;
			}
			
		} catch (Exception e) {
			System.out.println("Exception ocured ........." + e);
		}

		return status;
	}
}
