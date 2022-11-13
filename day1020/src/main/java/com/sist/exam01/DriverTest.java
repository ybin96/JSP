package com.sist.exam01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverTest {

	public static void main(String[] args) {
		Connection conn;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","c##madang","madang");
			System.out.println("Success");
		} catch (SQLException e) {
			System.out.println("SQLException:"+e);
		}catch (Exception e) {
			System.out.println("Exception:"+e);
		}

	}

}
