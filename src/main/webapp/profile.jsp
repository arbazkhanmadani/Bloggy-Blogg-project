<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="com.tech.blog.entities.User" %>
    
    <%@page errorPage="errorPage.jsp"%>
    
    <%
    User user = (User)session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile page</title>
<!-- css -->
<link  href ="style.css" rel ="stylesheet"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background{
             clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }


</style>


</head>
<body>

<!-- navbar start -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span>   Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"> <span class="	fa fa-bell-o"></span> LearnCode with Durgesh <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="	fa fa-check-square-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#"> <span class="	fa fa-address-card-o"></span> Contact</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal" > <span class="	fa fa-asterisk"></span> Do Post</a>
                    </li>
                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle "> <%= user.getName()%> </span> </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="logoutServlet" > <span class="fa fa-user-plus "></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

<!-- navbar end -->

<!-- start of profile model -->
<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">
  			<div class="container text-center">
  			<!-- profile lagane ke liye -->
  			<img src="images/<%= user.getProfile()%>" class="img=fluid" style="border-radius:50%; max-width:200px;"/>	
        <h5 class="modal-title mt-1" id="exampleModalLabel"><%= user.getName()%> </h5>
        <!-- details -->
        <!--  int he form of table -->
        <!--  for creating profile better use jquery on this
         so first  we conatin the rable on the div -->
        <div id="profile-detail">
        <table class="table">
  <thead>
   
  </thead>
  <tbody>
    <tr>
      <th scope="row">ID : </th>
      <td><%=user.getId() %></td>
    </tr>
    <tr>
      <th scope="row">Email : </th>
      <td><%= user.getEmail() %></td>
      
    </tr>
    <tr>
      <th scope="row">Gender : </th>
      <td><%=user.getGender() %></td>
    </tr>
    
     <tr>
      <th scope="row">Status : </th>
      <td><%=user.getAbout() %></td>
    </tr>
    
     <tr>
      <th scope="row">Registered on: </th>
      <td><%=user.getDateTime().toString() %></td>
    </tr>
    
  </tbody>
</table>
</div>

<!--  profile edit -->
<div id="profile-edit" style="display:none;">
<h3 class="mt-2"> Please Edit Carefully</h3>

<form action="EditServlet" method="Post" enctype="multipart/form-data">

<table>
<tr>
<th>ID: </th>
<!-- beacuse ID is not Editable -->
<td
<%= user.getId() %> ></td>
</tr>

<tr>
<th>Name: </th>
<td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
</tr>

<tr>
<th>Email: </th>
<td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
</tr>


<tr>
<th>Password: </th>
<td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>
</tr>


<tr>
<th>Gender : </th>
<td  class="form-control"><%= user.getGender().toUpperCase()%></td>
</tr>


<tr>
<th>About : </th>
<td>
 <textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout()%> </textarea>
 </td>                                              
</tr>


<tr>
<th>NewProfile </th>
<td><input type="file" class="form-control" name="image"></td>
<td>
 
 </td>                                              
</tr>



</table>
<br>
<div class="container" >
<button type="submit" class="btn btn-outline-primary">
Save</button>

</div>


</form>
</div>
<!--  end of table -->
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id= "edit-profile-btn" class="btn btn-primary">EDIT</button>
      </div>
    </div>
  </div>
  </div>
<!-- end of profile model -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" ></script>
<script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- <script src="js/myjs.js" type="text/javascript"></script>-->

<script>
// toogle logic
$(document).ready(function(){
	//logic for toggl the profile
	let editStatus = false;
		$('#edit-profile-btn').click(function(){
			if(editStatus==false){
		$("#profile-detail").hide();
		$("#profile-edit").show();
		editStatus =true;
		$(this).text("back")
			}
			else{
				$("#profile-detail").show();
				$("#profile-edit").hide();
				editStatus =false;
				$(this).text("Edit")
				
			}
			
		})
});


</script>
</body>
</html>