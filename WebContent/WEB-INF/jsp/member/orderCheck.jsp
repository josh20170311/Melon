<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>
<link rel="stylesheet" 
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
crossorigin="anonymous">

	
<link rel="stylesheet" type="text/css" href="css/style.css"></head>
<body>
<%@ include file="header.jsp" %>

<div class="container">
<div class="row justify-content-center" style="width:100%;margin-left:0px;margin-right:0px">
	<h2>Order Information</h2>
</div>
<div class="row">
<c:set var="total" value="0"></c:set>

<Table style="width:100%;">
	
	<tr>
		<td style="background-color:#fcf0b3;width:20%">Recipient</td>
		<td><c:out value="${member.getName() }"></c:out></td>
	</tr>
	<tr>
		<td style="background-color:#fcf0b3;">Phone</td>
		<td><c:out value="${member.getPhone() }"></c:out></td>
	</tr>
	<tr>
		<td style="background-color:#fcf0b3;">Shipping Address</td>
		<td><c:out value="${member.getAddress() }"></c:out></td>
	</tr>
	<tr>
		<td style="background-color:#fcf0b3;">Total Amount</td>
		<td><c:out value='${sum}'></c:out></td>
	</tr>
</Table>
<Table>
	<tr>
		<th>No.</th>
		<th>Item Name </th>
		<th>Price</th>
		<th>Quantity</th>
	</tr>
	<c:set var="i" value="0"></c:set>
	<% request.setAttribute("productDAO", new ProductDAO());//設定給EL 取得產品名稱 %>
	<c:forEach items="${cartlist}" var="item">
		<c:set var="i" value="${i+1}"></c:set>
		<c:set var="product" value="${productDAO.getProduct(item)}"></c:set>
		<tr>
			<td><c:out value="${i}"></c:out></td>
			<td><c:out value="${product.getName()}"></c:out></td>
			<td><c:out value="${product.getPrice()}"></c:out></td>
			<td><c:out value="${amountlist.get(i-1)}"></c:out></td>
		</tr>
	</c:forEach>
</Table>
</div>
<div class="row justify-content-end" style="padding-bottom:30px">
		<a href="" style="color:red" class="btn btn-outline-primary" role="button">Cancel</a>&nbsp;&nbsp;
		<a href="Home?page=cash-on-delivery"  class="btn btn-primary" role="button">Cash on delivery</a>

</div>

</div>
<%@ include file="footer.jsp" %>
</body>
</html>