<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

	<h2>로그인</h2>
	
		<form method="post" action="./loginAction">
			id<input type="text" name="id" value="admin"><br>
			pw<input type="text" name="pw" value="1234">
			<input type="submit">
		</form>

</body>
</html>