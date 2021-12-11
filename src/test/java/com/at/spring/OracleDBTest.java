package com.at.spring;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.jupiter.api.Test;


public class OracleDBTest {
	private static final String DRIVER = "oracle.jdbc.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";

	private static final String USER = "spring";
	private static final String PW = "spring";

	@Test
	public void testConnection() throws Exception {
		Class.forName(DRIVER);

		try (Connection conn = DriverManager.getConnection(URL, USER, PW)) {

			System.out.println(conn); // 콘솔창에서 연결정보를 출력하여 확인한다.

		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	

}
