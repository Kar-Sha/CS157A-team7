<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
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
    <h1>Home</h1>
    
  </body>
</html>