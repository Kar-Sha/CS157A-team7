<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
 
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver"%>

<%@ page import="pharma.DBConnection"%>


<%
	DBConnection dbCon = new DBConnection();
	String userID = request.getParameter("user_id");
	String firstName = dbCon.getFirstName("SELECT first_name FROM patient WHERE patient_id = "+ userID +";");
	List<List<String>> prescriptionList = dbCon.select("SELECT * FROM prescription WHERE patient_id = "+ userID +";");
%>

<html>
  <head>
    <title>
	Prescription List
    </title>
  </head>
  <body>
  	<h1>
    <%out.print(firstName);%>'s Prescription
  	</h1>
  	<table border="1" cellpadding="5" cellspacing="2">
    	<thead>
           <tr>
               <th>Patient ID</th>
               <th>Medicine ID</th>
               <th>Quantity</th>
               <th>Approval Status</th>
           </tr>
        </thead>
    	<tbody>
    	<%
			for (List<String> prescriptionRow : prescriptionList) {
				out.print("<tr>");
				
				// get data for the user in this row
				String userId = prescriptionRow.get(0);
				for (int i = 0; i < prescriptionRow.size(); i++) {
					if (i == 5) // skip the password column
						continue;
					
					String cell = prescriptionRow.get(i);
					out.println("<td>" + cell + "</td>");
				}
				out.print("</tr>");
			}
    	%>
    	</tbody>
    </table>
  </body>
</html>