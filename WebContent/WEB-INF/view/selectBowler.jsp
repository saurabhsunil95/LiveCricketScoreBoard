<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="com.saurabh.demo.databaseconnection.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>selectBowler_handler</title>
</head>
<body>
<%
    //String url = "jdbc:mysql://localhost:3306/cricket";
    //String username="root";
    //String password = "9534598529";
    try {
    //Class.forName("com.mysql.jdbc.Driver");
    //Connection co = DriverManager.getConnection(url, username, password);
    DatabaseConnection co = new DatabaseConnection();
    Statement st1 = co.getConnection();
    Statement st2 = co.getConnection();
    Statement st3 = co.getConnection();
    Statement st4 = co.getConnection();
    
    int k = st4.executeUpdate("update bowling_team2 set flag_status=0 where flag_status=1");
    boolean check=false;
    String get_bowler= request.getParameter("bowler");
    ResultSet rs = st2.executeQuery("select player from bowling_team2 where player='"+get_bowler+"'");
    while(rs.next()){
    	check=true;
    }
    System.out.println(check);
    if(check==true){
    int j = st3.executeUpdate("update bowling_team2 set flag_status=1 where player='"+get_bowler+"'");
    %>
    	<jsp:forward page="updateForm.jsp"></jsp:forward>
    <%}
    else{
    int i = st1.executeUpdate("insert into Bowling_team2(player) value('"+get_bowler+"')");
    int j = st3.executeUpdate("update bowling_team2 set flag_status=1 where player='"+get_bowler+"'");
    System.out.println(i);
    co.getCloseConnection();
    }
    }
     catch(Exception e){
    	 e.printStackTrace();
     }
    
     
     %> 
    <jsp:forward page="updateForm.jsp"></jsp:forward>
</body>
</html>