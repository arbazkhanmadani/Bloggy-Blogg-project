<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register page</title>
<link  href ="style.css" rel ="stylesheet"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

.banner-background{
             clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }</style>
 
</head>
<body>
<%@include file="Normal_navbar.jsp" %>
<main class="bg-primary banner-background" style="padding-bottom:50px;">

<div class="container" >
<div class ="col-md-5 offset-md-4">
<div class="card">
	<div class="card-header bg-primary text-white text-center">
	<span class="fa fa-3x fa-user-circle" ></span>
	<br>
	Register here
	</div>
	
	<div class="card-body">
		<form id="reg-form" action="RegisterServlet" method="POST">
		<div class="form-group">
    <label for="User name">User Name</label>
    <input type="text" class="form-control" id="user_name"  placeholder="Enter  name"  name="user_name">
    </div>
  
 
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="user_email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="user_password">
  </div>
  
  <div class="form-group">
    <label for="gender">Select Gender</label>
    <br>
    <input type="radio"  id="gender" name="gender" value="male">Male
    <input type="radio"  id="gender" name= "gender" value="female">feMale
  </div>
  
  <div class="form-group">
  <textarea name="about" class="form-control" rows="4" placeholder ="Enter Something About your self"></textarea>
  </div>
  
   
  <div class="form-check">
    <input name ="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1"> agree terms and conditions</label>
  </div>
  
  <br>
  <div class="container text-center" id="loader" style="display:none">
  <span class="fa fa-refresh fa-spin fa-4x"></span>
  <h4>please wait...</h4>
  </div>
  <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
</form>
	</div>
	
	
</div>

</div>
</div>
</main>
<!--  javascript-->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" ></script>
<script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script>
$(document).ready(function () {
    console.log("loaded........")

    $('#reg-form').on('submit', function (event) {
        event.preventDefault();



        let form = new FormData(this);

        $("#submit-btn").hide();
        $("#loader").show();
        //send register servlet:
        $.ajax({
            url: "RegisterServlet",
            type: 'POST',
            data: form,
            success: function (data, textStatus, jqXHR) {
                console.log(data)

                $("#submit-btn").show();
                $("#loader").hide();

                if (data.trim() === 'Registration successfull')
                {

                    swal("Registered successfully..We are going to redirect to login page")
                            .then((value) => {
                                window.location = "login.jsp"
                            });
                } else
                {

                    swal(data);
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
            	console.log(jqXHR);
                $("#submit-btn").show();
                $("#loader").hide();
                swal("something went wrong..try again");

            },
            processData: false,
            contentType: false

        });



    });


});




	


</script>

</body>
</html>