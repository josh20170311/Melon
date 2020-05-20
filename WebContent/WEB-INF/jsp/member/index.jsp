<%@ page language="java" contentType="text/html; charset=utf8"
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
</head>
<body>
	
	<%--設定購物車_開始 --%>
	<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>
	<%--設定購物車_結束 --%>
	
	<%--導覽bar_開始 --%>
	<header>
		<h1>
			Melon
		</h1>
		<nav>
			<ul>
				<li><input type="text"  name="search"  placeHolder="Search"/></li>
				<li><a href="Controller?page=index">Home</a></li>
				<li><a href="Controller?page=articles">Articles</a></li>
				<c:choose>
					<c:when test="${session == null}">
						<li><a href="Controller?page=login">Login</a></li>
						<li><a href="Controller?page=sign-up">Sign-up</a></li>
					</c:when>
					<c:when test="${session != null}">
						<li><a href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li><a href="#">My Account(<c:out value="${username }"></c:out>)</a></li>
						<li><a href=Controller?page=myarticles>My Articles</a></li>
					</c:when>
				</c:choose>
				<li><a href="Controller?page=showcart">cart(<c:out value="${x}"/>)</a></li>
			</ul>
		</nav>
	</header>
	<%--導覽bar_結束 --%>
	
	<%--主要內容_開始 --%>
	<div class="tiazon-content"><%//style.css  %>
 	<div class="container"><%//bootstrap  %>
 		<div class="row"><%//bootstrap  %>
 		
 				<%--左側選單_開始 --%>
 				<div class="col-md-2"><%//bootstrap  %>
 						<div class="list-group">
								  <a href="#" class="list-group-item" style="background:  #e8f29d;">
								    All Products
								  </a>
								  <a href="#" class="list-group-item">Apple</a>
								  <a href="#" class="list-group-item">Asus</a>
								  <a href="#" class="list-group-item">Samsung</a>
								  <a href="#" class="list-group-item">Xiaomi</a>
						</div> 
 				</div>
				<%--左側選單_結束 --%>
				
				<%--右側欄_開始 --%>
 				<div class="col-md-8">
 					
 					<%-- 排序功能_開始  --%>
					<h5>Sort by(Price):</h5>
					<form action="Controller" method="get" 
										style="border: none;margin:0px;padding: 0px;margin-bottom: 20px;">
							<input type="hidden" name="page" value="price-sort">
							<input type="hidden" name="action" value="index">
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
		 						<img src="${product.getImage() }" class="img-responsive" ><br>
		 						<div class="text-center"><a style="color: black;"><c:out value="${product.getName() }"></c:out></a></div>	
		 						<p style="text-align: center;"> $  <c:out value="${ product.getPrice() }"></c:out></p>
		 						
		 						<div class="text-center">  
		 							<a class="btn btn-primary" href="Controller?page=addtocart&action=index&id=<c:out value="${product.getId()}"/>">Add to Cart</a> 
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
	
	<footer>
		<div class="footer">
	      <a href="Controller?page=index"> Melon</a>
	    </div>
	</footer>
	
</body>
</html>