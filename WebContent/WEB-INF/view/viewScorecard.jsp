<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
    <%@page import="com.saurabh.demo.databaseconnection.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Scorecard</title>
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

<div class="container">
<h1 align="center"><%=TeamName.toUpperCase() %> V/S <%=TeamName2.toUpperCase() %>
<h3><%= TeamName.toUpperCase()
%></h3>
Score : <%=total_score %>/<%=wickets%>
<br>
Overs : <%=overs %>
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
      while(rs2.next())
 {
      player_name=rs2.getString("player");
      System.out.println(player_name);
	 runs = rs2.getInt("runs");
	 System.out.println(runs);
	 balls= rs2.getInt("balls");
	 System.out.println(balls);
	 strike_rate= rs2.getFloat("strike_rate");
	 System.out.println(strike_rate);
	 flag = rs2.getInt("flag_status");
	 
	%> <tr>
	 <td>
	 <%=player_name %>
	 <%
	 if(flag == 1)
		 out.print("*");
	 %>
	 </td>
     <td><%=runs %></td>
     <td><%=balls %></td>
     <td><%= strike_rate%></td>
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
      
      String Bowler_name=null;
      float Bowler_overs=0f;
      int Bowler_runs=0;
      int Bowler_wicket=0;
      while(rs3.next())
 {
      Bowler_name=rs3.getString("player");
      System.out.println(Bowler_name);
	 Bowler_overs = rs3.getFloat("overs");
	 System.out.println(Bowler_overs);
	 Bowler_runs= rs3.getInt("runs");
	 System.out.println( Bowler_wicket);
	 Bowler_wicket= rs3.getInt("wicket");
	 System.out.println( Bowler_wicket);
	 
	%> <tr>
	 <td><%=Bowler_name %></td>
     <td><%=Bowler_overs %></td>
     <td><%=Bowler_runs %></td>
     <td><%= Bowler_wicket%></td>
     </tr>
	 <%
 }
        %>
    </tbody>
  </table>
</div>
<% 
}catch (Exception e) {
	 e.printStackTrace();
 }finally{
	 co.getCloseConnection();
 }
%>
<a href="${pageContext.request.contextPath}/FullScoreboard">Full Scoreboard</a>
</body>
</html>