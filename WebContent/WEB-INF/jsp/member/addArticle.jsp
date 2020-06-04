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
	<%@ include file="header.jsp"%>
	<%--導覽bar_結束 --%>
	
	
	<div class="signup-group">
		<form action="AddArticle" method="post">
			<input type="text"  name="title" placeholder="Your Title"/><br>
			<select name="productId" >
						<c:forEach items="${list }" var="product">
								<option value="<c:out value="${product.getId() }"></c:out>"><c:out value="${product.getName() }"></c:out></option>
	 					</c:forEach>
			</select>

			<textarea name="content" placeholder="Your Content"></textarea><br>
			<input type="submit" value="submit" >
			
			<input class="btn btn-primary" type ="button" onclick="history.back()" value="Cancel"></input>
		</form>
	</div>
	
	
	
	<%@ include file="footer.jsp" %>
	
</body>
</html>