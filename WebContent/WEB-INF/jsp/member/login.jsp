<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link 
	rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
	crossorigin="anonymous"> 
</head>
<body>

<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>

<header>
		<h1>
			Melon
		</h1>
		<nav>
			<ul>
				<li><a href="Home?page=index">Home</a></li>
				<c:choose>
					<c:when test="${session == null}">
						<li><a href="Home?page=login">Login</a></li>
						<li><a href="Home?page=sign-up">Sign-up</a></li>
					</c:when>
					<c:when test="${session != null}">
						<li><a href="Home?page=logout" style="color: #F24638;">Logout</a></li>
						<li><a href="#">My Account</a></li>
					</c:when>
				</c:choose>
				<li><a href="Home?page=showcart">cart(<c:out value="${x}"/>)</a></li>
			</ul>
		</nav>
	</header>

	<div class="signup-header">
	 	<h2>Login to <mark>Melon</mark></h2>
	</div>

	 <form method="post" action="Home">
	 
	 <input type="hidden" name="page" value="login-form">
	 
	 	<!-- Validations errors -->
	 	<font color="#F24638"><c:out value="${msg }"></c:out></font>
	 
	 	<div class="signup-group">
	 		<label>Username</label>
	 		<input type="text" name="username" placeholder="Your Username" value="<c:out value="${username }"></c:out>">
	 	</div>
	 	<div class="signup-group">
	 		<label>Password</label>
	 		<input type="password" name="password" placeholder="Enter password">
	 	</div>
	 	<div class="signup-group">
	 		<button type="submit" name="login" class="signup-btn">Log in</button>
	 	</div>
	 	<p>
	 		New Friend? <a href="Home?page=sign-up" style="color:#F24638;">Create Account</a>
	 	</p>
	 </form>
	<br><br><br>
	<footer style="position: fixed;bottom: 0;left: 0;width: 100%;">
		<div class="footer">
	      <a href="Home?page=index"> Melon</a>
	    </div>
	</footer>


</body>
</html>