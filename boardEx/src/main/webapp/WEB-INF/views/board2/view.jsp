<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 상세페이지</title>
<style type="text/css">
.wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}

.content {
  font-family: system-ui, serif;
  font-size: 2rem;
  padding: 3rem;
  border-radius: 1rem;
  background:  cadetblue;
}


</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


<script>

	window.addEventListener("load",function(){
		
		deleteBtn.addEventListener("click", function(){
			
			let bno = ${board.bno}
			
			location.href = "/board2/delete?bno=" + bno;
			
			
		})
		
		
		editBtn.addEventListener("click", function(){
		
			location.href = "/board2/edit";
			
		})
		
		
	})
	
	
	
	

</script>

</head>
<body>

<h2>게시판 상세 페이지</h2>

<input type="text" id="bno" value="${board.bno}">


<form id="viewForm">
<div class="wrapper">
  <div class="content">


 

	<div class="mb-3">
  <label for="title" class="form-label">내용</label>
  <input type="text" class="form-control" id="title" value="${board.title }" readonly>
</div>

<div class="mb-3">
  <label for="content" class="form-label">내용</label>
  <textarea class="form-control" id="content" rows="3" readonly>${board.content }</textarea>
</div>

<div class="mb-3">
  <label for="writer" class="form-label">작성자</label>
  <input type="text" class="form-control" id="writer" value="${board.writer}" readonly>
</div>

<button class="btn btn-primary justify-content-md-center" id=editBtn>수정</button>
<button class="btn btn-primary justify-content-md-center" id="deleteBtn">삭제</button>
</div>
</div>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>