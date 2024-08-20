package bean;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Putorder
 */
@WebServlet("/Putorder")
public class Putorder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Putorder() {
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
		String name3;
		try {
		HttpSession session=request.getSession();
		name3 = (String) session.getAttribute("Userid");
		if (name3.equals(null)) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("Register.jsp");
			requestDispatcher.forward(request, response);
		} else {
			String pid = request.getParameter("pid");
			float Price = Float.parseFloat(request.getParameter("Price"));
			int qty = Integer.parseInt(request.getParameter("qty"));
			Connection con = ConnectionProvider.getCon();
			System.out.println(pid);
			System.out.println(Price);
			System.out.println(qty);
			if (qty >= 1) {
				try {
					PreparedStatement ps = con.prepareStatement("insert into myorders values(?,?,?)");
					ps.setString(1, pid);
					ps.setFloat(2, qty * Price);
					ps.setInt(3, qty);
					int status = ps.executeUpdate();
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("OrderPage.jsp");
					requestDispatcher.forward(request, response);
				} catch (SQLException e) {

					try {
						int status = 0;
						int quantity = 0;
						PreparedStatement pk = con.prepareStatement("SELECT * FROM myorders");
						ResultSet ls = pk.executeQuery();
						while (ls.next()) {

							System.out.println(ls.getString(1));

							if (ls.getString(1).equals(pid)) {
								quantity = ls.getInt(3);
								status = 1;
								break;
							}

						}
						if (status == 1) {
							PreparedStatement ps = con
									.prepareStatement("UPDATE myorders SET price=?,quantity=? WHERE pid=?");
							ps.setFloat(1, (quantity + qty) * Price);
							ps.setInt(2, quantity + qty);
							ps.setString(3, pid);
							ps.executeUpdate();
							RequestDispatcher requestDispatcher = request.getRequestDispatcher("OrderPage.jsp");
							requestDispatcher.forward(request, response);
						}
					} catch (SQLException e1) {

						e1.printStackTrace();
					}

				}

			} else {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
				requestDispatcher.forward(request, response);
			}
		}
		}catch(Exception e)
		{
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("Register.jsp");
			requestDispatcher.forward(request, response);
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
