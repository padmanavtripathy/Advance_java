<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@1,900&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@1,900&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
<style>
body {
	background-image: linear-gradient(to right, #f8f9e6 , #ebc55a);
}

* {
	margin: 0;
	padding: 0;
}



.body {
	height: 482px;
}

#body {
	width: 100%;
	height: 520px;
}

.choice {
	display: flex;
}

.MagicScroll {
	display: flex;
	justify-content: center;
}
.container4{
           
    		width: 89%;
            margin-top: 30px;
            box-shadow: 8px 14px 5px 12px #5b5e5f;
            z-index: -1;
            
        }
         .container4 img{
        	height: 689px;
        }
	.image1{
	position: absolute;
	text-align: center;
	position: absolute;
	text-align: center;
	position: absolute;
    text-align: center;
    margin: 89px;
    text-align: center;
    font-size: 77px;
    margin-left: 335px;
    color: #090926;
    }
	.carousel-inner{
	}
	#text1{
    font-size: 4rem;
    font-family: 'Merriweather', serif;
}
.products{
    font-family: 'Merriweather', serif;
    height: 100%;
    width: 100%;
    text-align: center;

}
.products h1{
font-size: 60px;
    color: #07074a;
    margin-top: 30px;
    text-shadow: 1px 5px 4px #ff0000;}
#iteams{
margin-top: 30px;
}
</style>
<link type="text/css" rel="stylesheet"
	href="magicscroll/magicscroll.css" />

</head>
<body>
	<jsp:include page="/header.jsp" />	
	<div class="MagicScroll" data-options="step: 0; speed: 1000;">
		<div class="container4">
        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
              <div class="image1">
              <h1 id="text1">Good Food for Good Moments</h1>
            	<h2 id="slogan">A hungry must not go to food the food will go to hungry.</h2>
     
              </div>
                <img src="image\pexels-anna-guerrero-1765005.jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="image\pexels-ekaterina-bolovtsova-5702786.jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="image\pexels-fauxels-3184183.jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="image\pexels-robin-stickel-70497.jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="image\pexels-roman-odintsov-12725399.jpg" class="d-block w-100" alt="...">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>		
	</div>
	</div>
	<div class="products">
		<h1>Order Your Foods</h1>
	</div>
	<div id="iteams">
		<% String type= null;
		type = (String) session.getAttribute("Type");
		if(type==null)
		{%>
		<jsp:include page="/avalableproducts.jsp" />
		
		<%} else{ %>
		<jsp:include page="/filterproduct.jsp" />
		<%} %>
	</div>
	<jsp:include page="/ourcooks.jsp" />
	<jsp:include page="/footer.jsp" />		
	
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</body>
</html>