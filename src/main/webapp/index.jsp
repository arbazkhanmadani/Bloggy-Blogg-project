<%@ page language="java" contentType="text/html; charset=UTF-8"
%>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href ="CSS/Style.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

.banner-background{
             clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }</style>
<%@include file ="Normal_navbar.jsp" %>
 
</head>
<body>
<!-- Navbar -->

<!-- banner -->
  <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog </h3>
                    <p>Welcome to technical blog, world of technology
                        A programming language is a formal language, which comprises a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.
                    </p>
                    <p>
                        Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. 
                    </p>
                    </div>
                    </div>
                    </div>
                    

		<%
		Connection con =ConnectionProvider.getConnection();
		%>
		
		
<!-- javascript -->
<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" ></script>
<script src="JavaScript/min.js" type ="text/javascript"></script>

</body>
</html>