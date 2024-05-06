package com.tech.blog.Dao;
import com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream;
import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private static Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public static int id() {
    	 PreparedStatement ps1;
    	 int generatedId = 0;
		try {
			ps1 = UserDao.con.prepareStatement("select MAX(id) from user");
		
         ResultSet rs =  ps1.executeQuery();
         
         while(rs.next())
        	 	generatedId = rs.getInt(1);
      
        System.out.println(generatedId+"===========================");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
        return generatedId;
    }
    
    //method to insert user to data base:
    public boolean saveUser(User user) {
    	 boolean f = false;
        try {
        	String query = "INSERT INTO user(id,name, emaill, password, gender, about) VALUES (?,?, ?, ?, ?, ?);";
            PreparedStatement ps = UserDao.con.prepareStatement(query);
           
            int gId = id();
            System.out.println(gId+"=================");
            
            ps.setInt(1, ++gId);
            ps.setString(2, user.getName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getGender());
            ps.setString(6, user.getAbout());
            	ps.executeUpdate();
                f = true;
            
            
          
           
        } catch (Exception e) {
            e.printStackTrace();
        }
		return f;  
    }
    
    
    //check user in the database using email and password
    public User getUserByEmailAndPassword(String email,String password) {
    	
    	User user =null;
    	try {
    		String query ="select * from user where emaill=? and password=?;";
    		PreparedStatement ps =con.prepareStatement(query);
    		System.out.println(ps);
    		ps.setString(1,email);
    		ps.setString(2, password);
    
    		ResultSet rs =	ps.executeQuery();
    	System.out.println(rs);
    	while(rs.next()) {
    		user =new User();
    		//data from Db
    		user.setId(rs.getInt("id"));
    		user.setName(rs.getString("name"));
    		user.setEmail(rs.getString("emaill"));
    		user.setEmail(rs.getString("password"));
    		user.setGender(rs.getString("Gender"));
    		user.setAbout(rs.getString("about"));
    		user.setDateTime(rs.getTimestamp("rdate"));
    		user.setProfile(rs.getString("profile"));
    	}
    		
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	System.out.println(user);
		return user;
    	
    }
    
    public boolean UpdateUser(User user) {
    	
    	boolean f=false;
    	try {
    		String query="update user set name=?, emaill=?, password=?, gender=?,about =?, profile =? where id=?";
    		PreparedStatement ps =con.prepareStatement(query);
    		ps.setString(1, user.getName());
    		ps.setString(2, user.getEmail());
    		ps.setString(3, user.getPassword());
    		ps.setString(4,user.getGender());
    		ps.setString(5,user.getAbout());
    		ps.setString(6, user.getProfile());
    		ps.setInt(7, user.getId());
    		ps.executeUpdate();
    	 f=true;
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return f;
    }
   
	
    

}