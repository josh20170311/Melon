<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link 
	rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
	crossorigin="anonymous"> 
<script type="text/javascript" src="js/utils.js"></script>
	
</head>
<body>
	<script>
			alertMessage("${message}");
	</script>
<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>
	
	<%--導覽bar_開始 --%>
	<%@ include file="header.jsp"%>
	<%--導覽bar_結束 --%>
	
	<div class="signup-header">
	 	<h2>Login to Melon</h2>
	</div>

	 <form method="post" action="Home">
	 
	 <input type="hidden" name="page" value="login-form">
	 
	 	<!-- Validations errors -->
	 	<font color="#F24638"><c:out value="${msg }"></c:out></font>
	 
	 	<div class="signup-group">
	 		<label>Member ID</label>
	 		<input type="text" name="id" placeholder="Your Member ID" value="<c:out value="${id }" ></c:out>"  required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Password</label>
	 		<input type="password" name="password" placeholder="Enter password" required>
	 	</div>
	 	<div class="signup-group">
	 		<button type="submit" name="login" class="signup-btn">Log in</button>
	 	</div>
	 	<p>
	 		New Friend? <a href="Home?page=sign-up" style="color:#F24638;">Create Account</a>
	 	</p>
	 </form>
	<br><br><br>
	

<%@ include file="footer.jsp" %>


</body>
</html>