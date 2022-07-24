<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
 
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver"%>

<%@ page import="pharma.DBConnection"%>


<%
	DBConnection dbCon = new DBConnection();
%>

<html>
	<h1>Home</h1>
    <body>Welcome to PharmaPickup, 
    <% String user = request.getParameter("username");
    List<List<String>> result = dbCon.select("SELECT first_name FROM patient WHERE username = \"" + user + "\"");
    out.print(result.get(0).get(0));
    %>
    <br>
    <br>
    Looking for something new? <input type="button" value="Browse Medicines" onclick="window.location='Browse.jsp?username=<%=user%>'" >
    </body>
    <br>
    <br>

</html>

    <input type="button" value="Logout" action="Validate.jsp" onclick="window.location='Login.jsp'" >