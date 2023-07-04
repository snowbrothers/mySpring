<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나는 한다 출력을 what 리스트</title>
</head>
<body>

	<h3>게시판</h3>

	${list }
	
	<table border="1" >
		<tr>
		 	<th>번호</th>
		 	<th>제목</th>
		 	<th>작성자</th>
		 	<th>작성일</th>
		 	<th>수정일</th>
		</tr>
		
		<c:if test="${empty list }">
		<tr>
			<td colspan="5" align="center">게시글이 없습니다.</td>
		</tr>
		</c:if>
		
		<c:forEach items="${list }" var="board">
			
		<tr>
			<td>${board.bno }</td>
			<td><a href="/board/view?bno=${board.bno }">${board.title }</a> </td>
			<td>${board.writer }</td>
			<td>${board.regdate }</td>
			<td>${board.updatedate }</td>
			
		</tr>
		
		</c:forEach>
		
		<tr>
			<td>
				<button onclick="location.href='/board/write'">글쓰기</button>
			</td>
		</tr>
		
	</table>

</body>
</html>