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
    	
    	String med_id = request.getParameter("medicine_id");
    	String pharmacy_id = request.getParameter("pharmacy_id");
    	String quantity = request.getParameter("quantity");
    	
        int added = DBConnection.insert("INSERT INTO prescription(patient_id, medicine_id, quantity)" +
        "VALUES(" + patient_id + ", '" + med_id + "', " + quantity +");");
        
        int updated = DBConnection.update("UPDATE medicine_stock SET quantity = quantity -" + quantity + " WHERE pharmacy_id =" + pharmacy_id + " ;");
        
        if (added == 1 && updated < 1) {
    		// error
    		
    	} 
		// back
		response.sendRedirect("Medicine.jsp?username=" + username + "&medicine_id=" + med_id);			
     }
	catch(Exception e) {
		out.println("Somthing went wrong. Please try again.");
	}
%>