package pharma;

import java.sql.*;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.mysql.jdbc.Driver;

public class DBConnection {
    private static String driver = "com.mysql.jdbc.Driver";
    private static java.sql.Connection con;

    /**
     * starts connection to MySQL database
     */
    public static void mysqlConnect() throws NamingException {
        try {
			InitialContext ic = new InitialContext();
			DataSource dataSource = (DataSource) ic.lookup("java:/comp/env/jdbc/pharma");
			Class.forName(driver);
			
			con = dataSource.getConnection();
			System.out.println("Successfully connected to database.");
        }
        catch (ClassNotFoundException e) {
            System.err.println("Couldn't load driver.");
        }
        catch (SQLException e) {
            System.err.println("Couldn't connect to database.");
        }
    }

    /**
     * closes connection to MySQL database if it's not already closed
     */
    public static void closeConnection(){
        try {
            if(!con.isClosed()) {
                con.close();
                System.out.println("Database closed successfully.");
            }
        }
        catch (NullPointerException e) {
            System.err.println("Couldn't load driver.");
        }
        catch (SQLException e) {
            System.err.println("Couldn't close database.");
        }
   }
}
