<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@page import="bean.*"%>
	<%@page import="java.util.*"%>
	<%String id=request.getParameter("oid");
	String myname; 
	System.out.println(id);
	DeleteOrder delete=new DeleteOrder();
	delete.deleteOrder(id);
	%>
	<jsp:forward page="Printorder.jsp" />
</body>
</html>