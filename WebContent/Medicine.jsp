<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
 
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver"%>

<%@ page import="pharma.DBConnection"%>
<head>
<title>Medicine</title>
<link rel="stylesheet" type="text/css" href="./resources/css/PharmaTheme.css"/>
<link rel="stylesheet" type="text/css" href="./resources/css/Table.css"/>
<script>
	// checks if requested amount is available
	function validateRequest(stockQuantity) {
 	    var desiredQuantity = document.forms["requestPrescriptionForm"]["quantity"].value;
	    if ( stockQuantity - desiredQuantity < 0 ) {
	       alert("The quantity you requested is not available. Please reduce your desired quantity.");
	       return false;
	    }
	    return true;
 	}
</script>
</head>
<div class="content-body-container">
<h1> 
<%
String user = request.getParameter("username");
String med_id = request.getParameter("medicine_id");
List<List<String>> medicine = DBConnection.select("SELECT name FROM medicine WHERE medicine_id=" + med_id + ";");
out.print(medicine.get(0).get(0));
%>
</h1>
<br>
<body>
<h1>Locations Available</h1>
<%
List<List<String>> result = DBConnection.select("SELECT medicine.medicine_id, medicine.name, pharmacy.pharmacy_id, pharmacy.name, location, quantity"
		+ " FROM pharmacy, medicine, medicine_stock"
		+ " WHERE medicine_stock.medicine_id = medicine.medicine_id AND medicine_stock.pharmacy_id = pharmacy.pharmacy_id"
		+ " AND medicine.medicine_id = " + med_id + "");

if(result.size() == 0)
{
	out.print("There are no Locations that Carry " + medicine.get(0).get(0) + " . Sorry for the Inconvenience");
}
%>
<table>
    	<thead>
           <tr>
               <th>Pharmacy ID</th>
               <th>Pharmacy Name</th>
               <th>Location</th>
               <th>Quantity</th>
               <th>Request Prescription</th>
           </tr>
        </thead>
    	<tbody>
<% 
    
    for(List<String> row: result) //gets first column of result
	{
    	%> <tr> <%
    	String medicineId = row.get(0);
    	String pharmacyId = row.get(2);
    	String stockQuantityStr = row.get(5);
    	for (int i=0; i<row.size(); i++) 
    	{
			if(i == 0 || i ==1)
			{
				continue;
			}
    		out.println("<td>" + row.get(i) + "</td>");
		}
    	
    	if (Integer.parseInt(stockQuantityStr) > 0) {
    %>
    	<!-- Request Prescription button -->
    	<td>
    		<form name="requestPrescriptionForm" method="post" onsubmit="return validateRequest(<%= stockQuantityStr %>)" 
    			action="RequestPrescription.jsp?username=<%=user + "&medicine_id=" + medicineId + "&pharmacy_id=" + pharmacyId %>">
    			<input name="quantity" type="number" min="1">
    			<input name="reqUserBtn" type="submit" value="Request"/>
    		</form>
    	</td>
    <% } else {
    		out.print("<td>Out of stock</td>");
    	}
    	out.print("</tr>");
    	
	}
%>
	</tbody>
</table>
<br>
<br>
<h1>Ingredients</h1>
<table>
    	<thead>
           <tr>
               <th>Ingredient ID</th>
               <th>Name</th>
           </tr>
        </thead>
    	<tbody>
<%
	List<List<String>> ingredients = DBConnection.select("SELECT ingredient.ingredient_id, name"
			+ " FROM ingredient, medicine_ingredients"
			+ " WHERE medicine_id = " + med_id + " AND ingredient.ingredient_id = medicine_ingredients.ingredient_id;");
	for(List<String> row: ingredients) //gets first column of result
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
</div>
</body>
</html>