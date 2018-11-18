<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="com.saurabh.demo.databaseconnection.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Scoreboard</title>
</head>
<body>
<%
String run= request.getParameter("run");
System.out.println(run);
String extra= request.getParameter("Extra");
System.out.println(extra);
//String extras= request.getParameter("Extras");
//System.out.println(extras);
String hit= request.getParameter("hit");
System.out.println("hit "+hit);
String out_type= request.getParameter("out_type");
System.out.println(out_type);
int runs=0;
if(run!=null)
	runs = Integer.parseInt(run);
//System.out.println("runs "+runs);

int extra_wide_noball=0;
if(extra!=null)
	extra_wide_noball= Integer.parseInt(extra);
//System.out.println("extra "+extra_wide_noball);

//int extra_any = Integer.parseInt(extras);



%>

<% 
//connection with database
//String url = "jdbc:mysql://localhost:3306/cricket";
//String username="root";
//String password = "9534598529";

try {
//Class.forName("com.mysql.jdbc.Driver");
//Connection co = DriverManager.getConnection(url, username, password);
DatabaseConnection co = new DatabaseConnection();
Statement st1 = co.getConnection();
Statement st2 = co.getConnection();
Statement st5 = co.getConnection();


ResultSet rs1 = st1.executeQuery("select * from score_display");
ResultSet rs2 = st2.executeQuery("select * from batting_team1 where flag_status=1");
ResultSet rs3 = st5.executeQuery("select * from bowling_team2 where flag_status=1");

int dbruns=0;
int dbwickets=0;
float dbovers=00.0f;
while(rs1.next()){
	  dbruns = rs1.getInt("totalruns");
	  dbwickets = rs1.getInt("wicket");
	  dbovers = rs1.getFloat("overs");
		System.out.println("wickets- :"+dbwickets);

}
int batsman_run=0;
int batsman_balls=0;
while(rs2.next()){
batsman_run = rs2.getInt("runs");
batsman_balls=rs2.getInt("balls");
}
float overs=00.0f;
int bowler_run=0;
int wickets=0;
while(rs3.next()){
	overs=rs3.getFloat("overs");
	bowler_run = rs3.getInt("runs");
	wickets = rs3.getInt("wicket");
	System.out.println("wickets-- :"+wickets);
}
//System.out.println("hit2 "+hit);
if(out_type==null){
	//case - 1 : simple run by batsman
	if((extra==null||extra_wide_noball==0)&&(hit.equals("1"))){
		System.out.println("inside case1");
		//updating batsman runs
		batsman_run=batsman_run+runs;
		//updating batsman balls
		batsman_balls=batsman_balls+1;
		//updating bowler runs
		bowler_run=bowler_run+runs;
		//updating team runs
		dbruns=dbruns+runs;
		//updating over
		overs=overs+00.1f;
		dbovers=dbovers+00.1f;
		String strOver =Float.toString(overs);
		if(strOver.endsWith(".6")){
			overs=overs+00.4f;
			dbovers=dbovers+00.4f;
		}
		//strike rate updating
		float strikeRate=0f;
		if(batsman_balls!=0){
		strikeRate = (float)((batsman_run * 1.0)/(batsman_balls * 1.0)) * 100;
		}
		System.out.println("batsman_run : "+batsman_run);
		System.out.println("batsman_balls : "+batsman_balls);
		System.out.println("strikeRate : "+strikeRate);
		//updating database
		Statement st3 = co.getConnection();
		Statement st4 = co.getConnection();
		Statement st6 = co.getConnection();
		Statement st7 = co.getConnection();
		Statement st8 = co.getConnection();
		Statement st9 = co.getConnection();
		Statement st10 = co.getConnection();
		int i = st3.executeUpdate("update batting_team1 set runs='"+batsman_run+"' where flag_status=1");
		int ii = st8.executeUpdate("update batting_team1 set balls='"+batsman_balls+"' where flag_status=1");
		int o = st10.executeUpdate("update batting_team1 set strike_rate='"+strikeRate+"' where flag_status=1");
		int j = st4.executeUpdate("update score_display set totalruns='"+dbruns+"'");
		int k = st6.executeUpdate("update score_display set overs='"+dbovers+"'");
		int m = st7.executeUpdate("update bowling_team2 set overs='"+overs+"' where flag_status=1");
		int mm = st9.executeUpdate("update bowling_team2 set runs='"+bowler_run+"' where flag_status=1");

	}

	//case-2 : no ball but hit by batsman
	else if(extra_wide_noball==1&&(hit.equals("1"))){
		System.out.println("inside case2");
		//updating batsman runs
		batsman_run=batsman_run+runs;
		//updating team runs
		dbruns=dbruns+runs+1;
		//updating bowler runs
		bowler_run=bowler_run+runs+1;
		//strike rate
		float strikeRate=0f;
		if(batsman_balls!=0){
		strikeRate = (float)((batsman_run * 1.0)/(batsman_balls * 1.0)) * 100;
		}
		//updating database
		Statement st3 = co.getConnection();
		Statement st4 = co.getConnection();
		Statement st6 = co.getConnection();
		Statement st10 = co.getConnection();
		int i = st3.executeUpdate("update batting_team1 set runs='"+batsman_run+"' where flag_status=1");
		int j = st4.executeUpdate("update score_display set totalruns='"+dbruns+"'");
		int o = st10.executeUpdate("update batting_team1 set strike_rate='"+strikeRate+"' where flag_status=1");
		int mm = st6.executeUpdate("update bowling_team2 set runs='"+bowler_run+"' where flag_status=1");
	}
	//case-3 : no ball or wide ball but no hit by batsman
	else if(extra_wide_noball==1&&(hit.equals("0"))){
		System.out.println("inside case3");
		//updating batsman runs
		//batsman_run=batsman_run+runs;
		//updating team runs
		dbruns=dbruns+runs+1;
		//updating bowler runs
		bowler_run=bowler_run+runs+1;
		//updating database
		Statement st3 = co.getConnection();
		Statement st4 = co.getConnection();
		//int i = st3.executeUpdate("update batting_team1 set runs='"+batsman_run+"' where flag_status=1");
		int j = st4.executeUpdate("update score_display set totalruns='"+dbruns+"'");
		int mm = st3.executeUpdate("update bowling_team2 set runs='"+bowler_run+"' where flag_status=1");
	}
	//case-4 : no hit by batsman and no wide or no ball
	else if((extra_wide_noball==0||extra==null)&&(hit.equals("0"))){
		System.out.println("inside case4");
		//updating batsman runs
		//batsman_run=batsman_run+runs;
		//updating team runs
		dbruns=dbruns+runs;
		//updating batsman balls
		batsman_balls=batsman_balls+1;
		//updating bowler runs
		bowler_run=bowler_run+runs;
		//strike rate
		float strikeRate=0f;
		if(batsman_balls!=0){
		strikeRate = (float)((batsman_run * 1.0)/(batsman_balls * 1.0)) * 100;
		}
		//updating over
		overs=overs+00.1f;
		dbovers=dbovers+00.1f;
		String strOver =Float.toString(overs);
		if(strOver.endsWith(".6")){
			overs=overs+00.4f;
			dbovers=dbovers+00.4f;
		}
		//updating database
		//Statement st3 = co.createStatement();
		Statement st4 = co.getConnection();
		Statement st6 = co.getConnection();
		Statement st7 = co.getConnection();
		Statement st8 = co.getConnection();
		Statement st9 = co.getConnection();
		Statement st10 = co.getConnection();
		//int i = st3.executeUpdate("update batting_team1 set runs='"+batsman_run+"' where flag_status=1");
		int j = st4.executeUpdate("update score_display set totalruns='"+dbruns+"'");
		int ii = st8.executeUpdate("update batting_team1 set balls='"+batsman_balls+"' where flag_status=1");
		int k = st6.executeUpdate("update score_display set overs='"+dbovers+"'");
		int o = st10.executeUpdate("update batting_team1 set strike_rate='"+strikeRate+"' where flag_status=1");
		int m = st7.executeUpdate("update bowling_team2 set overs='"+overs+"' where flag_status=1");
		int mm = st9.executeUpdate("update bowling_team2 set runs='"+bowler_run+"' where flag_status=1");

	}
}
else{
	//case-5 : batsman out
	if(out_type.equals("1")){
		System.out.println("inside case5");
		//updating bowler wicket
		wickets++;
		//updating team wickets
		dbwickets++;
		//updating batsman balls
		batsman_balls=batsman_balls+1;
		//updating bowler runs
		//bowler_run=bowler_run+runs;
		//strike rate
		float strikeRate=0f;
		if(batsman_balls!=0){
		strikeRate = (float)((batsman_run * 1.0)/(batsman_balls * 1.0)) * 100;
		}
		//updating over
		overs=overs+00.1f;
		dbovers=dbovers+00.1f;
		String strOver =Float.toString(overs);
		if(strOver.endsWith(".6")){
			overs=overs+00.4f;
			dbovers=dbovers+00.4f;
		}
		//updating database
		Statement st3 = co.getConnection();
		Statement st4 = co.getConnection();
		Statement st6 = co.getConnection();
		Statement st7 = co.getConnection();
		Statement st8 = co.getConnection();
		Statement st9 = co.getConnection();
		Statement st10 = co.getConnection();
		Statement st11 = co.getConnection();
		int i = st3.executeUpdate("update bowling_team2 set wicket='"+wickets+"' where flag_status=1");
		int j = st4.executeUpdate("update score_display set wicket='"+dbwickets+"'");
		int ii = st9.executeUpdate("update batting_team1 set balls='"+batsman_balls+"' where flag_status=1");
		int n = st7.executeUpdate("update score_display set overs='"+dbovers+"'");
		int o = st10.executeUpdate("update batting_team1 set strike_rate='"+strikeRate+"' where flag_status=1");
		int m = st8.executeUpdate("update bowling_team2 set overs='"+overs+"' where flag_status=1");
		//int mm = st10.executeUpdate("update bowling_team2 set runs='"+bowler_run+"' where flag_status=1");
		int k = st6.executeUpdate("update batting_team1 set flag_status=0 where flag_status=1");

	}
	//case-6 : batsman run out
	else if(out_type.equals("0")){
		String runout_player = request.getParameter("runout");
		System.out.println("inside case6");
		
		//batsman hit and no wide or no noball
		if((hit.equals("1"))&&extra_wide_noball==0){
				System.out.println("inside case6 part1");
				//updating team wickets
				dbwickets++;
				//updating batsman runs
				batsman_run=batsman_run+runs;
				//updating team runs
				dbruns=dbruns+runs;
				//updating batsman balls
				batsman_balls=batsman_balls+1;
				//updating bowler runs
				bowler_run=bowler_run+runs;
				//strike rate
				float strikeRate=0f;
				if(batsman_balls!=0){
				strikeRate = (float)((batsman_run * 1.0)/(batsman_balls * 1.0)) * 100;
				}
				//updating over
				overs=overs+00.1f;
				dbovers=dbovers+00.1f;
				String strOver =Float.toString(overs);
				if(strOver.endsWith(".6")){
					overs=overs+00.4f;
					dbovers=dbovers+00.4f;
				}
				//updating database
				Statement st3 = co.getConnection();
				Statement st4 = co.getConnection();
				Statement st6 = co.getConnection();
				Statement st7 = co.getConnection();
				Statement st8 = co.getConnection();
				Statement st9 = co.getConnection();
				Statement st11 = co.getConnection();
				Statement st10 = co.getConnection();
				Statement st12 = co.getConnection();
				//updating database
				int j = st3.executeUpdate("update score_display set wicket='"+dbwickets+"'");
				int i = st4.executeUpdate("update batting_team1 set runs='"+batsman_run+"' where flag_status=1");
				int ii = st9.executeUpdate("update batting_team1 set balls='"+batsman_balls+"' where flag_status=1");
				int k = st6.executeUpdate("update score_display set totalruns='"+dbruns+"'");
				int n = st7.executeUpdate("update score_display set overs='"+dbovers+"'");
				int o = st12.executeUpdate("update batting_team1 set strike_rate='"+strikeRate+"' where flag_status=1");
				int oo = st8.executeUpdate("update bowling_team2 set overs='"+overs+"' where flag_status=1");
				int mm = st10.executeUpdate("update bowling_team2 set runs='"+bowler_run+"' where flag_status=1");
				int m = st7.executeUpdate("update batting_team1 set flag_status=0 where player='"+runout_player+"'");

		}
		//batsman hit and noball
		else if((hit.equals("1"))&&extra_wide_noball==1){
				System.out.println("inside case6 part2");
				//updating team wickets
				dbwickets++;
				//updating batsman runs
				batsman_run=batsman_run+runs;
				//updating team runs
				dbruns=dbruns+runs+1;
				//updating bowler runs
				bowler_run=bowler_run+runs+1;
				//strike rate
				float strikeRate=0f;
				if(batsman_balls!=0){
				strikeRate = (float)((batsman_run * 1.0)/(batsman_balls * 1.0)) * 100;
				}
				//updating database
				Statement st3 = co.getConnection();
				Statement st4 = co.getConnection();
				Statement st6 = co.getConnection();
				Statement st7 = co.getConnection();
				Statement st8 = co.getConnection();
				Statement st12 = co.getConnection();
				//updating database
				int j = st3.executeUpdate("update score_display set wicket='"+dbwickets+"'");
				int i = st4.executeUpdate("update batting_team1 set runs='"+batsman_run+"' where flag_status=1");
				int k = st6.executeUpdate("update score_display set totalruns='"+dbruns+"'");
				int o = st12.executeUpdate("update batting_team1 set strike_rate='"+strikeRate+"' where flag_status=1");
				int mm = st8.executeUpdate("update bowling_team2 set runs='"+bowler_run+"' where flag_status=1");
				int m = st7.executeUpdate("update batting_team1 set flag_status=0 where player='"+runout_player+"'");

		}
		//batsman didn't hit and no wide or no noball
		else if((hit.equals("0"))&&extra_wide_noball==0){
				System.out.println("inside case6 part3");
				//updating team wickets
				dbwickets++;
				//updating batsman runs
				//batsman_run=batsman_run+runs;
				//updating team runs
				dbruns=dbruns+runs;
				//updating batsman balls
				batsman_balls=batsman_balls+1;
				//updating bowler runs
				bowler_run=bowler_run+runs;
				//strike rate
				float strikeRate=0f;
				if(batsman_balls!=0){
				strikeRate = (float)((batsman_run * 1.0)/(batsman_balls * 1.0)) * 100;
				}
				//updating over
				overs=overs+00.1f;
				dbovers=dbovers+00.1f;
				String strOver =Float.toString(overs);
				if(strOver.endsWith(".6")){
					overs=overs+00.4f;
					dbovers=dbovers+00.4f;
				}
				//updating database
				Statement st3 = co.getConnection();
				Statement st4 = co.getConnection();
				Statement st6 = co.getConnection();
				Statement st7 = co.getConnection();
				Statement st8 = co.getConnection();
				Statement st9 = co.getConnection();
				Statement st11 = co.getConnection();
				Statement st10 = co.getConnection();
				Statement st12 = co.getConnection();
				//updating database
				int j = st3.executeUpdate("update score_display set wicket='"+dbwickets+"'");
				//int i = st3.executeUpdate("update batting_team1 set runs='"+batsman_run+"' where flag_status=1");
				int k = st4.executeUpdate("update score_display set totalruns='"+dbruns+"'");
				int oo = st12.executeUpdate("update batting_team1 set strike_rate='"+strikeRate+"' where flag_status=1");
				int mm = st10.executeUpdate("update bowling_team2 set runs='"+bowler_run+"' where flag_status=1");
				int ii = st9.executeUpdate("update batting_team1 set balls='"+batsman_balls+"' where flag_status=1");
				int n = st11.executeUpdate("update score_display set overs='"+dbovers+"'");
				int o = st8.executeUpdate("update bowling_team2 set overs='"+overs+"' where flag_status=1");
				int m = st7.executeUpdate("update batting_team1 set flag_status=0 where player='"+runout_player+"'");

		}
		//batsman didn't hit and wide or noball
		else if((hit.equals("0"))&&extra_wide_noball==1){
				System.out.println("inside case6 part4");
				//updating team wickets
				dbwickets++;
				//updating batsman runs
				//batsman_run=batsman_run+runs;
				//updating team runs
				dbruns=dbruns+runs+1;
				//updating bowler runs
				bowler_run=bowler_run+runs;
				//updating database
				Statement st3 = co.getConnection();
				Statement st4 = co.getConnection();
				Statement st6 = co.getConnection();
				Statement st7 = co.getConnection();
				//updating database
				int j = st3.executeUpdate("update score_display set wicket='"+dbwickets+"'");
				//int i = st3.executeUpdate("update batting_team1 set runs='"+batsman_run+"' where flag_status=1");
				int k = st4.executeUpdate("update score_display set totalruns='"+dbruns+"'");
				int mm = st7.executeUpdate("update bowling_team2 set runs='"+bowler_run+"' where flag_status=1");
				int m = st6.executeUpdate("update batting_team1 set flag_status=0 where player='"+runout_player+"'");
		}
	}
}

    
 
      
co.getCloseConnection();
} catch(Exception e){
	e.printStackTrace();
}
%>

<jsp:forward page="updateForm.jsp"></jsp:forward>
</body>
</html>