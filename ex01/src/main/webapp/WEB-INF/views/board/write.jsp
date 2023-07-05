<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>

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


</head>
<body>
<h2>글 작성</h2>

<%@include file ="../common/header.jsp"%>

<main class="container">
  <div class="bg-light p-5 rounded">
    <h1>게시판</h1>
    <p class="lead">부트스트랩을 이용한 게시판 만들기</p>
    <a class="btn btn-lg btn-primary" href="../board/list_bs" role="button">목록보기 &raquo;</a>
  </div>

  <p></p>
  <br>

  <div class="list-group w-auto">
  
    <form method="post">
	
	<div class="mb-3">
  <label for="title" class="form-label">제목</label>
  <input type="text" name="title" class="form-control" id="title" placeholder="제목을 입력해주세요">
</div>
<div class="mb-3">
  <label for="content" class="form-label">내용</label>
  <textarea class="form-control" id="content" name="content" rows="3">내용을 입력해주세요.</textarea>
</div>
<div class="mb-3">
  <label for="writer" class="form-label">작성자</label>
  <textarea class="form-control" id="writer" name="writer" rows="3"></textarea>
</div>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
 	<button type="submit" class="btn btn-primary btn-lg">글 작성</button>
	<button type="reset" class="btn btn-secondary btn-lg">다시작성</button>
</div>
</form>
   
  </div>


</main>



<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
crossorigin="anonymous"></script>

</body>
</html>