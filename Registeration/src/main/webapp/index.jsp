<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>           
<style type="text/css">
*{
margin:0;
padding:0;
box-sizing:border-box;
}
body{
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: space-evenly;
    flex-wrap: wrap;
    flex-direction: column-reverse;
    align-content: space-around;
	background-image: url(https://tse3.mm.bing.net/th?id=OIP.DNqBP2r2VKbOWG55BCIJCgHaEK&pid=Api&P=0);
	background-repeat: no-repeat;
    background-size: cover
}
.card{
	width: 400px;
    height: min-content;
    padding: 20px;
    border-radius: 20px;
    background: white;
  box-shadow: 0 0 50px 15px #48abe0;
}
.card h3{
	    font-size: 36px;
   		 margin-bottom: 35px;
   		 text-align:center;
   		 color:#15154a;
   		 font-weight: 700;
}
.card form{
font-size: 20px;
font-weight: 500;
}
.form{
margin-bottom:12px;
}
h5{
color:#15154a;
text-align: center;

}

</style>
</head>
<body>
	<div class="container"></div>
	 <div class="row">
      <div class="col">
      	<div class="card">
      		<div class="card-content">
      			<h3>Register here !!</h3>
      			<h5 id="msg"></h5>
      			<div class="formgroup">
      				<form action="servlet1" method="post" name = "myForm" id="myform" onsubmit = "validate();">
      					<div class="form">
      						<lebel class="form-lebel" for="name">User Name</lebel>
      						<input class="form-control" type="name" name="myname"/>
      					</div>						<div class="form">
      						<lebel class="form-lebel" for="email">Email</lebel>
      						<input class="form-control" type="email" name="myemail"/>
      					</div>
      					<div class="form">
							<lebel class="form-lebel" for="email"> Password</lebel>
      						<input class="form-control" type="text" name="mypwd"/>
      					</div>
      					
      					<input class="btn btn-success w-100" type="submit" value="SignIn">
      					
      				</form>
      			</div>
      		</div>
      	</div>
      </div>
 
	</div>
	<script
  src="https://code.jquery.com/jquery-3.6.3.js"
  integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
  crossorigin="anonymous"></script>
  <script>
  
  $(document).ready(function(){
	  console.log("page is ready......")
	  
	  $("#myform").on('submit',function(event){
		  event.preventDefault();
		  
		  var f=$(this).serialize();
		  console.log(f);
		  $.ajax({
			  url:"servlet1",
			  data: f,
			  type : 'post',
			  success: function(data,textStatus,jqXHR){
				  console.log(data);
				  console.log("Sucess......");
				  if(data.trim()==='done')
					  {
					  $('#msg').html("Successfully Registred..!!");
					  }
				  else
					  {
					  $('#msg').html("You Have Already Registread..!!");
					  }
			  },
			  error: function(jqXHR,textStatus,errorThrown){
				  console.log(data);
				  console.log("Error......");
				  $('#msg').html("You Have Already Registread..");
			  }
		  })
	  })
  })</script>
</body>
</html>