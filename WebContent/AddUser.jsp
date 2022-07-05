<%@ page import ="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="pharma.DBConnection"%>

<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.NamingException"%>

<%
    try{
    	DBConnection dbCon = new DBConnection();
    	int patient_id = dbCon.getID("SELECT patient_id FROM patient ORDER BY patient_id DESC LIMIT 1;") + 1;
    	String firstName = request.getParameter("firstName");
    	String lastName = request.getParameter("lastName");
    	String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int added = dbCon.insert("INSERT INTO patient(patient_id, first_name, last_name, username, email, password, create_date)" +
        "VALUES(" + patient_id + ", '" + firstName + "', '" + lastName + "', '" + username + "', '" + email + "', '" + password + "', now());");
        if (added == 1) {
    		// refresh the page to see updated table
    		response.sendRedirect("PatientsOverview.jsp");			
    	} else {
    		out.println("couldn't register");
    	}
     }
	catch(Exception e) {
		out.println("Somthing went wrong. Please try again.");
	}
%>