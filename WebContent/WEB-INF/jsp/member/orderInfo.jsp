<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.*" %>
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
<div class="row">
<h2 >Order Information</h2>
</div>
<div class="row">
<Table style="width:100%;">
	<tr>
		<td style="background-color:#fcf0b3;width:20%">Order Number</td>
		<td>${param.id}</td>
	</tr>
	<tr>
		<td style="background-color:#fcf0b3;">Recipient</td>
		<td><c:out value="${Recipient }"></c:out></td>
	</tr>
	<tr>
		<td style="background-color:#fcf0b3;">Phone</td>
		<td><c:out value="${Phone }"></c:out></td>
	</tr>
	<tr>
		<td style="background-color:#fcf0b3;">Shipping Address</td>
		<td><c:out value="${ShippingAddress }"></c:out></td>
	</tr>
	<tr>
		<td style="background-color:#fcf0b3;">Total Amount</td>
		<td><c:out value="${TotalAmount}"></c:out></td>
	</tr>
</Table>
<Table>
	<tr>
		<th>No.</th>
		<th>Item Name </th>
		<th>Price</th>
		<th>Quantity</th>
	</tr>
	<c:forEach items="${detailList}" var="detail">
		<tr>
			<% request.setAttribute("productDAO", new ProductDAO());//設定給EL 取得產品名稱 %>
			<td><c:out value="${detail.getId() }"></c:out></td>
			<td><c:out value="${productDAO.getProduct(detail.getProductId()).getName()}"></c:out></td>
			<td><c:out value="${detail.getPrice() }"></c:out></td>
			<td><c:out value="${detail.getAmount() }"></c:out></td>
		</tr>
	</c:forEach>
</Table>
</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>