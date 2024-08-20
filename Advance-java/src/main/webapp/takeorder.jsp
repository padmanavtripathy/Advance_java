<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	body{
	justify-content:center;
	}
	.sucessful{
		  box-shadow: 0 4px 8px 0 rgb(0 0 0 / 20%);
    transition: 0.3s;
    width: 604px;
    height: 71px;
    display: flex;
    margin: 35px;
    text-align: center;
    justify-content: center;
    color: #000072;
    margin-left: 600px;
           
        }

        /* On mouse-over, add a deeper shadow */
        .sucessful:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }
        .manubar {
	background-color: #146222;;
	text-align: center;
	z-index: 5;
}

.manubar ul {
	display: inline-flex;
	list-style: none;
	color: black;
}

.manubar ul li {
	width: 120px;
	margin: 15px;
	padding: 15px;
	font-size: 20px;
	font-weight: 500;
}

.manubar ul li a {
	text-decoration: none;
	color: aliceblue;
}

.active, .manubar ul li:hover {
	background: #2b1e16;
	border-radius: 5px;
}

.submenu {
	display: none;
}

.manubar ul li:hover .submenu {
	display: block;
	position: absolute;
	background: #2b1e16;
	margin-top: 15px;
	margin-left: -15px;
}

.manubar ul li:hover .submenu ul {
	display: block;
	margin: 10px;
}

.manubar ul li:hover .submenu ul li {
	width: 150px;
	padding: 10px;
	border-bottom: 1px dotted #fff;
	background: transparent;
	border-radius: 2px;
	text-align: center;
}

.manubar ul li:hover .submenu ul li:last-child {
	border-bottom: none;
}

.manubar ul li:hover .submenu ul li:hover {
	color: #b2ff00;
}

#account {
	height: 30px;
}
		
</style>
</head>
<body>
<%@page import="bean.*"%>
	<%@page import="java.util.*"%>
	<jsp:include page="/header.jsp" />	
	<div>
	<%
	String name3;
	name3 = (String) session.getAttribute("Userid");%>
	<% if(name3==null)
	{%>
		<jsp:forward page="Register.jsp" /> 
	<% }else {
		String id=request.getParameter("id");
		String myname;
		myname=(String)session.getAttribute("Userid");
		Orderdetails od=new Orderdetails();
		od.setUserid(myname);
		od.setPid(id);
		Ordered odr= new Ordered();
		odr.placeorder(od); 
	 
	}%>
		<jsp:forward page="/index.jsp" />
	</div>
	<jsp:include page="/footer.jsp" />	
</body>
</html>