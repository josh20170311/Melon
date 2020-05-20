<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%response.setCharacterEncoding("UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Articles</title>
<link 
	rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
	crossorigin="anonymous"> 
	
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
</head>
</head>
<body>

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
		
 		<div class="row"><%//bootstrap  %>
 		
 				<%--左側選單_開始 --%>
 				<div class="col-md-4"><%//bootstrap  %>
 						<div class="list-group">
								<c:forEach items="${titleList}" var="title">
									<a href="Controller?page=articles&articleid=${title.getId()}" class="btn btn-primary" style="white-space: pre-wrap;word-wrap: break-word;"><c:out value="${title.getTitle()}"></c:out></a><br>
								</c:forEach>
						</div> 
 				</div>
				<%--左側選單_結束 --%>
				
				<%--右側欄_開始 --%>
 				<div class="col-md-8">
 					
 					
					
						<pre style="white-space: pre-wrap;word-wrap: break-word;">
<c:out value="Title : ${article.getTitle() }"></c:out>
<c:out value="Author : ${article.getAuthorName() }"></c:out>
<c:out value="Product : ${article.getProductName() }"></c:out>
<c:out value="Time : ${article.getUploadTime() }"></c:out>
						</pre>
						<pre style="white-space: pre-wrap;word-wrap: break-word;">
<c:out value="${article.getContent()}"></c:out>
						</pre>
					

 				</div>
 				<%--右側欄_結束 --%>
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