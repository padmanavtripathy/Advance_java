<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

.noncontainer {
	background-color: #f9f9f9;
    border: 0px solid #c11111;
    height: 143px;
    width: 600px;
    display: grid;
    grid-template-columns: 0rem 1fr 2fr 0rem;
    justify-content: center;
    border-radius: 15px;
    margin: 17px;
    box-shadow: 10px 10px #6da9b796;
}
.change1 {
	grid-column: 2/3;
	height: 170px;
	border-radius: 20px;
	margin: 15px;
	margin-right: 20px;
}

.change2 {
	grid-column: 3/4;
}

.change3 {
	grid-column: 4/5;
	display: flex;
	justify-content: center;
	align-items: center;
}

.button {
	justify-content: center;
}

.last {
	display: flex;
}

.last .type {
	margin-left: 100px
}

.iteams {
	display: flex;
	justify-content: center;
	align-items: center;
	justify-content: center
}

button {
	background-color: #f73d05;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 14px;
}

.photo {
	height: 80px;
	width: 267px;
}
.zero{
	visibility: hidden;
}
.alliteams{
	display: flex;
    flex-wrap: wrap;
    justify-content: center;
   }
  .iteams img{
  height: 143px;
    width: 184px;}
    .noncontainer:hover {
	transform: scale(1.2);
}
</style>
</head>
<body>
	<%@page import="bean.*"%>
	<%@page import="java.util.*"%>
	<% ArrayList<String> ids=new ArrayList();%>
	<div class="alliteams">
	<%
	GetProduct pro=new GetProduct();
	ArrayList<Productdetails> p = pro.ava();
	String name;
	name = (String) session.getAttribute("filteret");
	for (Productdetails products : p) {
		String img=products.getImagename();
		String pid=products.getId();
	%>
	<a id="ordered" href="pdp.jsp?id=<%=pid%>">
	<div class="iteams">	
		<div class="noncontainer">
		<img alt="photo" src=<%=products.getImagename()%>>
			<div class="change2">
				<div class="name">
					
					<h2><%=products.getName()%></h2>
					
				</div>
				<div class="last">
					<div class="price">
					
						<h2><%=products.getPrice()%></h2>
						
					</div>
					<div class="type">
						<h2><%String type=products.getType();
						if(type.equals("veg")){
						%>
						<h2 style="color:green">Veg</h2>
						<%}else{ %>
						<h2 style="color:red">NonVeg</h2>
						<%} %></h2>
					</div>
				</div>
			</div>
			<%request.setAttribute("pid",products.getId().toString());%>

		</div>
	</div>
	</a>
	

		<%
		}
		
		%>

</div>

</body>
</html>