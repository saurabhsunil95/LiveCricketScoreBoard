<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>
<body>
<center>
<h2 align="center">Admin Login</h2>

<form action="${pageContext.request.contextPath}/admin_login_forward">

		<label for="name">Username</label>
		<input type="text" name="email" required="true">
		<br><br>
		<label for="name">Password</label>
		<input type="password" name="password" required="true">
		<br><br>
		<input type="submit" name="submit" value="Login" >
</form>

<a href="${pageContext.request.contextPath}/viewScorecard">ScoreBoard</a>
</center>
</body>
</html> 