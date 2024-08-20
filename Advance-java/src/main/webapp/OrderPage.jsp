<%@page import="bean.GetProduct"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
        #customers {
          font-family: Arial, Helvetica, sans-serif;
          border-collapse: collapse;
          width: 100%;
        }
        
        #customers td, #customers th {
          border: 1px solid #ddd;
          padding: 8px;
        }
        
        #customers tr:nth-child(even){background-color: #f2f2f2;}
        
        #customers tr:hover {background-color: #ddd;}
        
        #customers th {
          padding-top: 12px;
          padding-bottom: 12px;
          text-align: left;
          background-color: #04AA6D;
          color: white;
        }
        #noorder{
       	text-align: center;
       	height: 600px;
        }
        #status{
        	margin:20px;
        	text-align: center;
        }
        table{
        width:100%;
        margin-bottom: 200px;
        }
        
        </style>
</head>
<body>
<%@page import="bean.*"%>
	<%@page import="java.util.*"%>
	<jsp:include page="/header.jsp" />
	<div class="body">
	<%GetProduct pro=new GetProduct();
	ArrayList<Productdetails> product=pro.ava();
	GetOrders order=new GetOrders();
	ArrayList<MyOrders> myorder=order.getProduct();
	if(myorder.isEmpty())
	{%>
	<div class="body"></div>
	<h1 id="noorder">No Orders Avalable</h1>
	<%}else{ %>

	<h1 id="status">Order Status</h1>
        
        <table id="customers">
          <tr>
            <th>Product</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total </th>
            <th>Status</th>
          </tr>
	<% float price=0;
	for(MyOrders m:myorder)
	{
		for(Productdetails p:product)
		{
			
			if(p.getId().equals(m.getPid()))
			{price+=m.getPrice();
			%>
			<tr>
            	<td><%=p.getName() %></td>
            	<td><%=m.getQuantity() %></td>
            	<td><%=m.getPrice()/m.getQuantity() %>
            	<td><%=m.getPrice() %></td>
            	<td>Order placed</td>
          	</tr>
				
			<%}
		}
	}
	%>
	<tr>
            <td colspan="3">Net Total </td>
            <td colspan="2"><%=price %></td>
          </tr>
        </table>
        <%} %>	
       </div>
       
	<jsp:include page="/footer.jsp" />
		
</body>
</html>