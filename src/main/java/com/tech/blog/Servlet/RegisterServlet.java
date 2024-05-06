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

import com.tech.blog.Dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html");
	        try (PrintWriter out = response.getWriter()) {
	        			//fetch all form data
	            String check = request.getParameter("check");
	          
	            if (check == null) {
	                out.println("Somthing went wrong please check the box");
	            } else {
	                // data...
	            	int id=0;
	                String name = request.getParameter("user_name");
	                String email = request.getParameter("user_email");
	                String password = request.getParameter("user_password");
	                String gender = request.getParameter("gender");
	                String about = request.getParameter("about");
	                //create user object and set all data to that object..
	                User user = new User(id,name, email, password, gender, about);
	               
	                //create a user object..
	                UserDao dao = new UserDao(ConnectionProvider.getConnection());
	             
	                boolean result =dao.saveUser(user);
	                HttpSession hs = request.getSession();	               
	                hs.setAttribute("user", user);
	                if (result) {
	                	//save..
	                    out.println("Registration successfull");
	                    id=id+1;
	                } else {
	                	out.println("<h1><span style='color:red'>Registration Failed</span></h1>");

	                }
	            }
	         
	        }
	    }
	
	
}