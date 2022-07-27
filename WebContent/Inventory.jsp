<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page import="pharma.DBConnection"%>

<%
	String pharmacyId = request.getParameter("pharmacy_id");
	
	List<List<String>> inventoryData = DBConnection.select("SELECT * "
		+ " FROM medicine_stock JOIN medicine USING(medicine_id)"
		+ " WHERE pharmacy_id=" + pharmacyId);
%>

<html>
<head>
<meta charset="UTF-8">
<title>Inventory</title>
<link rel="stylesheet" type="text/css" href="./resources/css/Table.css"/>
</head>

<jsp:include page='HeaderStaff.jsp'>
    <jsp:param name="pharmacy_id" value="<%=pharmacyId%>"/>
</jsp:include>

<body>
  <div class="content-body-container">
	<h1>Inventory</h1>
	<table>
    	<thead>
           <tr>
               <th>Medicine ID</th>
               <th>Pharmacy ID</th>
               <th>Quantity</th>
               <th>Name</th>
               <th>Dosage</th>
           </tr>
        </thead>
    	<tbody>
   		<% 
   			for (List<String> row : inventoryData) {
   				out.print("<tr>");
   				String medicineId = row.get(0);
   				
   				for (int colIndex = 0; colIndex < row.size(); colIndex++) {
   					out.print("<td>");
   					
   					String cell = row.get(colIndex);
   					
   					// Quantity column will have an update ability
   					if (colIndex == 2) { 
   						String quantity = row.get(colIndex);
   					%>
   						<form method="post" 
   							action="UpdateQuantity.jsp?medicine_id=<%= medicineId + "&pharmacy_id=" + pharmacyId %>">
   							<input type="number" min=1 name="quantity" value="<%= quantity %>">
   							<input type="submit" value="Update">
   						</form>
   					<% 
   						continue;
   					}
   					
   					out.print(cell);
   					out.print("</td>");
   				}
   				out.print("</tr>");
   			}
   		%>
		</tbody>
	</table>
  </div>
</body>
</html>