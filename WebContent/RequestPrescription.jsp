<%@ page import ="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="pharma.DBConnection"%>

<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.NamingException"%>

<%
    try{
    	DBConnection dbCon = new DBConnection();
    	String patient_id = "1"; //request.getParameter("patient_id");
    	String med_id = "1"; //request.getParameter("medicine_id");
    	String pharmacy_id = request.getParameter("pharmacy_id");
    	String quantity = request.getParameter("quantity");
        int added = dbCon.insert("INSERT INTO prescription(patient_id, medicine_id. quantity, approval_status)" +
        "VALUES(" + patient_id + ", '" + med_id + "', '" + quantity +";");
        
        int updated = dbCon.update("UPDATE medicine_stock SET quantity = quantity -" + quantity + " WHERE pharmacy_id =" + pharmacy_id + " ;");
        
        if (added == 1 && updated == 1) {
    		// refresh the page to see updated table
    		response.sendRedirect("Medicine.jsp");			
    	} else {
    		out.println("Invalid amount");
    	}
     }
	catch(Exception e) {
		out.println("Somthing went wrong. Please try again.");
	}
%>