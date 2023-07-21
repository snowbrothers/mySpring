<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
		<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Fixed top navbar example · Bootstrap v5.2</title>

	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/navbar-fixed/">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link href="/resources/css/style.css" rel="stylesheet">
	<!-- link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet"> -->
	<script type="text/javascript">
	
	</script>

<body>

<h2>메인게시판</h2>
  
등록성공여부 : ${Param.msg}
  
  
<form id="listForm" action="#">  
  <table class="table">
  <thead>
    <tr>
      <th scope="col">글번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성일</th>
    </tr>
  </thead>
  <tbody> 
    <c:forEach items="${list}" var="board">
    
    <tr>
      <th scope="row">${board.bno}</th>
      <td><a href="/board2/view?bno=${board.bno}">${board.title}</a></td>
      <td>${board.writer}</td>
      <td>${board.regdate }</td>
    </tr>
    </c:forEach> 
   
  </tbody>
</table>
 </form>
  
  
<button onclick="location.href='/board2/write'">글쓰기</button>

 
 
 
</body>
</html>