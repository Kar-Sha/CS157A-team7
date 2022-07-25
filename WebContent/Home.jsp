<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
 
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver"%>

<%@ page import="pharma.DBConnection"%>


<%
	DBConnection dbCon = new DBConnection();
%>

<html>
<Title>Home</Title>
<link rel="stylesheet" type="text/css" href="./resources/css/Table.css"/>
   <input type="button" value="Logout" style="float:right" onclick="window.location='Login.jsp'" >
	<h1>Home</h1>
    <body>Welcome to PharmaPickup, 
    <% String user = request.getParameter("username");
    List<List<String>> result = dbCon.select("SELECT first_name FROM patient WHERE username = \"" + user + "\"");
    out.print(result.get(0).get(0));
    %>
    <br>
    <br>
    <h1>Approved Prescriptions</h1>
<table border="1" cellpadding="5" cellspacing="2">
    	<thead>
           <tr>
               <th>Medicine</th>
               <th>Quantity</th>
           </tr>
        </thead>
    	<tbody>
<%
	// get patient_id given their username
	List<List<String>> patientIdQueryRes = DBConnection.select("SELECT patient_id FROM patient WHERE username = \"" + user + "\"");
	String patient_id = patientIdQueryRes.get(0).get(0);
	
	List<List<String>> prescription = dbCon.select("SELECT name, quantity"
			+ " FROM medicine, prescription"
			+ " WHERE prescription.medicine_id = medicine.medicine_id AND approval_status = 'Approved' AND patient_id =\"" + patient_id + "\"");
	for(List<String> row: prescription) //gets first column of result
	{
   		out.print("<tr>");
   		String current = row.get(0);
   		for (String cell : row) 
   		{
			out.println("<td>" + cell + "</td>");
		}
   		out.print("</tr>");
	}
%>
	</tbody>
</table>

  <h1>Pending Prescriptions</h1>
<table border="1" cellpadding="5" cellspacing="2">
    	<thead>
           <tr>
               <th>Medicine</th>
               <th>Quantity</th>
           </tr>
        </thead>
    	<tbody>
<%
	List<List<String>> pend_prescription = dbCon.select("SELECT name, quantity"
			+ " FROM medicine, prescription"
			+ " WHERE prescription.medicine_id = medicine.medicine_id AND approval_status = 'Pending' AND patient_id =\"" + patient_id + "\"");
	for(List<String> row: pend_prescription) //gets first column of result
	{
   		out.print("<tr>");
   		String current = row.get(0);
   		for (String cell : row) 
   		{
			out.println("<td>" + cell + "</td>");
		}
   		out.print("</tr>");
	}
%>
	</tbody>
</table>
<br>
    Looking for something new? <input type="button" value="Browse Medicines" onclick="window.location='Browse.jsp?username=<%=user%>'" >
    </body>
    <br>
    <br>

</html>

 