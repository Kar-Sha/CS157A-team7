<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import="pharma.DBConnection"%>

<% 
	try {
		
		String med_id = request.getParameter("medicine_id");
		String pharmacy_id = request.getParameter("pharmacy_id");
		String quantity = request.getParameter("quantity");
	    
	    int updated = DBConnection.update("UPDATE medicine_stock SET quantity = "
	    	+ quantity + " WHERE pharmacy_id =" + pharmacy_id + " AND medicine_id=" + med_id + ";");
	    
	    if (updated < 1) {
			// error
		} 
	    
    	response.sendRedirect("Inventory.jsp?pharmacy_id=" + pharmacy_id);		
			
	 } catch(Exception e) {
		e.printStackTrace();
	 }

%>