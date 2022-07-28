<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import="pharma.DBConnection"%>
<%@ page import="java.util.*"%>

 

<% 
	try {
		
		String medicine = request.getParameter("name");
		List<List<String>> medIdQueryRes = DBConnection.select("SELECT medicine_id FROM medicine WHERE name = \"" + medicine + "\"");
    	String med_id = medIdQueryRes.get(0).get(0);
		String username = request.getParameter("username");
		List<List<String>> patientIdQueryRes = DBConnection.select("SELECT patient_id FROM patient WHERE username = \"" + username + "\"");
    	String patient_id = patientIdQueryRes.get(0).get(0);
		String quantity = request.getParameter("quantity");
	    
		if(quantity.equals("0"))
		{
			int deleted = DBConnection.delete("DELETE FROM prescription WHERE patient_id =" + patient_id + " AND medicine_id=" + med_id + ";");
			response.sendRedirect("Home.jsp?username=" + username);	
		}
		else
		{
	    	int updated = DBConnection.update("UPDATE prescription SET quantity = "
	    		+ quantity + " WHERE patient_id =" + patient_id + " AND medicine_id=" + med_id + ";");
	    	
	   		if (updated < 1) 
	   		{
			// error
	    		response.sendRedirect("Home.jsp?username=" + username);		
				out.print("Error");
			} 
	   		response.sendRedirect("Home.jsp?username=" + username);	
		}
			
	 } catch(Exception e) {
		e.printStackTrace();
	 }

%>