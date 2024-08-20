<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="bean.Registeradmin"%>
	<%@page import="bean.User"%>
	 <%
	 User u=new User();
	 u.setFname(request.getParameter("Fname"));
	 u.setMname(request.getParameter("Mname"));
	 u.setLname(request.getParameter("Lname"));
	 u.setEmail(request.getParameter("Email"));
	 u.setPhone(request.getParameter("Phone"));
	 u.setGender(request.getParameter("Gender"));
	 u.setUserid(request.getParameter("Userid"));
	 u.setPassword(request.getParameter("Password"));
	  %>
	  <% %>
	<%
	Registeradmin d=new Registeradmin();
	int status=d.register(u);
	if (status > 0)
		out.print("done");
	
	else
		out.print("error");
	%>