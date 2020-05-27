<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<%@include file="header.jsp" %>
	
	<div class="signup-header">
	 	<h2>Edit Product</h2>
	 </div>

	 <form method="post" action="admin">
	 
	 <input type="hidden" name="page" value="edit_product">
	 <input type="hidden" name="id" value="<c:out value="${p.getId() }"/>">
     
	 	<div class="signup-group">
	 		<label>Name</label>
	 		<input type="text" name="name" value="<c:out value="${p.getName() }"></c:out>" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Model Number</label>
	 		<input type="text" name="model" value="<c:out value="${p.getModelNumber() }"></c:out>" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Price</label>
	 		<input type="number" name="price" value="<c:out value="${p.getPrice() }"></c:out>" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Manufacturer</label>
	 		<input type="text" name="manufacturer" value="<c:out value="${p.getManufacturer() }"></c:out>" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>System</label>
	 		<input type="text" name="system" value="<c:out value="${p.getSystem() }"></c:out>" required>
	 	</div>
	 	
	 	
	 	<div class="signup-group">
	 		<label>Image</label>
	 		<img style="height: 160px;width: 160px;" src="<c:out value="${p.getImage() }"></c:out>">
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Screen Size</label>
	 		<input type="text" name="screen" value="<c:out value="${p.getScreenSize() }"></c:out>" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Storage</label>
	 		<input type="text" name="storage" value="<c:out value="${p.getStorage() }"></c:out>" required>
	 	</div>
	 	
	 	<div class="signup-group">
			<input type="submit" value="Process">	 
		</div>
	 </form>
	
	<%@include file="footer.jsp" %>
</body>
</html>