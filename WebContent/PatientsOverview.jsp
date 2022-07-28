<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver"%>

<%@ page import="pharma.DBConnection"%>

<%
	String pharmacy_id = request.getParameter("pharmacy_id");

	// Page where pharmacy staff can see all patients registered on their system
	
	DBConnection dbCon = new DBConnection();
	List<List<String>> allPatients = dbCon.select("select * from patient");
	
	String methodType = request.getParameter("method_type");
	String errorMessage = null;
	
	// handle delete
 	if (methodType != null && methodType.equals("delete")) {
		String userId = request.getParameter("user_id");
		int deleted = dbCon.delete("DELETE FROM patient WHERE (`patient_id` = '"+ userId +"');");

		if (deleted == 1) {
			// refresh the page to see updated table
			response.sendRedirect("PatientsOverview.jsp?pharmacy_id=" + pharmacy_id);			
		} else {
			errorMessage = "'Error in deleting user.'";
		}
 	}
%>

<html>
  <head>
    <title>Patients Overview</title>
    <link rel="stylesheet" type="text/css" href="./resources/css/Table.css"/>
    </head>
    
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			// display an error message if there was an error trying to delete the user
			if (<%= errorMessage %>) {
				var errorElement = document.getElementById('error-message');
				errorElement.innerHTML = <%= errorMessage %>;
			}
		})
	</script>
   
  <body>

  <jsp:include page='HeaderStaff.jsp'>
      <jsp:param name="pharmacyId" value="<%=pharmacy_id%>"/>
  </jsp:include>
	
  <div class="content-body-container">
  
    <h1>Patients Overview</h1>
    <table>
    	<thead>
           <tr>
               <th>Patient ID</th>
               <th>First</th>
               <th>Last</th>
               <th>Username</th>
               <th>Email</th>
               <th>Date of Account Creation</th>
               <th></th>
           </tr>
        </thead>
    	<tbody>
    	<%
			for (List<String> patientRow : allPatients) {
				out.print("<tr>");
				
				// get data for the user in this row
				String userId = patientRow.get(0);
				for (int i = 0; i < patientRow.size(); i++) {
					if (i == 5) // skip the password column
						continue;
					
					String cell = patientRow.get(i);
					out.println("<td>" + cell + "</td>");
				}
				
				String prescriptionButton = "<form method=\"post\" "
						+ "action=\"PatientPrescription.jsp?pharmacy_id=" + pharmacy_id + "&user_id=" + userId + "\" >"
						+ "<input name=\"prescriptionBtn\" type=\"submit\" value=\"Presciption List\"/>"
						+"</form>";
				
				// put the delete button at the end of the row
				String deleteButton = "<form method=\"post\" " 
										+ "action=\"PatientsOverview.jsp?method_type=delete&user_id=" + userId + "&pharmacy_id=" + pharmacy_id + "\" >"
										+ "<input name=\"deleteUserBtn\" type=\"submit\" value=\"Remove User\"/>"
										+"</form>";
				out.print("<td>" + prescriptionButton + "&nbsp;&nbsp;" + deleteButton + "</td></tr>");
			}
    	%>
    	</tbody>
    </table>
    
    <p id="error-message" style="color: red"></p>
  </div>
  </body>
</html>