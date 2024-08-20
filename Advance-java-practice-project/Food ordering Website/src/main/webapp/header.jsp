<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
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
}</style>
</head>
<body>
	<div class="manubar">

		<ul>

			<li id="iteams"><a href="index.jsp">Home</a></li>
			<li id="iteams"><a href="#">Pricing</a>
				<form action="<%=request.getContextPath()%>/Inrange" method="post">
					<div class="submenu">
						<ul>
							<li><h3>Select your type</h3> <select name="selecttype" id="type">
									<option value="all" selected>All</option>
									<option value="veg">veg</option>
									<option value="Nonveg">Nonveg</option>
							</select></li>
							<li><h3>Select your Price Range</h3> <select name="lowest"
								id="lowest">
								<option value="0" selected>0</option>
									<option value="100">100</option>
									<option value="200">200</option>
									<option value="300">300</option>
									<option value="400">400</option>
									<option value="500">500</option>
							</select> <select name="highest" id="highest">
									<option value="200">200</option>
									<option value="200">300</option>
									<option value="200">400</option>
									<option value="200">500</option>
									<option value="200">600</option>
									<option value="3000" selected>3000</option>
							</select></li>
							<li><input type="submit" value="Search"></li>
						</ul>
					</div>

				</form></li>

			<li id="iteams">
				<%
				String name;
				name = (String) session.getAttribute("Userid");
				%> <%
 if (name == null) {
 %> <a href="#">Login</a>
				<div class="submenu">
					<ul>
						<li><a href="Register.jsp">Customer</a></li>
						<li><a href="adminregister.jsp">Admin</a></li>
					</ul>
				</div>
			
			<%
			} else {%>
			<a href="<%=request.getContextPath()%>/LogoutPage">Logout</a>
			<%}
			%></li>
			<li id="iteams"><a href="OrderPage.jsp">Orders</a></li>
			<li id="iteams"><a id="ordered" href="Printorder.jsp"><label>
						<img id="account"
						src="https://img.icons8.com/bubbles/2x/food-cart.png" />
				</label> <label>Mycart</label></a></li>
				
			<li id="iteams"><a href="#"><label> <img
						id="account"
						src="https://img.icons8.com/ios-filled/2x/guest-male.png" /></label> <label>
						<%
						String name2;
						name2 = (String) session.getAttribute("Userid");
						%> <%
 if (name2 == null) {
 	out.println("Profile");
 } else {
 	out.println(name);
 }
 %>


				</label></a>
		</ul>
	</div>

</body>
</html>