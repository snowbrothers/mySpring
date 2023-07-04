<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script type="text/javascript">
function confirmEdit() {
	   if (confirm("정말 수정하시겠습니까?")) {
		   document.querySelector('form').submit();
	   }
	}
	
</script>
</head>
<body>

<h3>게시판 상세보기</h3>

board 출력 : ${board }

<form method="post">
<table border="1" width="90%">
		<tr>
			<td>번호</td>
			<td>${board.bno } </td>
			<td>제목</td>
			<td><input type="text" value="${board.title}" name="title"> </td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${board.updatedate }</td>
			<td>작성자</td>
			<td>${board.writer }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3" height="100">
			<textarea rows="10" cols=100 name="content" >${board.content}</textarea> 
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button type="button" onclick="confirmEdit()" >수정하기</button>
				<button type="reset" onclick="confirmDelete()">다시작성</button>
			
				<button type="button" onclick="location.href='/board/list'">목록 보기</button>
			</td>
		</tr>
		<tr></tr>
		
	
	</table>
	<input type="hidden" name="bno" value="${board.bno}">
	
</form>

</body>
</html>