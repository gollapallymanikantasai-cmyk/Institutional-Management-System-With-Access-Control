package com.dbconection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	public Connection getConnection() {
		Connection c=null;
	    try {
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	c=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_db","root","root");
	    
	    }catch(Exception e) {
	    	System.out.println(e);
	    }
	    return c;
		
	}

}
