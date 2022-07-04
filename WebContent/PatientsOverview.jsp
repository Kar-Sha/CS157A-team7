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
           </tr>
        </thead>
    	<tbody>
    	<%
			for (List<String> patientRow : allPatients) {
				out.print("<tr>");
				for (int i = 0; i < patientRow.size(); i++) {
					if (i == 5) // skip the password column
						continue;
					
					String cell = patientRow.get(i);
					out.println("<td>" + cell + "</td>");
				}
				out.print("</tr>");
			}
    	%>
    	</tbody>
    </table>
        
  </body>
</html>