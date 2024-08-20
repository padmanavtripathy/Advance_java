package bean;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OrderFromCart
 */
@WebServlet("/OrderFromCart")
public class OrderFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderFromCart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection con = ConnectionProvider.getCon();

		try {
			
			PreparedStatement cart = con.prepareStatement("SELECT * FROM ordered");
			ResultSet ls = cart.executeQuery();
			PreparedStatement ordered = con.prepareStatement("SELECT * FROM myorders");
			ResultSet rs = ordered.executeQuery();
			PreparedStatement ps = con.prepareStatement("UPDATE myorders SET price=?,quantity=? WHERE pid=?");
			PreparedStatement add = con.prepareStatement("INSERT INTO myorders values(?,?,?)");
			ArrayList<MyOrders> myorder=new ArrayList<MyOrders>();
			while(rs.next())
			{
				MyOrders m=new MyOrders();
				m.setPid(rs.getString(1));
				m.setPrice(rs.getFloat(2));
				m.setQuantity(rs.getInt(3));
				
				myorder.add(m);
			}
			while(ls.next())
			{
				int status=0;
				String order=ls.getString(2);
				for(MyOrders pid:myorder)
				{
					if((pid.getPid()).equals(order))
					{
						int newquantity=pid.getQuantity()+1;
						float newPrice=(pid.getPrice()/pid.getQuantity())*newquantity;
						ps.setFloat(1, newPrice);
						ps.setInt(2, newquantity);
						ps.setString(3, pid.getPid());
						status=1;
						ps.executeUpdate();
						break;
					}
				}
				if(status!=1)
				{
					GetProduct pro=new GetProduct();
					ArrayList<Productdetails> product=pro.ava();
					for(Productdetails pdetails:product)
					{
						if((pdetails.getId()).equals(order))
						{
							add.setString(1, order);
							add.setFloat(2,pdetails.getPrice());
							add.setInt(3, 1);
							add.executeUpdate();
							break;
						}
					}
					
				}
			}
			Clear cl=new Clear();
			cl.clear();
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("OrderPage.jsp");
			requestDispatcher.forward(request, response);
			

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
