package com.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void processrequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	{
    		response.setContentType("text/html");
    		PrintWriter out=response.getWriter();
    		
    		String name=request.getParameter("myname");
    		String email=request.getParameter("myemail");
    		String password=request.getParameter("mypwd");
    		
    		try {
    			Class.forName("com.mysql.jdbc.Driver");
    			

                //create the connection
                String url="jdbc:mysql://localhost:3306/login";
                
                String username="root";
                String password1="Pintu@123";
                java.sql.Connection con=DriverManager.getConnection(url,username,password1);
                String q="insert into user(username,Gmail,password) values(?,?,?)";
                PreparedStatement pstmt =  con.prepareStatement(q);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, password);
                
                pstmt.executeUpdate();
                out.println("done");
                
    		}
    		catch(Exception e)
    		{
    			e.printStackTrace();
    			out.println("error");
    		}
    	}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processrequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processrequest(request, response);
	}

}
