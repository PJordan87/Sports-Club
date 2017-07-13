package com.sports.sportsUtils.Jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 * @desc A singleton database access class for MySQL
 * @author Phillip
 */
public class DbConnection{

	 public Connection conn;
	//static reference to itself
	    private static DbConnection instance = new DbConnection();
	    public static final String URL = "jdbc:mysql://localhost:5000/sports";
	    public static final String USER = "root";
	    public static final String PASSWORD = "chynise07";
	    public static final String DRIVER_CLASS = "com.mysql.jdbc.Driver"; 
	     
	    //private constructor
	    private DbConnection() {
	        try {
	            Class.forName(DRIVER_CLASS);
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	    }
	     
	    private Connection createConnection() {
	        Connection connection = null;
	        try {
	            connection = DriverManager.getConnection(URL, USER, PASSWORD);
	        } catch (SQLException e) {
	            System.out.println("ERROR: Unable to Connect to Database.");
	        }
	        return connection;
	    }   
	     
	    public static Connection getConnection() {
	        return instance.createConnection();
	    }
	 
	}