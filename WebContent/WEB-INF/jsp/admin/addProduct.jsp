<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<%@include file="header.jsp" %>
	
	<div class="signup-header">
	 	<h2>Add Product</h2>
	 </div>

	 <form method="post" action="admin">
	 
	 <input type="hidden" name="page" value="addingProduct">
     
	 	<div class="signup-group">
	 		<label>Name</label>
	 		<input type="text" name="name" placeholder="product name goes here"  required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Price</label>
	 		<input type="text" name="price" placeholder="product price" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Category</label>
	 		<input type="text" name="category" placeholder="product category" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Featured</label>
	 		<input type="text" name="featured" placeholder="yes/no" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		 <label for="fileupload"> Select an image to upload</label>
	 		<input type="file" name="image" required><br>
	 	</div>
	 	
	 	<div class="signup-group">
			<input type="submit" value="Process">	 
		</div>
	 </form>
	
	 <%@include file="footer.jsp" %>
</body>
</html>