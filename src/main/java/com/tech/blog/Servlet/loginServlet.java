package com.tech.blog.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;


import javax.servlet.http.*;

import com.tech.blog.Dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet("/loginServlet")
	public class loginServlet extends HttpServlet {

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html");
	        try (PrintWriter out = response.getWriter()) {
	            // Fetch all form data
	     
	            	String userEmail =request.getParameter("email");
	            	String userPassword =request.getParameter("password");
	            	UserDao dao =new UserDao(ConnectionProvider.getConnection());
	            	User user =dao.getUserByEmailAndPassword(userEmail,userPassword);
	            	out.println(user);
	            	out.println(userEmail);
	            	out.println(userPassword);
	            	
	            	
	            	if(user==null) {
	            		//login error
	            		//handle using session
	            		Message  msg =new Message("Invalid detail","error","alert-danger");
	            		HttpSession s=request.getSession();
	            		s.setAttribute("msg", msg);
	            		response.sendRedirect("login.jsp");
	            		out.println("invalid user found");
	            	}else {
	            		//login success
	            	HttpSession s =request.getSession();
	            		s.setAttribute("currentUser", user);
	            		response.sendRedirect("profile.jsp");
	            		out.println("succesfully login");
	            		
	            	}}catch(Exception e) {
	            		e.printStackTrace();
	            		response.sendRedirect("error.jsp");
	            	}
	            
	            
	            
	        }
	    }
	
