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
<title>Full Scoreeboard</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<% 
 DatabaseConnection co=null;
 String sql = "select * from score_display";
 String sql1="select * from batting_team1";
 String sql2="select * from bowling_team2";
 String sql3="select team_name from first_to_bat where flag_status=1";
 String sql4="select team_name from first_to_bat where flag_status=0";
 try {
	  co = new DatabaseConnection();
 Statement st1 = co.getConnection();
 Statement st2 = co.getConnection();
 Statement st3 = co.getConnection();
 Statement st4 = co.getConnection();
 Statement st5 = co.getConnection();

 ResultSet rs1= st1.executeQuery(sql);
 ResultSet rs2= st2.executeQuery(sql1);
 ResultSet rs3= st3.executeQuery(sql2);
 ResultSet rs4= st4.executeQuery(sql3);
 ResultSet rs5= st5.executeQuery(sql4);

 String TeamName=null;
 String TeamName2=null;
 
 while(rs4.next())
 {
	 TeamName=rs4.getString("team_name");
 }
 
 while(rs5.next())
 {
	 TeamName2=rs5.getString("team_name");
 }
 
 int total_score=0;
 int wickets=0;
 float overs=0f;
 
 String player_name= null;
 int runs=0;
 int balls=0;
 float strike_rate=0f; 
 int flag = 0;
 
 while(rs1.next())
 {
	 total_score= rs1.getInt("totalruns");
	 System.out.println(total_score);
	 wickets= rs1.getInt("wicket");
	 System.out.println(wickets);
	 overs= rs1.getFloat("overs");
	 System.out.println(overs);
	 
 }

 %>
 
 <%
try{
 Statement st6 = co.getConnection();
 Statement st7 = co.getConnection();
 Statement st8 = co.getConnection();
 String tableBatting = TeamName2+"vs"+TeamName+"score"+TeamName2;
 
String tableBattingsql = "select * from `'"+TeamName2+"vs"+TeamName+"batting"+TeamName2+"'`";
String tableBowlingsql = "select * from `'"+TeamName2+"vs"+TeamName+"bowling"+TeamName+"'`";
System.out.println(tableBattingsql);
 ResultSet rs6= st6.executeQuery(tableBattingsql);
 ResultSet rs7= st7.executeQuery(tableBowlingsql);
 ResultSet rs8= st8.executeQuery("select * from score_display_status where matches_name='"+tableBatting+"'");

 
 int total_score1=0;
 int wickets1=0;
 float overs1=0f;
 
 String player_name1= null;
 int runs1=0;
 int balls1=0;
 float strike_rate1=0f; 
 int flag1 = 0;
 
 while(rs8.next())
 {
	 total_score1= rs8.getInt("totalruns");
	 System.out.println(total_score1);
	 wickets1= rs8.getInt("wicket");
	 System.out.println(wickets1);
	 overs1= rs8.getFloat("overs");
	 System.out.println(overs1);
	 
 }

 %>

<div class="container">

<h3><%= TeamName2.toUpperCase()
%></h3>
Score : <%=total_score1 %>/<%=wickets1%>
<br>
Overs : <%=overs1 %>
<br><br>
  <h2><%=TeamName2.toUpperCase() %> Scorecard</h2>
  <table class="table table-hover bg-info">
    <thead>
      <tr class="active">
        <th>Player</th>
        <th>Runs</th>
        <th>Balls</th>
        <th>Strike Rate</th>
      </tr>
    </thead>
    <tbody>
     
      <%
      while(rs6.next())
 {
      player_name1=rs6.getString("player");
      System.out.println(player_name1);
	 runs1 = rs6.getInt("runs");
	 System.out.println(runs1);
	 balls1= rs6.getInt("balls");
	 System.out.println(balls1);
	 strike_rate1= rs6.getFloat("strike_rate");
	 System.out.println(strike_rate1);
	 flag1 = rs6.getInt("flag_status");
	 
	%> <tr>
	 <td>
	 <%=player_name1 %>
	 <%
	 if(flag1 == 1)
		 out.print("*");
	 %>
	 </td>
     <td><%=runs1 %></td>
     <td><%=balls1 %></td>
     <td><%= strike_rate1%></td>
     </tr>
	 <%
 }
        %>
    </tbody>
  </table>
</div>

<div class="container">
  <h2>Bowlers</h2>
  <table class="table table-hover bg-info">
    <thead>
      <tr class="active">
        <th>Player</th>
        <th>Overs</th>
        <th>Runs</th>
        <th>Wickets</th>
      </tr>
    </thead>
    <tbody>
     
      <%
      
      String Bowler_name1=null;
      float Bowler_overs1=0f;
      int Bowler_runs1=0;
      int Bowler_wicket1=0;
      while(rs7.next())
 {
      Bowler_name1=rs7.getString("player");
      System.out.println(Bowler_name1);
	 Bowler_overs1 = rs7.getFloat("overs");
	 System.out.println(Bowler_overs1);
	 Bowler_runs1= rs7.getInt("runs");
	 System.out.println( Bowler_runs1);
	 Bowler_wicket1= rs7.getInt("wicket");
	 System.out.println( Bowler_wicket1);
	 
	%> <tr>
	 <td><%=Bowler_name1 %></td>
     <td><%=Bowler_overs1 %></td>
     <td><%=Bowler_runs1 %></td>
     <td><%= Bowler_wicket1%></td>
     </tr>
	 <%
 }
        %>
    </tbody>
  </table>
</div>
 
 
 
<%

} catch (Exception e) {
e.printStackTrace();
}
%>

<%
try{
 Statement st9 = co.getConnection();
 Statement st10 = co.getConnection();
 Statement st11 = co.getConnection();

 String tableBatting = TeamName+"vs"+TeamName2+"score"+TeamName;
String tableBattingsql = "select * from `'"+TeamName+"vs"+TeamName2+"batting"+TeamName+"'`";
String tableBowlingsql = "select * from `'"+TeamName+"vs"+TeamName2+"bowling"+TeamName2+"'`";
System.out.println(tableBattingsql);
 ResultSet rs9= st9.executeQuery(tableBattingsql);
 ResultSet rs10= st10.executeQuery(tableBowlingsql);
 ResultSet rs11= st11.executeQuery("select * from score_display_status where matches_name='"+tableBatting+"'");

 
 int total_score11=0;
 int wickets11=0;
 float overs11=0f;
 
 String player_name11= null;
 int runs11=0;
 int balls11=0;
 float strike_rate11=0f; 
 int flag11 = 0;
 
 while(rs11.next())
 {
	 total_score11= rs11.getInt("totalruns");
	 System.out.println(total_score11);
	 wickets11= rs11.getInt("wicket");
	 System.out.println(wickets11);
	 overs11= rs11.getFloat("overs");
	 System.out.println(overs11);
	 
 }

 %>

<div class="container">

<h3><%= TeamName.toUpperCase()
%></h3>
Score : <%=total_score11 %>/<%=wickets11%>
<br>
Overs : <%=overs11 %>
<br><br>
  <h2><%=TeamName.toUpperCase() %> Scorecard</h2>
  <table class="table table-hover bg-info">
    <thead>
      <tr class="active">
        <th>Player</th>
        <th>Runs</th>
        <th>Balls</th>
        <th>Strike Rate</th>
      </tr>
    </thead>
    <tbody>
     
      <%
      while(rs9.next())
 {
      player_name11=rs9.getString("player");
      System.out.println(player_name11);
	 runs11 = rs9.getInt("runs");
	 System.out.println(runs11);
	 balls11= rs9.getInt("balls");
	 System.out.println(balls11);
	 strike_rate11= rs9.getFloat("strike_rate");
	 System.out.println(strike_rate11);
	 flag11 = rs9.getInt("flag_status");
	 
	%> <tr>
	 <td>
	 <%=player_name11 %>
	 <%
	 if(flag11 == 1)
		 out.print("*");
	 %>
	 </td>
     <td><%=runs11 %></td>
     <td><%=balls11 %></td>
     <td><%= strike_rate11%></td>
     </tr>
	 <%
 }
        %>
    </tbody>
  </table>
</div>

<div class="container">
  <h2>Bowlers</h2>
  <table class="table table-hover bg-info">
    <thead>
      <tr class="active">
        <th>Player</th>
        <th>Overs</th>
        <th>Runs</th>
        <th>Wickets</th>
      </tr>
    </thead>
    <tbody>
     
      <%
      
      String Bowler_name11=null;
      float Bowler_overs11=0f;
      int Bowler_runs11=0;
      int Bowler_wicket11=0;
      while(rs10.next())
 {
      Bowler_name11=rs10.getString("player");
      System.out.println(Bowler_name11);
	 Bowler_overs11 = rs10.getFloat("overs");
	 System.out.println(Bowler_overs11);
	 Bowler_runs11= rs10.getInt("runs");
	 System.out.println( Bowler_runs11);
	 Bowler_wicket11= rs10.getInt("wicket");
	 System.out.println( Bowler_wicket11);
	 
	%> <tr>
	 <td><%=Bowler_name11 %></td>
     <td><%=Bowler_overs11 %></td>
     <td><%=Bowler_runs11 %></td>
     <td><%= Bowler_wicket11%></td>
     </tr>
	 <%
 }
        %>
    </tbody>
  </table>
</div>
 
 
 


<%

} catch (Exception e) {
e.printStackTrace();
}
 
 }catch (Exception e) {
	 e.printStackTrace();
 }finally{
	 co.getCloseConnection();
 }
%>
<a href="${pageContext.request.contextPath}/viewScorecard">Live Score</a>
</body>
</html>