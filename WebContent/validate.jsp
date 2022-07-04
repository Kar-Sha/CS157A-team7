<%@ page import ="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver"%>

<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.NamingException"%>

<%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        
    	InitialContext ic = new InitialContext();
		DataSource dataSource = (DataSource) ic.lookup("java:/comp/env/jdbc/pharma");
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = dataSource.getConnection();    
        
        PreparedStatement pst = con.prepareStatement("SELECT username, password FROM patient WHERE username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())
           out.println("Valid login credentials");        
        else
           out.println("Invalid login credentials");            
   }
   catch (NamingException e) {
	   e.printStackTrace();
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>