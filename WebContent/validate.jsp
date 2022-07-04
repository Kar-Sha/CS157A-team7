<%@ page import ="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver"%>

<%
	String db = "pharmapickup";
	String user;
	user = "root";
	String pw = "723988DhFma!";
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, user, pw);    
        PreparedStatement pst = con.prepareStatement("SELECT username, password FROM patient WHERE username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())
           out.println("Valid login credentials");        
        else
           out.println("Invalid login credentials");            
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>