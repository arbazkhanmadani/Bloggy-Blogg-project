<%@ page language="java" contentType="text/html; charset=UTF-8"
%>
<%@page isErrorPage="true" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Sorry Something went wrong...........</title>

<link  href ="style.css" rel ="stylesheet"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

.banner-background{
             clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }</style>
 
</head>
<body>
<h1></h1>
<div class="container text-center">
<img src ="images/error.png" class="image-fluid">
<h3 class="display-3">Sorry! something went wrong</h3>
<%=exception%>
<a  href ="index.jsp" class="btn bg-primary  btn-lg text-white mt-3">Home</a>


</div>

</body>
</html>