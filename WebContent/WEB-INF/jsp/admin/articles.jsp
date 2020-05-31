<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<body>
<%@include file="header.jsp" %>
	<%--主要內容_開始 --%>
	<div class="tiazon-content"><%//style.css  %>
		
 		<div class="row"><%//bootstrap  %>
 		
 				<%--左側文章清單_開始 --%>
 				<div class="col-md-4"><%//bootstrap  %>
 						<div class="list-group">
								<c:forEach items="${list}" var="article">
									<a href="admin?page=articles&id=${article.getId()}" class="btn btn-primary" style="white-space: pre-wrap;word-wrap: break-word;"><c:out value="${article.getTitle()}"></c:out></a>
									<a href="admin?page=articles&id=${article.getId()}&action=audit" class="btn btn-warning">isAudited : <c:out value="${article.getAudited()}"></c:out></a>
									<br>
								</c:forEach>
						</div> 
 				</div>
				<%--左側文章清單_結束 --%>
				
				<%--右側欄_開始 --%>
 				<div class="col-md-8">
 					
 					
					
						<pre style="white-space: pre-wrap;word-wrap: break-word;">
<c:out value="Title : ${article.getTitle() }"></c:out>
<c:out value="Author : ${article.getMemberName() }"></c:out>
<c:out value="Product : ${article.getProductName() }"></c:out>
<c:out value="Time : ${article.getUploadTime() }"></c:out>
<c:out value="Audited : ${article.getAudited() }"></c:out>
						</pre>
						<pre style="white-space: pre-wrap;word-wrap: break-word;">
<c:out value="${article.getContent()}"></c:out>
						</pre>
					

 				</div>
 				<%--右側欄_結束 --%>
 		</div>
 	</div>
	<%--主要內容_結束 --%>

<%@include file="footer.jsp" %>
</body>
</html>