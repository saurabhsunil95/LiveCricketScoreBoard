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
<title>Score Update</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
    box-sizing: border-box;
}

/* Create two equal columns that floats next to each other */
.column {
    float: left;
    width: 50%;
    padding: 10px;
    height: 300px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}
</style>
</head>
<body>

 <% 
 //String url = "jdbc:mysql://localhost:3306/cricket";
 //String username="root";
 //String password = "9534598529";
 String sql = "select * from batting_team1";
 try {
 //Class.forName("com.mysql.jdbc.Driver");
// Connection co = DriverManager.getConnection(url, username, password);
 DatabaseConnection co = new DatabaseConnection();
 Statement st1 = co.getConnection();
 Statement st2 = co.getConnection();
 Statement st3 = co.getConnection();
 Statement st4 = co.getConnection();

 ResultSet rs4 = st4.executeQuery("select team_name from first_to_bat where flag_status=1");
String teamBat = null;
while(rs4.next()){
	teamBat = rs4.getString("team_name");
}
 System.out.println(teamBat);
 ResultSet rs1 = st1.executeQuery("select * from playing_11");
 ResultSet rs2 = st2.executeQuery("select * from playing_11");
 ResultSet rs3 = st3.executeQuery("select * from playing_11");


 %><div class="row">
  <div class="column" style="background-color:#ADFC98;">
    <form action="${pageContext.request.contextPath}/strike" method="post">
    Strike :  <select name="strike">
    <% while(rs1.next()) 
    {%>
     <option value=<%= rs1.getString(teamBat) %>><%= rs1.getString(teamBat) %></option>
     <%} %>
    </select>
    <br><br>
    Non-Strike :  <select name="non-strike">
    <% while(rs2.next()) 
    {%>
     <option value=<%= rs2.getString(teamBat) %>><%= rs2.getString(teamBat) %></option>
     <%} %>
    </select>
    <br><br>
      <input type="submit" value="Submit" >
      </form>
      <br>
      <br>
 </div>
      
<%
co.getCloseConnection();
} catch(Exception e){
	e.printStackTrace();
}
%>

<div class="column" style="background-color:#ADFC98;">
<% 
 
 //String sql2 = "select * from Batting_team2";
 try {
 //Class.forName("com.mysql.jdbc.Driver");
 //Connection co = DriverManager.getConnection(url, username, password);
 String sql2 = "select * from score_display";
 String sql3="select team_name from first_to_bat where flag_status=1";
 String sql5="select team_name from first_to_bat where flag_status=0";
 
 DatabaseConnection co = new DatabaseConnection();
 Statement st1 = co.getConnection();
 
 
 Statement st2 = co.getConnection();
 Statement st3 = co.getConnection();
 Statement st5 = co.getConnection();

 ResultSet rs2= st2.executeQuery(sql2);
 ResultSet rs3= st3.executeQuery(sql3);
 ResultSet rs5= st5.executeQuery(sql5);
 
 Statement st4 = co.getConnection();

 ResultSet rs4 = st4.executeQuery("select team_name from first_to_bat where flag_status=0");
String teamBall = null;
while(rs4.next()){
	teamBall = rs4.getString("team_name");
}
ResultSet rs1 = st1.executeQuery("select * from playing_11");

String TeamName=null;
String TeamName2=null;

while(rs3.next())
{
	 TeamName=rs3.getString("team_name");
}

while(rs5.next())
{
	 TeamName2=rs5.getString("team_name");
}

int total_score=0;
int wickets=0;
float overs=0f;
while(rs2.next())
{
	 total_score= rs2.getInt("totalruns");
	 System.out.println(total_score);
	 wickets= rs2.getInt("wicket");
	 System.out.println(wickets);
	 overs= rs2.getFloat("overs");
	 System.out.println(overs);
	 
}

 %>
 <br><br>
    <form action="${pageContext.request.contextPath}/SelectBowler" method="post">
    Bowler :  <select name="bowler">
    <% while(rs1.next()) 
    {%>
     <option value=<%= rs1.getString(teamBall) %>><%= rs1.getString(teamBall) %></option>
     <%} %>
    </select>
    <br><br>
    
   
      <input type="submit" value="Submit" >
      </form>
      <br>
      <br>
 
 <div class="container">
<h1 align="center"><%=TeamName.toUpperCase() %> V/S <%=TeamName2.toUpperCase() %></h1>
<h3><%= TeamName.toUpperCase()
%></h3>
Score : <%=total_score %>/<%=wickets%>
<br>
Overs : <%=overs %>
<br><br>
      </div>
<%
co.getCloseConnection();
} catch(Exception e){
	e.printStackTrace();
}
 %>
</div>
</div>
<br>
Update Score
<br><br>
 <form action="${pageContext.request.contextPath}/UpdateScoreboard" method="post">      
  <input type="radio" name="run" value="0"> 0
   <input type="radio" name="run" value="1"> 1
  <input type="radio" name="run" value="2"> 2
  <input type="radio" name="run" value="3"> 3
  <input type="radio" name="run" value="4"> 4
  <input type="radio" name="run" value="5"> 5
  <input type="radio" name="run" value="6"> 6
  <input type="radio" name="run" value="7"> 7
  <input type="radio" name="run" value="8"> 8
  <input type="radio" name="run" value="9"> 9
  <input type="radio" name="run" value="10"> 10
  <br>
  <br>
  <input type="radio" name="Extra" value="1"> wide
  <input type="radio" name="Extra" value="1"> No ball
  <input type="radio" name="Extra" value="0"> None
  <br>
  <br>
  
 HIT : <input type="radio" name="hit" value="1"> YES
     <input type="radio" name="hit" value="0" checked="checked"> NO
     	
         
      <br>
      <br>
     <input type="radio" name="out_type" value="1"> OUT
     <input type="radio" name="out_type" value="0"> RUNOUT
     <br>
      <br>
      <%
      //selecting batsman who got runout
      try {
		 //Class.forName("com.mysql.jdbc.Driver");
 		//Connection co = DriverManager.getConnection(url, username, password);
 		DatabaseConnection co = new DatabaseConnection();
 		Statement st1 = co.getConnection();
		 ResultSet rs1 = st1.executeQuery("select player from batting_team1 where flag_status=1 or flag_status=2");
		 
 %>
      Batsman who got Runout :  <select name="runout">
      <option value="" selected disabled hidden>Choose here</option>
    <% while(rs1.next()) 
    {%>
     <option value=<%= rs1.getString("player") %>><%= rs1.getString("player") %></option>
     <%} %>
    </select>
    <br><br>
      
   <input type="submit" value="Submit" >
</form>
<%
co.getCloseConnection();
} catch(Exception e){
	e.printStackTrace();
}
%>
<br><br><br>
<a href="${pageContext.request.contextPath}/truncate"><h3 style="color:red;">Truncate</h3></a>
      <br>
 <a href="${pageContext.request.contextPath}/newMatch"><h3 style="color:blue;">New Match</h3></a>
</body>
</html>