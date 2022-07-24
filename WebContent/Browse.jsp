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
	<div class="category-list-container">
		
		<% 	// display a tag for every category 
			for (Category category : categories) { 
				String checkboxId = "checkbox-" + category.name;
		%>
				<div class="checkbox-container">
					<input type="checkbox" class="tag-checkbox" name="<%= category.name %>" id="<%= checkboxId %>"/>
					<p onclick="check('<%= checkboxId %>')"><%= category.name %></p>
				</div>
		<% } %>
	</div>
</body>

</html>