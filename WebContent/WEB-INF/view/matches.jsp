<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="com.saurabh.demo.databaseconnection.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select Team</title>
</head>
<body style="background-color:#47DEDE;">
<%

  //Class.forName("com.mysql.jdbc.Driver");

  //Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/cricket","root","9534598529");
DatabaseConnection co = new DatabaseConnection();
  Statement st = co.getConnection();
 Statement st2 = co.getConnection();

  String sql = "show tables in cricket";

  ResultSet rs = st.executeQuery(sql);
 ResultSet rs2 = st2.executeQuery(sql);
 
 int records = 0;
 
 while(rs.next())
 {
  records++;
 }
 
 String[] tables = new String[records];

  int i = 0;
 
 while(rs2.next())
 {
  tables[i] = rs2.getString(1);
  i++;
 }
 
 co.getCloseConnection();
%>
<br><br>
<center>
<legend><h2>Select Team</h2></legend>
<br>
<form action="${pageContext.request.contextPath}/Playing_11" method="post">

<select name="team1">
 <%
  for(int index = 0; index < tables.length; index++)
  {
	  if(tables[index].length()<=3){
 %>
  <option><%=tables[index]%></option>
 <%   
  }
  }
 %> 
</select>
<% 
out.println("-----V/S-----"); %>
<select name="team2">
 <%
  for(int index = 0; index < tables.length; index++)
  {
	  if(tables[index].length()<=3){
 %>
  <option><%=tables[index]%></option>
 <%   
  }
  }
 %> 
</select>
<br><br><br>
First To Bat : <select name="team">
 <%
  for(int index = 0; index < tables.length; index++)
  {
	  if(tables[index].length()<=3){
 %>
  <option><%=tables[index]%></option>
 <%   
  }
  }
 %> 
</select>
<br><br>
<input type="submit" name="submit" value="Submit" >
</form>
</body>
</html>