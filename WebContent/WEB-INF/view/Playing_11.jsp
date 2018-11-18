<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.saurabh.demo.databaseconnection.*" %>

<html>
<meta charset="ISO-8859-1">
<title>Players</title>
<body>

<h2 align="center">Team Players</h2>
<%

String team1=request.getParameter("team1");
String team2=request.getParameter("team2");
String team=request.getParameter("team");

int check=0;
if(team.equals(team1))
{
	check=1;
}

if(team.equals(team2))
{
	check=1;
}

if(check==0)
{
	%><jsp:forward page="matches.jsp"></jsp:forward>
	<%
}

if(team1.equals(team2)){
	%><jsp:forward page="matches.jsp"></jsp:forward>
<%
}
else{

//String url = "jdbc:mysql://localhost:3306/cricket";
//String username="root";
//String password = "9534598529";
String sql = "select * from ";
try {
//Class.forName("com.mysql.jdbc.Driver");
//Connection co = DriverManager.getConnection(url, username, password);
DatabaseConnection co = new DatabaseConnection();
Statement st1 = co.getConnection();
Statement st2 = co.getConnection();
Statement st3 = co.getConnection();
Statement st4 = co.getConnection();
//ResultSet rs1 = st1.executeQuery(sql+team1);
//ResultSet rs2 = st2.executeQuery(sql+team2);
if(team1.equals(team)){
	int i = st3.executeUpdate("insert into first_to_bat value('"+team1+"',1)");
	int j = st4.executeUpdate("insert into first_to_bat value('"+team2+"',0)");
	ResultSet rs1 = st1.executeQuery(sql+team1);
	ResultSet rs2 = st2.executeQuery(sql+team2);
	%>
	<h3><%= team1 %></h3>
	<FORM TYPE=POST ACTION="${pageContext.request.contextPath}/scorecard">
	<%

	while(rs1.next()){
	%>

	<input TYPE=checkbox name=teamPlayers1 VALUE=<%= rs1.getString("player_name") %>><%= rs1.getString("player_name") %> <BR>
	<% 
	}
	%>

	<h3><%= team2 %></h3>
	<%

	while(rs2.next()){
	%>
	<input TYPE=checkbox name=teamPlayers2 VALUE=<%= rs2.getString("player_name") %>><%= rs2.getString("player_name") %> <BR>
	<% 
	}
	%>
	<br> <INPUT TYPE=submit name=submit Value="Submit">
	</FORM>
	<%
}
else{
	int i = st3.executeUpdate("insert into first_to_bat value('"+team2+"',1)");
	int j = st4.executeUpdate("insert into first_to_bat value('"+team1+"',0)");
	
	ResultSet rs1 = st1.executeQuery(sql+team1);
	ResultSet rs2 = st2.executeQuery(sql+team2);
	%>
	<h3><%= team2 %></h3>
	<FORM TYPE=POST ACTION="${pageContext.request.contextPath}/scorecard">
	<%

	while(rs2.next()){
	%>

	<input TYPE=checkbox name=teamPlayers1 VALUE=<%= rs2.getString("player_name") %>><%= rs2.getString("player_name") %> <BR>
	<% 
	}
	%>

	<h3><%= team1 %></h3>
	<%

	while(rs1.next()){
	%>
	<input TYPE=checkbox name=teamPlayers2 VALUE=<%= rs1.getString("player_name") %>><%= rs1.getString("player_name") %> <BR>
	<% 
	}
	%>
	<br> <INPUT TYPE=submit name=submit Value="Submit">
	</FORM>
	<%
}

co.getCloseConnection();
} catch (Exception e) {
e.printStackTrace();
}

}
%>
</body>
</html>