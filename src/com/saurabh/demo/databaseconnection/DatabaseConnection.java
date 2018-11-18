package com.saurabh.demo.databaseconnection;

import java.sql.DriverManager;
import java.sql.Statement;



public class DatabaseConnection {

   static java.sql.Connection connection = null;
	public  static Statement getConnection() throws Exception
	{

	    // Database Info
		 String db_url = "jdbc:mysql://localhost:3306/cricket"; // put your own endpoint link
		    String db_user = "root"; //put your password 
		    String db_password = "9534598529"; // put your password
	    
	    try{
	    	Class.forName("com.mysql.jdbc.Driver");
	    } catch(Exception e){
	    	System.out.println("Database Error" + "\n We will fix Wait for some time!!" + "\nsorry for the inconvenience");
	    }
	    
	    connection = DriverManager.getConnection(db_url,db_user,db_password);
	    Statement statement = (Statement) connection.createStatement();
	    
	    return statement;
	}
	public static void  getCloseConnection() throws Exception {
		
		connection.close();
	}
	
}