package mail;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContent {
	private static Connection con;
	public static Connection connectDB() {
	
		try {
			//do jdbc connectivity if there is not connection
			if(con==null) {
			// loading driver connection
				Class.forName("com.mysql.cj.jdbc.Driver");
			//creating connection
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mailinfo", "root", "root");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error happened on connecting database");
		}
		return con;
	}
}