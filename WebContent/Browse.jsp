<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
 
<%@ page import="java.sql.*" %>
<%@ page import="pharma.DBConnection"%>
<%@ page import="pharma.Category"%>
    
<%
	DBConnection dbCon = new DBConnection();
	List<Category> categories = dbCon.getAllCategories();
	
	// Handle request
	String methodType = request.getParameter("method_type");
	
	List<String> categoriesSelected = new ArrayList<>();
	
	// handle search
	if (methodType != null && methodType.equals("search")) {
		
		// get the selected categories
		for (Category category : categories) {
			String onValue = request.getParameter(category.name);
			
			if (onValue == null) {
				continue;
			}
			
			// add to the list if this category was selected
			if (onValue.equals("on")) {
				categoriesSelected.add(category.name);
			}
		}
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Browse</title>

<link rel="stylesheet" type="text/css" href="./resources/css/Browse.css"/>

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

<body>
	<form method="post" action="Browse.jsp?method_type=search">
		<!-- Medicine Categories -->
		<div class="category-list-container">
			
			<% 	// display a tag for every category 
				for (Category category : categories) { 
					String checkboxId = "checkbox-" + category.name;
					
					// to display the tag in color if it was chosen
					boolean isSelected = categoriesSelected.contains(category.name);
			%>
					<div class="checkbox-container">
						<input type="checkbox" class="tag-checkbox" name="<%= category.name %>" id="<%= checkboxId %>"
							<% if (isSelected) { %> checked <% } %>
							/>
						<p onclick="check('<%= checkboxId %>')"><%= category.name %></p>
					</div>
			<% } %>
		</div>
		
		<!-- Search Button -->
		<input type="submit" value="Search"/>
	</form>
</body>

</html>