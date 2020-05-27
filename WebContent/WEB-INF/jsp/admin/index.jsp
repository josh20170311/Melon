<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Index</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/utils.js"></script>
</head>

<body>
	<script>
		alertMessage("${message}");
	</script>
	<%@include file="header.jsp" %>
	 <sql:setDataSource user="root" password="1234" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/melon?serverTimezone=UTC" var="ds" />
	 
	  <sql:query var="result" dataSource="${ds }">
		 select * from product
	   </sql:query>
	   
	  
	
	<div class="container">
	<h2>Products List:</h2>
		 <table>
			<tr>
			<th style="width: 100px;">Item id</th>
			<th style="width: 100px;">Name</th>
			<th style="width: 100px;">Price</th>
			<th style="width: 100px;">Manufacturer</th>
			<th style="width: 100px;">Image</th>
			<th style="width: 100px;">Option</th>
		</tr>
	</table>
		
		 <c:forEach items="${result.rows }" var="row">
		  <table style="table-layout: fixed;width: 100%;">
		  	
				<tr>
					<td style="width: 100px;"><c:out value="${row.Product_ID }"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.Name }"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.Price }"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.Manufacturer}"/></td>
					<td style="width: 100px;"><img src="${row.Image}" height="100" width="150" ></td>
					<td style="width: 100px;"><a href="<%= request.getContextPath() %>/admin?page=edit&id=${row.Product_ID}" style="color: #6bb1f8;">edit</a> ||
					<a href="<%= request.getContextPath() %>/admin?page=delete&id=${row.Product_ID}" style="color:#6bb1f8;">delete</a></td>
				</tr>
			</table>
		 </c:forEach>
		 </div>
	 <%@include file="footer.jsp" %>
</body>
</html>