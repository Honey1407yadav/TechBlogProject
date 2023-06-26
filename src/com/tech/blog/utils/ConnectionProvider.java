package com.tech.blog.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

	public static Connection getConnection() {
		Connection con = null;
		try {

			// driver class load...
			Class.forName("com.mysql.cj.jdbc.Driver");
			// Create a connection...
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "root");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
}
