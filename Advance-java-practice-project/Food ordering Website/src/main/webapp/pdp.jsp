<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
        .my_img {
            vertical-align: middle;
            top: 0;
            bottom: 0;
            margin: auto;
            height: 100%;
            width: 400px;
        }

        .piclist li {
            display: inline-block;
            width: 90px;
            height: 114px;
            border: 1px solid #eee;
        }

        .piclist li img {
            width: 97%;
            height: auto;
        }

        /* custom style */
        .picZoomer-pic-wp,
        .picZoomer-zoom-wp {
            border: 1px solid #eee;
        }



        .section-bg {
            background-color: #fff1e0;
        }

        section {
            padding: 60px 0;
        }

        .row-sm .col-md-6 {
            padding-left: 5px;
            padding-right: 5px;
        }

        /*===pic-Zoom===*/
        ._boxzoom .zoom-thumb {
            width: 90px;
            display: inline-block;
            vertical-align: top;
            margin-top: 0px;
        }

        ._boxzoom .zoom-thumb ul.piclist {
            padding-left: 0px;
            top: 0px;
        }

        ._boxzoom ._product-images {
            width: 80%;
            display: inline-block;
        }

        ._boxzoom ._product-images .picZoomer {
            width: 100%;
        }

        ._boxzoom ._product-images .picZoomer .picZoomer-pic-wp img {
            left: 0px;
        }

        ._boxzoom ._product-images .picZoomer img.my_img {
            width: 100%;
        }

        .piclist li img {
            height: 100px;
            object-fit: cover;
        }

        /*======products-details=====*/
        ._product-detail-content {
            background: #fff;
            padding: 15px;
            border: 1px solid lightgray;
        }

        ._product-detail-content p._p-name {
            color: black;
            font-size: 20px;
            border-bottom: 1px solid lightgray;
            padding-bottom: 12px;
        }

        .p-list span {
            margin-right: 15px;
        }

        .p-list span.price {
            font-size: 25px;
            color: #318234;
        }

        ._p-qty>span {
            color: black;
            margin-right: 15px;
            font-weight: 500;
        }

        ._p-qty .value-button {
            display: inline-flex;
            border: 0px solid #ddd;
            margin: 0px;
            width: 30px;
            height: 35px;
            justify-content: center;
            align-items: center;
            background: #fd7f34;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            color: #fff;
        }

        ._p-qty .value-button {
            border: 0px solid #fe0000;
            height: 35px;
            font-size: 20px;
            font-weight: bold;
        }

        ._p-qty input#number {
            text-align: center;
            border: none;
            border-top: 1px solid #fe0000;
            border-bottom: 1px solid #fe0000;
            margin: 0px;
            width: 50px;
            height: 35px;
            font-size: 14px;
            box-sizing: border-box;
        }

        ._p-add-cart {
            margin-left: 0px;
            margin-bottom: 15px;
        }

        .p-list {
            margin-bottom: 10px;
        }

        ._p-features>span {
            display: block;
            font-size: 16px;
            color: #000;
            font-weight: 500;
        }

        ._p-add-cart .buy-btn {
            background-color: #fd7f34;
            color: #fff;
        }

        ._p-add-cart .btn {
            text-transform: capitalize;
            padding: 6px 20px;
            /* width: 200px; */
            border-radius: 52px;
        }

        ._p-add-cart .btn {
            margin: 0px 8px;
        }
        .row_row-sm{
            display: flex;
        }
        .col-md-6{
        width:100%;
        }
    </style>
</head>
<body>
	<%@page import="bean.*"%>
	<%@page import="java.util.*"%>
	<jsp:include page="/header.jsp" />	
	<div>
	<% 
		String id=request.getParameter("id");
		Description productdesc=new Description();
		Productdetails p=productdesc.description(id);
	%>

	    <section id="services" class="services section-bg">
        <form action="Putorder" method="post">
        <input type="hidden" id="pid" name="pid" value="<%=p.getId()%>">
        <input type="hidden" id="Price" name="Price" value="<%=p.getPrice()%>">
        <div class="container-fluid">
            
            <div class="row_row-sm">
                <div class="picZoomer">
                    <img class="my_img" src=<%=p.getImagename()%> alt="">
                </div>
                <div class="col-md-6">
                    <div class="_product-detail-content">
                        <p class="_p-name"><%=p.getName() %> </p>
                        <div class="_p-price-box">
                            <div class="p-list">
                                <span> M.R.P. : <i class="fa fa-inr"></i> <del><%=p.getPrice()+300 %></del> </span>
                                <span class="price"><%=p.getPrice() %> </span>
                            </div>
                            <div class="_p-add-cart">
                                <div class="_p-qty">
                                    <span>Add Quantity</span>
                                    <input type="number" name="qty" id="number" value="1" onchange="value1()"/>
                                </div>
                            </div>
                            <div class="_p-features">
                                <span> Description About this product:- </span>
                               <%=p.getDescripation() %>
                            </div>
                            <ul class="spe_ul"></ul>
                            <div class="_p-qty-and-cart">
                                <div class="_p-add-cart">
                                    <a href=""><button class="btn-theme btn buy-btn" id="Button" tabindex="0">
                                        <i class="fa fa-shopping-cart"></i> Buy Now
                                    </button></a> 
                                    <a id="diseble" href="takeorder.jsp?id=<%=p.getId()%>">                                  
                                        <i class="fa fa-shopping-cart"></i> Add to Cart  </a>               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       </form>
    </section>
	 
	</div>
	
</body>
</html>