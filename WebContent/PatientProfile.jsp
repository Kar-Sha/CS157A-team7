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
<Title>Patient Profile</Title>
<link rel="stylesheet" type="text/css" href="./resources/css/Table.css"/>
	<jsp:include page='HeaderPatient.jsp'>
	    <jsp:param name="username" value="<%=user%>"/>
	</jsp:include>
	
	<div class="content-body-container">

	<h1>Personal Information</h1>
    <body>
    <% 
    List<List<String>> result = dbCon.select("SELECT first_name, last_name, username, email, LEFT(create_date, INSTR(create_date, ' '))"
    		+ " FROM patient WHERE username = \"" + user + "\"");
    out.print("<b>Name: </b>" + result.get(0).get(0) + " " + result.get(0).get(1));
    %>
    <br>
     <% 
    out.println("<b>Username: </b>" + result.get(0).get(2)); 
    %>
    <br>
    <% 
    out.println("<b>Email: </b>" + result.get(0).get(3)); 
    %>
    <br>
    <%
    out.println("<b>Date Joined: </b>" + result.get(0).get(4)); 
    %>
    <br>
    <h1>Known Allergies</h1>
<table> 
    	<thead>
           <tr>
               <th>Ingredient ID</th>
               <th>Ingredient You Are Allergic To</th>
           </tr>
        </thead>
    	<tbody>
<%
	// get patient_id given their username
	List<List<String>> patientIdQueryRes = DBConnection.select("SELECT patient_id FROM patient WHERE username = \"" + user + "\"");
	String patient_id = patientIdQueryRes.get(0).get(0);
	
	//selects ingredient id and name of the medicine
	List<List<String>> prescription = dbCon.select("SELECT ingredient.ingredient_id, name"
			+ " FROM patient_allergies, ingredient"
			+ " WHERE patient_allergies.ingredient_id = ingredient.ingredient_id AND patient_id =\"" + patient_id + "\"");
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

 
<br>
    </body>
    <br>
    <br>
	</div>
</html>