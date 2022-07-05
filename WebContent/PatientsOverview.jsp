<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver"%>

<%@ page import="pharma.DBConnection"%>

<%
	// Page where pharmacy staff can see all patients registered on their system
	
	DBConnection dbCon = new DBConnection();
	List<List<String>> allPatients = dbCon.execute("select * from patient");
	
	String methodType = request.getParameter("method_type");
	
	// handle delete
 	if (methodType != null && methodType.equals("delete")) {
		String userId = request.getParameter("user_id");
		int deleted = dbCon.delete("DELETE FROM patient WHERE (`patient_id` = '"+ userId +"');");

		if (deleted == 1) {
			// refresh the page to see updated table
			response.sendRedirect("PatientsOverview.jsp");			
		}
 	}
%>

<html>
  <head>
    <title>Patients Overview</title>
    </head>
  <body>
    <h1>Patients Overview</h1>
    <table border="1" cellpadding="5" cellspacing="2">
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
				
				// put the delete button at the end of the row
				String deleteButton = "<form method=\"post\" " 
										+ "action=\"PatientsOverview.jsp?method_type=delete&user_id=" + userId + "\" >"
										+ "<input name=\"deleteUserBtn\" type=\"submit\" value=\"Remove User\"/>"
										+"</form>";
				out.print("<td>" + deleteButton + "</td></tr>");
			}
    	%>
    	</tbody>
    </table>
        
  </body>
</html>