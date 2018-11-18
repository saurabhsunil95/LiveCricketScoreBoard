<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin_login_forward</title>
</head>
<body>
<%
String uname = request.getParameter("email");
String pass = request.getParameter("password");
String sql = "select * from login where user=? and password=?";
String url = "jdbc:mysql://localhost:3306/cricket";
String username="root";
String password = "9534598529";
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection co = DriverManager.getConnection(url, username, password);
	PreparedStatement st = co.prepareStatement(sql);
	st.setString(1, uname);
	st.setString(2, pass);
	ResultSet rs = st.executeQuery();
	if(rs.next()) {
		%>
		<jsp:forward page="matches.jsp"
		 />
		<%
	
	}
	else{
		%>
		<jsp:forward page="index.jsp" />
		<%
	
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>