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
Statement st1 = co.getConnection();
Statement st2 = co.getConnection();
Statement st3 = co.getConnection();
Statement st4 = co.getConnection();
Statement st5 = co.getConnection();
Statement st6 = co.getConnection();
Statement st7 = co.getConnection();
Statement st8 = co.getConnection();
Statement st9 = co.getConnection();
Statement st10 = co.getConnection();
Statement st11 = co.getConnection();
Statement st12 = co.getConnection();
Statement st13 = co.getConnection();


System.out.println("check111111");
ResultSet rs1 = st1.executeQuery("select team_name from first_to_bat where flag_status=1");
String batting_team_name=null;
while(rs1.next()){
	batting_team_name=rs1.getString("team_name");
}
System.out.println("check2");

ResultSet rs2 = st1.executeQuery("select team_name from first_to_bat where flag_status=0");
String bowling_team_name=null;
while(rs2.next()){
	bowling_team_name=rs2.getString("team_name");
}
System.out.println("check3");

String tablename1 = batting_team_name+"vs"+bowling_team_name+"batting"+batting_team_name;
String tablename2 = batting_team_name+"vs"+bowling_team_name+"bowling"+bowling_team_name;

try{
	int i = stmt.executeUpdate("create table `'"+tablename1+"'`(player varchar(30),runs int,balls int,flag_status int,strike_rate float(5,2))");
	System.out.println("check3");


	int ii = stmt1.executeUpdate("create table `'"+tablename2+"'`(player varchar(30),overs float(2,1),runs int,wicket int,flag_status int)");
}catch(Exception e){
	e.printStackTrace();
}

String score_display_matches_name = batting_team_name+"vs"+bowling_team_name+"score"+batting_team_name;

System.out.println("check5");

int iii = stmt2.executeUpdate("insert into score_display_status(matches_name) value('"+score_display_matches_name+"')");
System.out.println("check6");

int j = st4.executeUpdate("update first_to_bat set flag_status=0 where team_name='"+batting_team_name+"'");
int k = st5.executeUpdate("update first_to_bat set flag_status=1 where team_name='"+bowling_team_name+"'");

System.out.println("check7");

int m = st6.executeUpdate("insert into `'"+tablename1+"'` select * from batting_team1");

System.out.println("check8");

int mm = st7.executeUpdate("insert into `'"+tablename2+"'` select * from bowling_team2");

System.out.println("check9");

int n = st8.executeUpdate("update score_display_status set totalruns=(select totalruns from score_display),wicket=(select wicket from score_display),overs=(select overs from score_display) where matches_name='"+score_display_matches_name+"'");

System.out.println("check10");

int t = st9.executeUpdate("truncate batting_team1");
int tt = st10.executeUpdate("truncate bowling_team2");
int ttt = st11.executeUpdate("truncate score_display");
int u = st12.executeUpdate("insert into score_display value(0,0,0)");
%>
<jsp:forward page="updateForm.jsp"></jsp:forward>
<%
co.getCloseConnection();
} catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>