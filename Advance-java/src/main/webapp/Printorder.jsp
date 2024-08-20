<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

.main{
 			display: flex;
            justify-content: center;display: flex;
    flex-wrap: wrap
           
        }
	       .card {
            /* Add shadows to create the "card" effect */
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            width: 900px;
            height: 200px;
            display: flex;
            margin: 35px;
           
        }

        /* On mouse-over, add a deeper shadow */
        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }

        /* Add some padding inside the card container */
        .container {
            padding: 2px 16px;
        }

        .image {
           height: 200px;
    		width: 261px;
        }
.sucessful ,.sucessful1{
		  box-shadow: 0 4px 8px 0 rgb(0 0 0 / 20%);
    transition: 0.3s;
    width: 604px;
    height: 71px;
    display: flex;
    margin: 35px;
    text-align: center;
    justify-content: center;
    color: #000072;
    margin-left: 585px;
           
        }

        /* On mouse-over, add a deeper shadow */
        .sucessful:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }
        .sucessful1{
        margin:0px;
        width:1200px;
        
        }
        .sucessful1 button{
            width: 500px;
    margin-left: 42px;
    background-color: #ddaf94;
        }
        .sucessful1 h1{
            margin-left: 30px;
        }
        .image img{
       		width: 100%;
   		 height: 100%;
        }
</style>
</head>
<body>
	<%@page import="bean.*"%>
	<%@page import="java.util.*"%>
	<%
	String Userid = (String) session.getAttribute("Userid");
	Printcart or = new Printcart();
	ArrayList<CartDetails> cart = or.printcart2();
	%>
	<jsp:include page="/header.jsp" />
	<%if(cart.isEmpty()==true){ %>
	<div class="sucessful">
	<h1>Cart Is Empty....!!</h1>
	</div>
	<%}else{ %>
	 <div id="main" class="main">
	<%int total=0;
	int noofiteams=0;
			for (CartDetails order : cart) {
			%>
		<%
		Selectproduct sp = new Selectproduct();
		Productdetails pd = sp.getproduct(order.getPid());
		%>
		  <div class="card">
            <div class="image">
                <img src="<%=pd.getImagename()%>" alt="Avatar" style="width:100%">
            </div>
            <div class="container">
                <h4><b><%=pd.getName() %></b></h4>
                <p><%=pd.getDescripation() %></p>
                <p>
                <h4><b><%=pd.getType() %></b></h4>
                <h4><b><%=pd.getPrice()%></b></h4>
                </p>
            </div>
            <div class="deletorder">
            <button><a id="ordered" href="deleteorder.jsp?oid=<%=order.getOid()%>"><div>Delete</div></a></button> 
            </div>
          </div>
<%noofiteams++;
total+=pd.getPrice();
		}
		%>
		<div id ="values" class="sucessful1">
	<h1>No of iteams :<%=noofiteams %></h1>
	<h1>Total Price :<%=total %></h1>
	<a href="<%=request.getContextPath()%>/OrderFromCart"><button onclick="myfun()"><h1>Place order</h1></button></a>
	</div>
	</div>
	<%} %>
</body>
</html>