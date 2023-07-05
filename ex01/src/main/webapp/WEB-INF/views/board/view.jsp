<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>

<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>게시판</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/navbar-fixed/">
<!-- <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
crossorigin="anonymous">
   
<!-- 외부 파일로 설정 -->
<link href="../resources/css/style.css" rel="stylesheet">

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

 <%@include file ="../common/header.jsp"%>

board 출력 : ${board }

<main class="container">
  <div class="bg-light p-5 rounded">
    <h1>게시판</h1>
    <p class="lead">부트스트랩을 이용한 게시판 만들기</p>
    <a class="btn btn-lg btn-primary" href="../board/list_bs" role="button">목록보기 &raquo;</a>
  </div>

  <p></p>
  <br>

  <div class="list-group w-auto">




	<div class="mb-3">
  <label for="bno" class="form-label">번호</label>
  <div class="col-sm-10">
  <input type="text" name="bno" class="form-control" id="bno" value="${board.bno }" readonly>
  </div>
</div>

<div class="mb-3">
  <label for="title" class="form-label">제목</label>
  <div class="col-sm-10">
  <input type="text" name="title" class="form-control" id="title" value="${board.title }" readonly>
  </div>
</div>
<div class="mb-3">
  <label for="content" class="form-label">내용</label>
  <div class="col-sm-10">
  <textarea class="form-control" id="content" name="content" rows="3" readonly>${board.content }</textarea>
	</div>
</div>
<div class="mb-3">
  <label for="writer" class="form-label">작성자</label>
   <div class="col-sm-10">
  <textarea class="form-control" id="writer" name="writer" rows="3" readonly>${board.writer}</textarea>
  </div>
</div>
<div class="d-grid gap-2 col-6 mx-auto">
 	<button type="button" class="btn btn-primary btn-lg" onclick="location.href='/board/edit?bno=${board.bno}'">수정</button>
	<button type="submit" class="btn btn-secondary btn-lg" onclick="confirmDelete()">삭제</button>
</div>

</div>


</main>


<!--  <form>
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

</form> -->

<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
crossorigin="anonymous"></script>

</body>
</html>