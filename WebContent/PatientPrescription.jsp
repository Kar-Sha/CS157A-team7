<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
 
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver"%>

<%@ page import="pharma.DBConnection"%>


<%
	DBConnection dbCon = new DBConnection();
	String methodType = request.getParameter("method_type");
	String errorMessage = null;
	String userID = request.getParameter("user_id");
	String pharmacy_id = request.getParameter("pharmacy_id");
	String firstName = dbCon.getFirstName("SELECT first_name FROM patient WHERE patient_id = "+ userID +";");
	
	// handle approve
	 if (methodType != null && methodType.equals("approve")) {
	 		String medicineID = request.getParameter("medicineID");
			String quantity = request.getParameter("quantity");
			
			int approved = dbCon.update("UPDATE prescription set quantity = quantity + " + quantity + " WHERE patient_id = '" + userID 
					+ "' AND approval_status = 'Approved' AND medicine_id = '" + medicineID + "';");
			
			if(approved == 1) {
				int delete = dbCon.delete("DELETE FROM prescription WHERE patient_id = '" + userID 
						+ "' AND approval_status = 'Pending' AND medicine_id = '" + medicineID + "';");
			}
			
			else {
			approved = dbCon.update("UPDATE prescription set approval_status = 'Approved' WHERE patient_id = '" + userID 
										+ "' AND approval_status = 'Pending' AND medicine_id = '" + medicineID + "';");
			}
			if (approved == 1) {
				// refresh the page to see updated table
				response.sendRedirect("PatientPrescription.jsp?user_id=" + userID + "&pharmacy_id=" + pharmacy_id);			
			} else {
				errorMessage = "'Error in approving user request.'";
			}
	 	}
	
	// handle deny
	if (methodType != null && methodType.equals("deny")) {
	 		String medicineID = request.getParameter("medicineID");
	 		String quantity = request.getParameter("quantity");

			int denied = dbCon.update("UPDATE medicine_stock set quantity = quantity + " + quantity 
						+ " WHERE medicine_id = '" + medicineID + "';");

			if (denied == 1) {
				
				int delete = dbCon.delete("DELETE FROM prescription WHERE patient_id = '" + userID 
						+ "' AND approval_status = 'Pending' AND medicine_id = '" + medicineID + "';");
				
				// refresh the page to see updated table
				response.sendRedirect("PatientPrescription.jsp?user_id=" + userID + "&pharmacy_id=" + pharmacy_id);			
			} else {
				errorMessage = "'Error in denying user request.'";
			}
	 	}
%>
<html>
<Title>Prescription List</Title>
<link rel="stylesheet" type="text/css" href="./resources/css/Table.css"/>
  <jsp:include page='HeaderStaff.jsp'>
      <jsp:param name="pharmacyId" value="<%=pharmacy_id%>"/>
  </jsp:include>
	
	<div class="content-body-container">

	<h1>
	    <% out.print(firstName);%>'s Prescription
	</h1>
    <br>
    <br>
    <h1><% out.print(firstName);%>'s Approved Prescriptions</h1>
    <%
    List<List<String>> prescription = dbCon.select("SELECT name, quantity"
			+ " FROM medicine, prescription"
			+ " WHERE prescription.medicine_id = medicine.medicine_id AND approval_status = 'Approved' AND patient_id =\"" + userID + "\"");
    
    if(prescription.size() == 0)
	{
		out.print("This User has no Active Prescriptions");
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
<%
}
%>

<br>
<br>
  <h1><% out.print(firstName);%>'s Pending Prescriptions</h1>
  <%
	List<List<String>> pend_prescription = dbCon.select("SELECT medicine.medicine_id, name, quantity"
			+ " FROM medicine, prescription"
			+ " WHERE prescription.medicine_id = medicine.medicine_id AND approval_status = 'Pending' AND patient_id =\"" + userID + "\"");
  if(pend_prescription.size() == 0)
  {
 	 out.print("This User has no Pending Prescriptions");
  }
  else
  {
  %>
<table>
    	<thead>
           <tr>
               <th>Medicine ID</th>
               <th>Name</th>
               <th>Quantity</th>
               <th></th>
           </tr>
        </thead>
    	<tbody>
<%

for (List<String> prescriptionRow : pend_prescription) {
	out.print("<tr>");
	
	// get data for the user in this row
	String medicineID = prescriptionRow.get(0);
	String quantity = prescriptionRow.get(2);
	for (int i = 0; i < prescriptionRow.size(); i++) {
		
		String cell = prescriptionRow.get(i);
		out.println("<td>" + cell + "</td>");
	}
		// put the approve button at the end of the row
		String approveButton = "<form method=\"post\" " 
								+ "action=\"PatientPrescription.jsp?method_type=approve&quantity=" + quantity + "&medicineID=" + medicineID + "&user_id=" + userID + "&pharmacy_id=" + pharmacy_id + "\" >"
								+ "<input name=\"approveUserBtn\" type=\"submit\" value=\"Approve\"/>"
								+"</form>";
								
		// deny button
		String denyButton = "<form method=\"post\" " 
								+ "action=\"PatientPrescription.jsp?method_type=deny&quantity=" + quantity + "&medicineID=" + medicineID + "&user_id=" + userID + "&pharmacy_id=" + pharmacy_id + "\" >"
								+ "<input name=\"approveUserBtn\" type=\"submit\" value=\"Deny\"/>"
								+"</form>";
		out.print("<td>" + approveButton + "&nbsp;&nbsp;" + denyButton + "</td></tr>");
}
%>
	</tbody>
</table>
<%
}
%>
	</div>
</html>