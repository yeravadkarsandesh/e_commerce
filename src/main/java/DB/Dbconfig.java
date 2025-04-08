package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconfig {
	private static Connection conn;
	public static Connection getConnection() {
		    String JDBC_URL = "jdbc:mysql://sql6.freesqldatabse.com:3306/sql12771861";
	        String JDBC_USER = "sql12771861";
	        String JDBC_PASSWORD = "uIiWhdft9r";
	       


	            try  {
	            	try {
						Class.forName("com.mysql.cj.jdbc.Driver");
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					}
	            	 conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
	            }

	         catch (SQLException e) {
	            e.printStackTrace();
	        } 
		return conn;
	
	}

}


