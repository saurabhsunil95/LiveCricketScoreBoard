<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="com.saurabh.demo.databaseconnection.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
try {
DatabaseConnection co = new DatabaseConnection();
Statement stmt = co.getConnection();
Statement stmt1 = co.getConnection();
Statement stmt2 = co.getConnection();

int i = stmt.executeUpdate("drop table playing_11");
int j = stmt1.executeUpdate("truncate first_to_bat");
%>


<%
co.getCloseConnection();
} catch(Exception e){
	e.printStackTrace();
}
%>
<jsp:forward page="matches.jsp"></jsp:forward>
</body>
</html>