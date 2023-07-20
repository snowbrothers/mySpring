<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>

<h2>메인게시판</h2>
  
 메세지 출력 : ${msg}
  
  
 
 <c:forEach items="${list}" var="board">
 	<table>
 	<tr>
 	<td>
 	  ${board.bno}
 	</td>
 	</tr>
 	
 	</table>
 </c:forEach> 
 

<button onclick="location.href='/board2/write'">글쓰기</button>

 
 
 
</body>
</html>