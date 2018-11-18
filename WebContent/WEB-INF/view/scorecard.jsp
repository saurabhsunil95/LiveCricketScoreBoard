<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
    <%@page import="com.saurabh.demo.databaseconnection.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>scoreUpdate</title>
</head>
<body>

<%
//String team1=request.getParameter("team1");
//String team2=request.getParameter("team2");
String playersTeam1[] = request.getParameterValues("teamPlayers1");
String playersTeam2[] = request.getParameterValues("teamPlayers2");

//System.out.println(team1+" "+team2);

//String url = "jdbc:mysql://localhost:3306/cricket";
//String username="root";
//String password = "9534598529";

//String sql2 = "insert into playing_11 (team2) values";
try {
//Class.forName("com.mysql.jdbc.Driver");
//Connection co = DriverManager.getConnection(url, username, password);
DatabaseConnection co = new DatabaseConnection();
Statement st = co.getConnection();
Statement st1 = co.getConnection();
Statement st2 = co.getConnection();
Statement st3 = co.getConnection();
Statement st4 = co.getConnection();
Statement st5 = co.getConnection();
String team1=null;
String team2=null;
 ResultSet rs = st4.executeQuery("select team_name from first_to_bat where flag_status=1");
 while(rs.next()){
	 team1 = rs.getString("team_name");
	 break;
 }
 ResultSet rs1 = st5.executeQuery("select team_name from first_to_bat where flag_status=0");
 while(rs1.next()){
	 team2 = rs1.getString("team_name");
	 break;
 }
 System.out.println(team1+" "+team2);
 
String sql1 = "insert into playing_11 values";
String sqlVar = "create table playing_11("+team1+" varchar(30), "+team2+" varchar(30))";
System.out.println(sqlVar);
try{
int x=st3.executeUpdate(sqlVar);
}catch(Exception e){
	e.printStackTrace();
}
for(int i=0; i<playersTeam1.length;i++)
{
	int no_of_update = st.executeUpdate(sql1+"('"+playersTeam1[i]+"','"+playersTeam2[i]+"')");
}
co.getCloseConnection();
}catch(Exception e){
	e.printStackTrace();
}
%>
<jsp:forward page="updateForm.jsp"></jsp:forward>

</body>
</html>