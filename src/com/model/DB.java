package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {

	private String dbUsername = "root";
	private String dbPassword = "1234";
	private String url = "jdbc:mysql://localhost:3306/melon?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	private String driver = "com.mysql.cj.jdbc.Driver";
	protected Connection con;


	protected void dbConnect() {

		try {
			Class.forName(driver);

			con = DriverManager.getConnection(url, dbUsername, dbPassword);
			System.out.println(con);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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
