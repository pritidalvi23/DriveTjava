import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Jdconn {
	final static String dbDriver = "com.mysql.cj.jdbc.Driver";
	final static String dbURL = "jdbc:mysql://localhost:3306/tracker";

	// Database name to access
	final static String dbUsername = "root";
	final static String dbPassword = "root";

	public static Connection getDBConnection() throws SQLException, ClassNotFoundException {

		Class.forName(dbDriver);
		Connection con = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
		return con;
	}
}
