<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>
<link 
	rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
	crossorigin="anonymous"> 
	
<link rel="stylesheet" type="text/css" href="css/style.css"></head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
<Table>
	<tr>
		<th>Order ID</th>
		<th>Date </th>
		<th>Total</th>
		<th>Detail</th>
	</tr>
	<c:forEach items="${orderlist}" var="order">
		<tr>
			<td><c:out value="${order.getId() }"></c:out></td>
			<td><c:out value="${order.getDate() }"></c:out></td>
			<td><c:out value="${order.getTotalPrice() }"></c:out></td>
			<td><a href="OrderInformation?id=${order.getId()}" class="btb btn-primary">Open</a></td>
		</tr>
	</c:forEach>
</Table>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>