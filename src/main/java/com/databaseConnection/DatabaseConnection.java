package com.databaseConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

	private static Connection conn;

	public static Connection getConnection() {

		try {
			if (conn == null) {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-book-application", "root", "");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}
}
