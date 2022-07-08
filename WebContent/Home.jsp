<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
 
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver"%>

<%@ page import="pharma.DBConnection"%>


<%
	DBConnection dbCon = new DBConnection();
	dbCon.mysqlConnect();
	dbCon.closeConnection();
%>

<html>
  <head>
    <title>Home</title>
    </head>
  <body>
    <h1>Welcome, 
    <% String user = request.getParameter("username");
    List<List<String>> result = dbCon.execute("SELECT first_name FROM patient WHERE username = \"" + user + "\"");
    out.print(result.get(0).get(0));
    %>
    </h1>
   	
   	
    <input type="button" value="Logout" onclick="window.location='Login.jsp'" >
  </body>
</html>