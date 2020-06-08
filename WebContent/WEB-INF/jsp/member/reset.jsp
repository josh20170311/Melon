<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
</head>
<body>
<form action="Reset" method="POST">
<input type="hidden" name="id" value="${param.id}">
new password : <input type="text" name="newPassword"/>
<input type="submit" value="reset"/>
</form>
</body>
</html>