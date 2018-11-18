<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.saurabh.demo.databaseconnection.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Strike-Handler</title>
</head>
<body>
    <%
    //String url = "jdbc:mysql://localhost:3306/cricket";
    //String username="root";
    //String password = "9534598529";
    String sql = "select * from batting_team1";
    try {
    //Class.forName("com.mysql.jdbc.Driver");
    //Connection co = DriverManager.getConnection(url, username, password);
    DatabaseConnection co = new DatabaseConnection();
    Statement st1 = co.getConnection();
    Statement st2 = co.getConnection();
    Statement st3 = co.getConnection();
    Statement st4 = co.getConnection();
    Statement st5 = co.getConnection();


    String get_strike= request.getParameter("strike"); 
    String get_non_strike= request.getParameter("non-strike"); 
    
    boolean check_player_strike=false;
    boolean check_player_non_strike=false;

    ResultSet rs = st1.executeQuery("select player from batting_team1 where player='"+get_strike+"'");
    ResultSet rs2 = st2.executeQuery("select player from batting_team1 where player='"+get_non_strike+"'");

    while(rs.next()){
    	check_player_strike=true;
    }
    while(rs2.next()){
    	check_player_non_strike=true;
    }
    System.out.println(check_player_strike);
    System.out.println(check_player_non_strike);

    if(check_player_strike==true){
    	int i = st3.executeUpdate("update batting_team1 set flag_status=1 where player='"+get_strike+"'");%>
    <%}
    else{
    int i = st3.executeUpdate("insert into batting_team1(player) value('"+get_strike+"')");
	int j = st4.executeUpdate("update batting_team1 set flag_status=1 where player='"+get_strike+"'");
    System.out.println(i+" "+j);
    }
    if(check_player_non_strike==true){
    	int i = st4.executeUpdate("update batting_team1 set flag_status=2 where player='"+get_non_strike+"'");%>
    <%}
    else{
    int i = st4.executeUpdate("insert into batting_team1(player) value('"+get_non_strike+"')");
	int j = st3.executeUpdate("update batting_team1 set flag_status=2 where player='"+get_non_strike+"'");
    System.out.println(i+" "+j);
    }
    %>
	<jsp:forward page="updateForm.jsp"></jsp:forward>
<%
    co.getCloseConnection();
    }
     catch(Exception e){
    	 e.printStackTrace();
     }
    	 
     
     %> 
    <jsp:forward page="updateForm.jsp"></jsp:forward>
</body>
</html>