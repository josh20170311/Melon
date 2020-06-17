<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up page</title>

<link 
	rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
	crossorigin="anonymous"> 
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>
	
	<%--導覽bar_開始 --%>
	<%@ include file="header.jsp"%>
	<%--導覽bar_結束 --%>
	
	<div class="signup-header">
	 	<h2>Signup with Melon</h2>
	 </div>

	 <form method="post" action="Home">
	 
	 <input type="hidden" name="page" value="sign-up-form">
	 
	 	<!-- Validations errors -->
	 	<font color="#F24638"><c:out value="${msg }"></c:out></font>
	 	
	 	<div class="signup-group">
	 		<label>Member ID</label>
	 		<input type="text" name="id" placeholder="member id" value="<c:out value="${id}"></c:out>" required>
	 	</div>
	 	
	 	
	 	<div class="signup-group">
	 		<label>Name</label>
	 		<input type="text" name="name" placeholder="Name goes here" value="<c:out value="${name }"></c:out>" required>
	 	</div>
	 	
	 	
	 	<div class="signup-group">
	 		<label>Gender</label>
	 		<!-- input type="text" name="gender" placeholder="Your Gender (male/female)" value="<c:out value="${gender }"></c:out>" required-->
	 		<select name="gender" >
	 			<option value="male">Male</option>
	 			<option value="female">Female</option>
	 		</select>
	 	</div>
	 	
	 	
	 	<div class="signup-group">
	 		<label>Address</label>
	 		<input type="text" name="address" placeholder="Your address goes here" value="<c:out value="${address }"></c:out>" required>
	 	</div>
	 	
	 	
	 	<div class="signup-group">
	 		<label>Phone</label>
	 		<input type="text" name="phone" placeholder="Your phone number goes here" value="<c:out value="${phone }"></c:out>" required>
	 	</div>
	 	
	 	
	 	<div class="signup-group">
	 		<label>Email</label>
	 		<input type="email" name="email" placeholder="Your email address" value="<c:out value="${email }"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Password</label>
	 		<input type="password" name="password_1" placeholder="Enter password" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Confirm Passowrd</label>
	 		<input type="password" name="password_2" placeholder="Re-enter password" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<button type="submit" name="register" class="signup-btn">Register</button>
	 	</div>
	 	<p>
	 		Already have an account? <a href="Home?page=login" style="color:#F24638;">Login!</a>
	 	</p>
	 </form>
	<br><br><br>
	
<%@ include file="footer.jsp" %>
</body>
</html>