<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
<h2>글 작성</h2>

<form method="post">
	
	<table border="1" >
		<tr>
		
		<th>제목</th>
		<td><input type="text" name="title" value="제목"> </td>
	
		</tr>
		
		<tr>
		<th>내용</th>
		<td><textarea name="content"></textarea><td>
		</tr>
		
		<tr>
		<th>작성자</th>
		<td ><input type="text" name="writer" value="작성자"> </td>
		</tr>
		
		<tr>
		<td><input type="submit" value="글쓰기"> </td>
		</tr>
		
		
		
	</table>
</form>
</body>
</html>