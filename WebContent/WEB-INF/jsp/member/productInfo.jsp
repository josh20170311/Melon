<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Info</title>
<link 
	rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
	crossorigin="anonymous"> 
	
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<%@include file="header.jsp" %>

<div class="container">
	<div class="row">
			<%--左側文章清單_開始 --%>
			<div class="col-md-4"><%//bootstrap  %>
					<div class="list-group">
						<c:forEach items="${productArticleInfos}" var="title">
							<a href="Articles?id=${title.getId()}" class="btn btn-primary" style="white-space: pre-wrap;word-wrap: break-word;"><c:out value="${title.getTitle()}"></c:out></a><br>
						</c:forEach>
				</div> 
			</div>
			<%--左側文章清單_結束 --%>
			
			
			<div class="col-md-8"><%//bootstrap  %>
			<div style="display:flex;align-items:center;justify-content:center;width:100%">
				<img src="${product.getImage()}"  alt="${product.getName()} image" style="height:400px">
			</div>
			<div class="text-center" >
			
			${product.getName()}<br>
			${product.getModelNumber()}<br>
			${product.getManufacturer()}<br>
			${product.getPrice()}<br>
			${product.getSystem()}<br>
			${product.getScreenSize()}<br>
			${product.getStorage()}<br>
			<a class="btn btn-primary" href="Home?page=addtocart&action=index&id=<c:out value="${product.getId()}"/>">Add to Cart</a> <br>
			<c:if test="${session != null}">
				<a class="btn btn-primary" href="AddArticle">Add Article</a><br>
			</c:if>
			<input class="btn btn-primary" type ="button" onclick="history.back()" value="Back"></input>
			</div>
			</div>
	</div>
</div>



<%@include file="footer.jsp" %>
</body>
</html>