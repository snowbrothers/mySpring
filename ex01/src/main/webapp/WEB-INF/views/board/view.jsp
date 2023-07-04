<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script type="text/javascript">
function confirmDelete() {
	   if (confirm("정말 삭제하시겠습니까?")) {
	      window.location.href = "/board/delete?bno=" + ${board.bno};
	   }
	}
	
</script>
</head>
<body>

<h3>게시판 상세보기</h3>

board 출력 : ${board }

<form>
<table border="1" width="90%">
		<tr>
			<td>번호</td>
			<td> ${board.bno }</td>
			<td>제목</td>
			<td>${ board.title}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${board.regdate }</td>
			<td>작성자</td>
			<td>${board.writer }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3" height="100">
			${board.content }
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button type="button" onclick="location.href='/board/edit?bno=${board.bno}'" >수정하기</button>
				<button type="button" onclick="confirmDelete()">삭제하기</button>
			
				<button type="button" onclick="location.href='/board/list'">목록 보기</button>
			</td>
		</tr>
		<tr></tr>
		
	
	</table>

</form>

</body>
</html>