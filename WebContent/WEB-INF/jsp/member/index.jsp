<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link 
	rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
	crossorigin="anonymous"> 
	
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/utils.js"></script>
</head>
<body>
	<script>
		alertMessage("${message}");
	</script>
	<%--設定購物車_開始 --%>
	<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>
	<%--設定購物車_結束 --%>
	
	<%--導覽bar_開始 --%>
	<%@ include file="header.jsp"%>
	<%--導覽bar_結束 --%>
	
	<%--主要內容_開始 --%>
	<div class="tiazon-content"><%//style.css  %>
 	<div class="container"><%//bootstrap  %>
 		<div class="row"><%//bootstrap  %>
 		
 				<%--左側選單_開始 --%>
 				<div class="col-md-2"><%//bootstrap  %>
 						<div class="list-group">
								  <a href="Home?catalog=all" class="list-group-item" style="background:  #e8f29d;">
								    All Products
								  </a>
								  <c:forEach items="${manuflist}" var="manuf">
								  	<a href="Home?catalog=${manuf}" class="list-group-item" >
								    	<c:out value="${manuf }"></c:out>
								  	</a>
								  </c:forEach>
						</div> 
 				</div>
				<%--左側選單_結束 --%>
				
				<%--右側欄_開始 --%>
 				<div class="col-md-8">
 					
 					<%-- 排序功能_開始  --%>
					<h5>Sort by(Price):</h5>
					
					<form action="Home" method="get" 
										style="border: none;margin:0px;padding: 0px;margin-bottom: 20px;">
							<input type="hidden" name="page" value="price-sort">
							<input type="hidden" name="catalog" value="<c:out value="${param.catalog}"></c:out>">
							<select name="sort">
									<option value="low-to-high">Low to high</option>
									<option value="high-to-high">high to low</option>
							</select>
							<input type="submit" value="Go!">
					</form>
					<%-- 排序功能_結束  --%>
					
					<%-- 產生產品清單_開始  --%>
 					<c:forEach items="${list }" var="product">
		 					<div class="col-md-4">
		 						<a href="Product?id=${product.getId() }">
		 							<img src="${product.getImage() }" class="img-responsive" ><br>
		 						</a>
		 						<div class="text-center"><a style="color: black;"><c:out value="${product.getName() }"></c:out></a></div>	
		 						<p style="text-align: center;"> $  <c:out value="${ product.getPrice() }"></c:out></p>
		 						
		 						<div class="text-center">  
		 							<a class="btn btn-primary" href="Home?page=addtocart&action=index&id=<c:out value="${product.getId()}"/>">Add to Cart</a> 
		 						</div><br>
		 					</div>
 					</c:forEach>
 					<%-- 產生產品清單_結束  --%>
 				</div>
 				<%--右側欄_結束 --%>
 			</div>
 		</div>
 	</div>
	<%--主要內容_結束 --%>
	
	<%@ include file="footer.jsp" %>
	
</body>
</html>
