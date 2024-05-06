package com.tech.blog.helper;
import java.sql.*;
public class ConnectionProvider {
	private static  Connection con;
	public static Connection getConnection() {
		try {
			//load the Driver
			if(con==null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			//create Connection
			con =DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "password");}
		}catch(Exception e) {
			e.printStackTrace();
		}
				
		return con;
		
	}
	

}
