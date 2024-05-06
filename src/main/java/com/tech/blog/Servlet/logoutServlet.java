package com.tech.blog.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entities.Message;

@WebServlet("/logoutServlet")
public class logoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
        	 HttpSession s = request.getSession();
             s.removeAttribute("currentUser");
             Message m = new Message("Logout Successfully", "success", "alert-success");
             s.setAttribute("msg", m);
             response.sendRedirect("login.jsp");	
        }catch(Exception e ) {
        	e.printStackTrace();
        }
        
        
    }    }