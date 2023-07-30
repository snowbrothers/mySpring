<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>

<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Fixed top navbar example · Bootstrap v5.2</title>

	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/navbar-fixed/">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link href="/resources/css/style.css" rel="stylesheet">

<script type="text/javascript">

let msg = '${msg}';

window.addEventListener("load",function(){
	

//window.add = function(){
	if(msg != ''){
		// 메세지 출력
		document.querySelector(".modal-body").innerHTML = msg;
		// 버튼 출력 제어
		document.querySelector("#btnModalSave").style.display='none';
		
		// 모달 생성
		let myModal = new bootstrap.Modal(document.getElementById('myModal'), {
			  keyboard: false
		});
		// 모달 보여주기
		myModal.show();
	
	
}
})</script>

</head>
<body>

	<h2>나는 글쓰기 페이지</h2>
	
	<input type="text" id="bno" name="bno" value=""><br>
	
	<form method="post" action="/board2/write" name="wirteForm">
	
	<table border='1px solid' width='90' >
		
		<tr>
			<td colspan="3">
			<select name="category">
				<option value="도서관">도서관</option>
				<option value="음악">음악</option>
				<option value="박물관">박물관</option>
			</select>
			</td>
		</tr>
		
		<tr>				
			<td colspan="3"><input type="text" name="title" id="title" placeholder="제목" style="width:100%"></td>
		</tr>
		<tr>
			<td colspan="3"><input type="text" name="writer" id="writer" placeholder="작성자" style="width:100%"></td>
		</tr>
		
		<tr>
			<td><textarea cols='100' rows='20' id="content" name="content"></textarea></td>
		</tr>
		
		
		
		
	</table>
	
	<button id="writeBtn">글작성</button>
	<button type="reset">초기화</button>
	</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>	