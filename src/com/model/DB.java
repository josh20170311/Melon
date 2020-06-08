package com.model;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.sql.DataSource;

public class DB {
	/*
	private String dbUsername = "root";
	private String dbPassword = "1234";
	private String url = "jdbc:mysql://localhost:3306/melon?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	private String driver = "com.mysql.cj.jdbc.Driver";
	*/
	protected Connection con;
	
	private DataSource dataSource;

	protected void dbConnect() {

		try {
			/*	
			Class.forName(driver);
			con = DriverManager.getConnection(url, dbUsername, dbPassword);	
			*/
			
			Context initContext = new InitialContext();
			Context envContext =(Context) initContext.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/melon");
			con = dataSource.getConnection();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void dbClose() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
