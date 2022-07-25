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

    /**
     * starts connection to MySQL database
     * @return a database connection
     * @throws Exception 
     */
    public static Connection mysqlConnect() throws Exception {
        try {
			InitialContext ic = new InitialContext();
			DataSource dataSource = (DataSource) ic.lookup("java:/comp/env/jdbc/pharma");
			Class.forName(driver);
			
			System.out.println("Successfully connected to database.");
			return dataSource.getConnection();
        }
        catch (NamingException e) {
        	throw e;
        }
        catch (ClassNotFoundException e) {
            throw e;
        }
        catch (SQLException e) {
            throw e;
        }
    }
   
   /**
    * executes a SQL query
    * @param query - the raw SQL query as a String that will be executed
    * @return the result of the query
    */
   public static List<List<String>> select(String query) {
	   	try (Connection con = mysqlConnect(); 
	   		 Statement statement = con.createStatement(); 
	   		 ResultSet result = statement.executeQuery(query);
	   		) {

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
		   	
		   	return resultList;
		} catch (NamingException e) {
			e.printStackTrace();
        } catch (ClassNotFoundException e) {
        	System.err.println("Couldn't load driver.");
        } catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
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
       try (Connection con = mysqlConnect(); 
	   		Statement statement = con.createStatement(); 
	   	   ) {

           return statement.executeUpdate(query);
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
	   // execute insertion using Statement
	   try (Connection con = mysqlConnect(); 
		   	Statement statement = con.createStatement();
		   ) {

		   return statement.executeUpdate(query);
	   } catch(SQLException e) {
        System.err.println(e);
	   } catch(Exception e) {
        System.err.println(e);
	   }
	   return 0;
	}

   /**
    * Executes a update operation on the MySQL database
    * @param query the specific SQL statement to be executed for update
    * @return 1 if update operation was successful, 0 otherwise
    */
      public static int update(String query) {
   	   // execute insertion using Statement
   	   try (Connection con = mysqlConnect(); 
   		   	Statement statement = con.createStatement();
   		   ) {

   		   return statement.executeUpdate(query);
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
   	   try (Connection con = mysqlConnect(); 
   			Statement statement = con.createStatement();
   			ResultSet result = statement.executeQuery(query);
   		   ) {
   		   
   		   int id = 0;
   		   while(result.next() ) {
   			   id = result.getInt("patient_id");
   		   }

   		   return id;
   	   } catch(SQLException e) {
           System.err.println(e);
   	   } catch(Exception e) {
           System.err.println(e);
   	   }
   	   return 0;
   	}
      
    /**
     * gets categories from the Category table
     * @return a list of category objects
     */
    public static List<Category> getAllCategories() {
    	List<Category> categories = new ArrayList<>();
    	
    	try (
    			// connect
    			Connection con = mysqlConnect(); 
    			
    			// execute
    			PreparedStatement statement = con.prepareStatement("SELECT * FROM category;");
    			ResultSet resultSet = statement.executeQuery();
    		) {
	   		
	   		// store result by going through the ResultSet one row per iteration
	   	  	while(resultSet.next()) {
	   	  		categories.add(new Category(Integer.valueOf(resultSet.getString(1)), resultSet.getString(2)));
	   	  	}

		} catch(SQLException e) {
	        System.err.println(e);
	    } catch(Exception e) {
            System.err.println(e);
	    }
  	
    	return categories;
    }
    
    /**
     * runs an SQL query and returns the first column of the result. 
     * @param query String of SQL statement to be executed
     */
    public static List<String> getFirstColumn(String query) {
    	List<String> result = new ArrayList<>();
    	
    	try (   // connect
    			Connection con = mysqlConnect(); 
    			
    			// execute
    			PreparedStatement statement = con.prepareStatement(query);
    			ResultSet resultSet = statement.executeQuery();
    		) {
	   		
	   		// store result by going through the ResultSet one row per iteration
	   	  	while(resultSet.next()) {
	   	  		result.add(resultSet.getString(1));
	   	  	}

		} catch(SQLException e) {
	        System.err.println(e);
	    } catch(Exception e) {
            System.err.println(e);
	    }
  	
    	return result;
    }
}
