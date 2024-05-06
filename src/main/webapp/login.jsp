<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.tech.blog.entities.Message"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<link  href ="style.css" rel ="stylesheet"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

.banner-background{
             clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }</style>
         
</head>

<body>
<!--  navbar -->
<main class="d-flex align-items-center  bg-primary banner-background " style ="height:80vh">
<div class="container">
<div class="row">
<div class ="col-md-4 offset-md-4">
<div class ="card">
<!--  card header -->
<div class="card-header bg-primary text-white text-center">
<span class ="fa fa-user-plus fa-3x "></span>
<br>
<p>Login here</p>
</div>
</div>
<!--  Card body -->
<!--  alert message -->
<!--  ye har bar nhi dikhana h particular condtion pe lagana h -->
 <%
	Message m = (Message)session.getAttribute("msg");
	if(m!=null){ %>
		<div class= "<%=m.getCssClass()%> text-center" role="alert">
		  invalid user found <a href="login.jsp" class="alert-link"></a> 
		</div>
	<% 
		session.removeAttribute("msg");
	}
	%>



<div class="card-body">
<form action="loginServlet" method="POST">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email"  required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" required class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
  </div>
 <!--   <div class="form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div> -->
 <div class="container text-center">
 
  <button type="submit" class="btn bg-primary" >Submit</button>
  </div>
</form>

</div>
</div>
</div>
</div>
</main>

<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" ></script>
<script src="JavaScript/min.js" type="text/javascript"></script>

</body>
</html>