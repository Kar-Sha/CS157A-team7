<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
 
<%@ page import="java.sql.*" %>
<%@ page import="pharma.DBConnection"%>
<%@ page import="pharma.Category"%>
    
<%
	List<Category> categories = DBConnection.getAllCategories();
	
	// Handle request
	String methodType = request.getParameter("method_type");
	
	List<Integer> categoriesSelected = new ArrayList<>();
	List<List<String>> medicineData = null;
	
	// handle search
	if (methodType != null && methodType.equals("search")) {
		
		// get the selected categories
		for (Category category : categories) {
			String onValue = request.getParameter("" + category.id);
			
			if (onValue == null) {
				continue;
			}
			
			// add to the list if this category was selected
			if (onValue.equals("on")) {
				categoriesSelected.add(category.id);
			}
		}
		
		// Get medicine_ids
		String categoryIdsStr = categoriesSelected.toString();
		// replace with parenthesis with brackets
		String categoryIdsSql = "(" + categoryIdsStr.substring(1, categoryIdsStr.length() - 1) + ")";
		List<String> medicineIdsList = DBConnection.getFirstColumn("SELECT medicine_id FROM medicine_category WHERE category_id IN " + categoryIdsSql);

		// Get medicine data
		if (medicineIdsList.size() == 0) {
			medicineData = new ArrayList<>();
		} else {
			String medicineIdsSql = "(" + String.join(", ", medicineIdsList) + ")";
			medicineData = DBConnection.select("SELECT * FROM medicine WHERE medicine_id IN " + medicineIdsSql);
		}
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Browse</title>

<link rel="stylesheet" type="text/css" href="./resources/css/Tags.css"/>
<link rel="stylesheet" type="text/css" href="./resources/css/Table.css"/>

<script>
	// toggle a checkbox state
	function check(checkboxId) {
		const checkbox = document.getElementById(checkboxId);
		if (checkbox) {
			const checkedState = checkbox.checked;
			checkbox.checked = !checkedState;			
		}
	}
</script>

</head>
<div>
	<%String user = request.getParameter("username");%>
	<input type="button" value="Return to Home" style="float:right" onclick="window.location='Home.jsp?username=<%=user%>'" >
</div>
	
<body>
	<h2>Medicine Categories</h2>
	<form method="post" action="Browse.jsp?method_type=search">
		<div class="category-list-container">
			
			<% 	// display a tag for every category 
				for (Category category : categories) { 
					String checkboxId = "checkbox-" + category.name;
					
					// to display the tag in color if it was chosen
					boolean isSelected = categoriesSelected.contains(category.id);
			%>
					<div class="checkbox-container">
						<input type="checkbox" class="tag-checkbox" name="<%= category.id %>" id="<%= checkboxId %>"
							<% if (isSelected) { %> checked <% } %>
							/>
						<p onclick="check('<%= checkboxId %>')"><%= category.name %></p>
					</div>
			<% } %>
		</div>
		<br>
		<input type="submit" value="Search"/>
		<input type="text" name="username" style="display:none" value="<%=user %>"/> <!-- keeps user info -->
	</form>
	
	
	<h1>Medicine</h1>
	<% if (medicineData == null) { %>
		<p>Select category filters on medicine and results will be displayed here.</p>
		
	<% } else if (medicineData.size() == 0) { %>
		<p>No medicine matches your category selections.</p>
		
	<% } else { %>
		<table>
			<thead>
	           <tr>
	               <th>Medicine ID</th>
	               <th>Name</th>
	               <th>Dosage</th>
	               <th>Categories</th>
	           </tr>
	        </thead>
	    	<tbody>
	    		<%
	    			for (List<String> row : medicineData) {
	    				out.print("<tr>");
	    				String currentMedicineId = row.get(0);

	    				// display medicine data
	    				for (String cell : row) {
	    					out.println("<td>" + cell + "</td>");
	    				}
	    				
	    				// get categories for this medicine
	    				List<String> categoryNames = DBConnection.getFirstColumn(
	    					"SELECT category.name FROM category, medicine_category WHERE medicine_category.medicine_id = " + currentMedicineId + " AND medicine_category.category_id = category.category_id;");
	    				
	    				// display category names in separate cell
	    				out.print("<td>");
	    				for (String categoryName : categoryNames) {
	    					out.print("<p>" + categoryName + "</p>");
	    				}
	    				out.print("</td>");
	    				
	    				out.print("</tr>");
	    			}
	    		%>
			</tbody>
		</table>
	<% } %>
	
</body>

</html>