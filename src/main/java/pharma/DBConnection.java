package pharma;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
    public static void mysqlConnect() {
        try {
			InitialContext ic = new InitialContext();
			DataSource dataSource = (DataSource) ic.lookup("java:/comp/env/jdbc/pharma");
			Class.forName(driver);
			
			con = dataSource.getConnection();
			System.out.println("Successfully connected to database.");
        }
        catch (NamingException e) {
        	e.printStackTrace();
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
    public static void closeConnection() {
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
   
   /**
    * executes a SQL query
    * @param query - the raw SQL query as a String that will be executed
    * @return the result of the query
    */
   public static List<List<String>> execute(String query) {
	   	try {
	   		// connect
	   		mysqlConnect();
	   		
	   		// execute
	   		Statement statement = con.createStatement();
	   		ResultSet result = statement.executeQuery(query);

	   		// get info about result
	   		ResultSetMetaData md = result.getMetaData();
	   		int numCols = md.getColumnCount();
	   		
	   		// store result by going through the ResultSet one row per iteration
	   		List<List<String>> resultList = new ArrayList<>();
	   	  	while(result.next()) {
	   	  		List<String> row = new ArrayList<>();
	   	  		
	   	  		// goes through each column from the current row and stores cell data into a list
	   	  		for (int i = 1; i < numCols + 1; i++) {
	   	  			row.add(result.getString(i));
	   	  		}
	   	  		resultList.add(row);
	   	  	}
	   		
	   		// close connections
			result.close();
	   		statement.close();
		   	closeConnection();
		   	
		   	return resultList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	   	return null;
   }
   
   /**
    * Executes a delete operation on the MySQL database
    * @param query the specific SQL statement to be executed for delete
    * @return 1 if delete operation was successful, 0 otherwise
    */
   public static int delete(String query) {
       try {
    	   mysqlConnect();
	   		
	   		// execute deletion using Statement
           Statement statement = con.createStatement();
           int success = statement.executeUpdate(query);
           
	   		// close connections
           statement.close();
           closeConnection();

           return success;
       } catch(SQLException e) {
           System.err.println(e);
       } catch(Exception e) {
           System.err.println(e);
       }
       return 0;
   }

/**
 * Executes a insert operation on the MySQL database
 * @param query the specific SQL statement to be executed for insert
 * @return 1 if insert operation was successful, 0 otherwise
 */
   public static int insert(String query) {
	   try {
		   mysqlConnect();
	   		
	   		// execute insertion using Statement
		   Statement statement = con.createStatement();
		   int success = statement.executeUpdate(query);
        
	   		// close connections
		   statement.close();
		   closeConnection();

		   return success;
	   } catch(SQLException e) {
        System.err.println(e);
	   } catch(Exception e) {
        System.err.println(e);
	   }
	   return 0;
	}

   /**
    * Executes a insert operation on the MySQL database
    * @param query the specific SQL statement to be executed for insert
    * @return 1 if insert operation was successful, 0 otherwise
    */
      public static int getID(String query) {
   	   try {
   		   mysqlConnect();
   	   		
   	   		// execute insertion using Statement
   		   Statement statement = con.createStatement();
   		   ResultSet result = statement.executeQuery(query);
   		   int id = 0;
   		   while(result.next() ) {
   			   id = result.getInt("patient_id");
   		   }
   		   
   	   		// close connections
   		   statement.close();
   		   closeConnection();

   		   return id;
   	   } catch(SQLException e) {
           System.err.println(e);
   	   } catch(Exception e) {
           System.err.println(e);
   	   }
   	   return 0;
   	}
}
