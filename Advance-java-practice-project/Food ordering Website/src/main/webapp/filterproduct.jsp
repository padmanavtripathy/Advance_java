<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

.container {
	background-color: #f9f9f9;
	border: 1px solid black;
	height: 264px;
    width: 726px;
	display: grid;
	grid-template-columns: 3rem 1fr 2fr 1fr 3rem;
	justify-content: center;
	border-radius: 57px;
	margin : 20px;
	 box-shadow: 10px 10px #b2c8cf;
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
   height: 124px;
    width: 180px;
    margin: 17px;}
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
	int status=0;
	String type = (String) session.getAttribute("Type");
	float highest=Float.parseFloat((String) session.getAttribute("highest")); 
	float lowest=Float.parseFloat((String) session.getAttribute("lowest")); 
	System.out.println(highest);
	System.out.println(lowest);
	
	for (Productdetails products : p) {
		String pid=products.getId();
		String producttype=products.getType();
		float price=products.getPrice();
		if(type.equals(producttype)&&(price>=lowest)&&(price<=highest)){
			status++;
	%>
	
	<div class="iteams">
		<div class="container">
		<img alt="photo" src="<%=products.getImagename()%>">
			<div class="change2">
				<p class="zero"><%=products.getId()%></p>
				<div class="name">
					
					<h2><%=products.getName()%></h2>
					
				</div>
				<div class="description">
					<p id="description"><%=products.getDescripation()%></p>
				</div>
				<div class="last">
					<div class="price">
					
						<h2><%=products.getPrice()%></h2>
						
					</div>
					<div class="type">
						<h2><%String type1=products.getType();
						if(type1.equals("veg")){
						%>
						<h2 style="color:green">Veg</h2>
						<%}else{ %>
						<h2 style="color:red">NonVeg</h2>
						<%} %></h2>
	
					</div>
				</div>
			</div>
			<%request.setAttribute("pid",products.getId().toString());%>
			<div class="change3">
				<div class="button">
					<button><a id="ordered" href="takeorder.jsp?id=<%=pid%>"><div>BuyNow</div></a></button> 
				</div>
			</div>
		</div>
	</div>
	

		<%
		}
		}
		
		%>
		<%if(status==0){ %>
		<h1>No Product is Present of given catagory</h1>
		<%} %>

</div>
	
</body>
</html>