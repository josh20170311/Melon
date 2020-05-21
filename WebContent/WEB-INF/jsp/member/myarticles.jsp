<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Articles</title>
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
				<li><a href="Home?page=index">Home</a></li>
				<li><a href="Home?page=articles">Articles</a></li>
				<c:choose>
					<c:when test="${session == null}">
						<li><a href="Home?page=login">Login</a></li>
						<li><a href="Home?page=sign-up">Sign-up</a></li>
					</c:when>
					<c:when test="${session != null}">
						<li><a href="Home?page=logout" style="color: #F24638;">Logout</a></li>
						<li><a href="#">My Account(<c:out value="${username }"></c:out>)</a></li>
						<li><a href=Home?page=myarticles>My Articles</a></li>
					</c:when>
				</c:choose>
				<li><a href="Home?page=showcart">cart(<c:out value="${x}"/>)</a></li>
			</ul>
		</nav>
	</header>
	<%--導覽bar_結束 --%>
	
	<%--主要內容_開始 --%>
	<div class="tiazon-content"><%//style.css  %>
	 	<div class="container"><%//bootstrap  %>
	 		<div class="row"><%//bootstrap  %>
	 					<a class="btn btn-primary" href="Home?page=addarticle">Add Article</a>
			</div>
	 	</div>
 	</div>
	<%--主要內容_結束 --%>
	
	<footer>
		<div class="footer">
	      <a href="Home?page=index"> Melon</a>
	    </div>
	</footer>
	
</body>
</html>