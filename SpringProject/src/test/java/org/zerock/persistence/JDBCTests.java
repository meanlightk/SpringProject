package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	static {
		//mariaDB
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnectionMariaDB() {
		try(Connection con= 
			DriverManager.getConnection(
					"jdbc:mysql://52.79.129.200:3306/shop",
					"root",
					"12345")) {
				log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
}
