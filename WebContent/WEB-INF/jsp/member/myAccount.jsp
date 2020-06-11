<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Account</title>
<link 
	rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
	crossorigin="anonymous"> 
	
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/utils.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-md-2">
			<div style="margin-top: 30px;margin-bottom: 30px;">
				<a href="MyOrders" class="btn btn-info">My Orders</a>
			</div>
		</div>
		<div class="col-md-10">
			<table>	
				<caption style="text-align:center;font-size:48px">my profile</caption>
				<tr><td width="20%">id:</td><td><c:out value="${member.getId()}"></c:out></td></tr>
				<tr><td>name:</td><td><c:out value="${member.getName()}"></c:out></td></tr>
				<tr><td>email:</td><td><c:out value="${member.getEmail()}"></c:out></td></tr>
				<tr><td>address:</td><td><c:out value="${member.getAddress()}"></c:out></td></tr>
				<tr><td>phone number</td><td><c:out value="${member.getPhone()}"></c:out></td></tr>
			</table>
		</div>
	</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>