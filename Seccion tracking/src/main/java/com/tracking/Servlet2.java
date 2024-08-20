package com.tracking;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Servlet2
 */
@WebServlet("/Servlet2")
public class Servlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	
	protected void printwriter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		Cookie[] cookies=request.getCookies();
		String myname = null;
		boolean f=false;
		if(cookies==null)
		{
			out.println("New user go to add new user");
			return ;
		}else
		{
			for(Cookie c:cookies)
			{
				String names=c.getName();
				if(names.equals("1stname"))
				{
					f=true;
					myname=c.getValue();
				}
			}
		}
		if(f)
		{
			out.println("Welcome Back To the webpage "+myname);
			out.println("Thank you");
		}
		else {
			out.println("New user go to add new user");
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		printwriter(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		printwriter(request,response);
	}

}
