package com.tech.blog.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*for using image */
import javax.servlet.http.Part;

import com.tech.blog.Dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html");
	        try (PrintWriter out = response.getWriter()) {
	        	String user_email =request.getParameter("user_email");
	        	String user_name =request.getParameter("user_name");
	        	String user_password =request.getParameter("user_password");
	        String user_about =request.getParameter("user_about");
	        	Part part =request.getPart("image");
	        	String imagename =part.getSubmittedFileName();
	        	HttpSession s =request.getSession();
	        	
	        	//get user object
	        		User user =(User) s.getAttribute("user");
	        		user.setName(imagename);
	        		user.setEmail(user_email);
	        		user.setPassword(user_password);
	        		user.setAbout(user_about);
	        		user.setProfile(imagename);
	        		user.setId(user.getId());
	        		//set into database
	        		UserDao userDao =new UserDao(ConnectionProvider.getConnection());
	        	boolean ans=	userDao.UpdateUser(user);
	        	out.println(ans);
	        	if(ans) {
	        		out.println("updated on db");
	        		
	        	}else {
	        		out.println("not updated");
	        	}
	        		
	        }
	 }
}
