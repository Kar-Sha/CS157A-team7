<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
 
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver"%>

<%@ page import="pharma.DBConnection"%>


<%
	DBConnection dbCon = new DBConnection();
	String user = request.getParameter("username");
%>

<html>
<Title>Home</Title>
<link rel="stylesheet" type="text/css" href="./resources/css/Table.css"/>
	<jsp:include page='HeaderPatient.jsp'>
	    <jsp:param name="username" value="<%=user%>"/>
	</jsp:include>
	
	<div class="content-body-container">

	<h1>Home</h1>
    <body>Welcome to PharmaPickup, 
    <% 
    List<List<String>> result = dbCon.select("SELECT first_name FROM patient WHERE username = \"" + user + "\"");
    out.print(result.get(0).get(0));
    %>
    <br>
    <br>
    <h1>Approved Prescriptions</h1>
    <%
	// get patient_id given their username
	List<List<String>> patientIdQueryRes = DBConnection.select("SELECT patient_id FROM patient WHERE username = \"" + user + "\"");
	String patient_id = patientIdQueryRes.get(0).get(0);
	
	List<List<String>> prescription = dbCon.select("SELECT name, quantity"
			+ " FROM medicine, prescription"
			+ " WHERE prescription.medicine_id = medicine.medicine_id AND approval_status = 'Approved' AND patient_id =\"" + patient_id + "\"");
	
	if(prescription.size() == 0)
	{
		out.print("You have no Active Prescriptions");
	}
	else
	{
    %>
<table>
    	<thead>
           <tr>
               <th>Medicine</th>
               <th>Quantity</th>
               <th>Update Quantity</th>
           </tr>
        </thead>
    	<tbody>
<%

	for(List<String> row: prescription) //gets first column of result
	{
		String medicineID = row.get(0);
   		out.print("<tr>");
   		String current = row.get(0);
   		for (int i=0; i<row.size(); i++) 
   		{
   			String quantity = row.get(i);
			out.println("<td>" + row.get(i) + "</td>");
			if(i == 1)
			{
				%>
				<td>
    		<form name="updateApprovedPrescriptionQuantityForm" method="post" 
    			action="UpdateApprovedPrescriptionQuantity.jsp?username=<%=user + "&name=" + medicineID%>">
    			<input name="quantity" type="number" min="0" max="<%=quantity%>" value="<%=quantity%>">
    			<input name="updatePresQtyBtn" type="submit" value="Update"/>
    		</form>
    	</td>
    	<% 
			}
		}
   		out.print("</tr>");
	}
%>
	</tbody>
</table>
<%
}
%>
  <h1>Pending Prescriptions</h1>
 <%
 List<List<String>> pend_prescription = dbCon.select("SELECT name, quantity"
			+ " FROM medicine, prescription"
			+ " WHERE prescription.medicine_id = medicine.medicine_id AND approval_status = 'Pending' AND patient_id =\"" + patient_id + "\"");
 
 if(pend_prescription.size() == 0)
 {
	 out.print("You have no Pending Prescriptions");
 }
 else
 {
 %>
<table>
    	<thead>
           <tr>
               <th>Medicine</th>
               <th>Quantity</th>
           </tr>
        </thead>
    	<tbody>
<%
	
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
<%
}
%>
    </body>
	</div>
</html>

 