<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%response.setCharacterEncoding("UTF-8");%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Article</title>
<link 
	rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
	crossorigin="anonymous"> 
	
<link rel="stylesheet" type="text/css" href="css/style.css">
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
	
	
	<div class="signup-group">
		<form action="Controller?page=addarticle" method="post">
			<input type="text"  name="title" placeholder="Your Title"/><br>
			<select name="productId" >
						<c:forEach items="${list }" var="product">
								<option value="<c:out value="${product.getId() }"></c:out>"><c:out value="${product.getName() }"></c:out></option>
	 					</c:forEach>
			</select>

			<textarea name="content" placeholder="Your Content"></textarea><br>
			<input type="submit" value="submit" >
		</form>
	</div>
	
	
	
	<footer>
		<div class="footer">
	      <a href="Controller?page=index"> Melon</a>
	    </div>
	</footer>
</body>
</html>