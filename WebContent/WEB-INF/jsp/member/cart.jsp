<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
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
	
	<div class="container">
	
	<c:choose> 
		<c:when test="${x == 1}">
						<h4 style="margin-top: 40px;">My shopping bag(<c:out value="${x}"/> item)</h4>
		</c:when>
		<c:when test="${x > 1}">
						<h4 style="margin-top: 40px;">My shopping bag(<c:out value="${x}"/> items)</h4>
		</c:when>
		<c:otherwise >
				<h4 style="margin-top: 40px;">Your Shopping Bag is Empty</h4>
		</c:otherwise>
	
	</c:choose>
	<form method="POST" action="Home" class="nothing">
	<input type="hidden" name="page" value="checkout">
	<table style="table-layout: fixed;width: 100%;">
		<tr>
			<th style="width: 10px;">Item Name</th>
			<th style="width: 10px;">Price</th>
			<th style="width: 10px;">Manufacturer</th>
			<th style="width: 10px;">Amount</th>
			<th style="width: 10px;">Remove Item</th>
		</tr>
	
		<c:set var="total" value="0"></c:set>
		<c:forEach items="${cartlist }" var="i">
			<c:forEach items="${list }" var="Product">
				<c:if test="${i == Product.getId() }">
				
				<c:set var="total" value="${total + Product.getPrice() }"></c:set>
				
			
				<tr>
					<td style="width: 10px;"><img src="${Product.getImage()}" height="100"><br>  (<c:out value="${Product.getName()}"/>)</td>
					<td style="width: 10px;" ><c:out value="${Product.getPrice()}"/></td>
					<td style="width: 10px;"><c:out value="${Product.getManufacturer()}"/></td>
					<td style="width: 10px;" ><input type="number" min="1" max="100" name="${i}" value="${amountlist.get(cartlist.indexOf(i)) }"/></td>
					<td style="width: 10px;"><a href="Home?page=remove&id=<c:out value="${Product.getId()}"/>"><span class="btn btn-danger">X</span></a></td>
				</tr>
				</c:if>
			</c:forEach>
		</c:forEach>
		</table>
	
	<h4 style="margin-top: 40px;margin-bottom: 40px;">Order Total: $ (<c:out value="${ total}"></c:out>)</h4>
	
	<input type="submit" value="Proceed to Checkout" class="btn btn-success" style="width:100%;padding:8px;font-size:16px;"><br>
	</form>
	<a href="Home?page=index"><input type="button" value="Continue Shopping" class="btn btn-warning" style="width:100%;padding:8px;font-size:16px;"></a>
	
	
	</div>

	<%@ include file="footer.jsp" %>

</body>
</html>