<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

	<div class="signup-header">
	 	<h2> <mark>Admin</mark> Login</h2>
	</div>

<form method="post" action="j_security_check">
	 
	 <input type="hidden" name="page" value="admin-login-form">
	 
	 	<!-- Validations errors -->
	 	<font color="#F24638"><c:out value="${msg }"></c:out></font>
	 
	 	<div class="signup-group">
	 		<label>Username</label>
	 		<input type="text" name="j_username" placeholder="Your Username" value="<c:out value="${username }"></c:out>">
	 	</div>
	 	<div class="signup-group">
	 		<label>Password</label>
	 		<input type="password" name="j_password" placeholder="Enter password">
	 	</div>
	 	<div class="signup-group">
	 		<button type="submit" name="login" class="signup-btn">Log in</button>
	 	</div>
	 </form>
</body>
</html>