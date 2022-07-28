<%@ page import ="java.util.List" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="pharma.DBConnection"%>

<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.NamingException"%>

<%
    try{
    	String username = request.getParameter("username");
    	
    	// get patient_id given their username
    	List<List<String>> patientIdQueryRes = DBConnection.select("SELECT patient_id FROM patient WHERE username = \"" + username + "\"");
    	String patient_id = patientIdQueryRes.get(0).get(0);
  
    	String ingredient_id = request.getParameter("ingredient_id");
 
        int added = DBConnection.insert("INSERT INTO patient_allergies(patient_id, ingredient_id)" +
        "VALUES(" + patient_id + ", '" + ingredient_id +");");
        
        
        if (added == 0) {
    		// error
        	response.sendRedirect("PatientProfile.jsp?username=" + username);		
    	} 
        else{
        	response.sendRedirect("PatientProfile.jsp?username=" + username);
        }
			
     }
	catch(Exception e) {
		out.println("Somthing went wrong. Please try again.");
	}
%>