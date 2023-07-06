<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>

<html lang="ko">
  <head>
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
   
    <!-- Custom styles for this template -->
    <!-- <link href="navbar-top-fixed.css" rel="stylesheet"> -->
    
   <script type="text/javascript">
		// 메세지 처리
		let msg = '${msg}';
		
		
		/*
			부트스트랩을 이용한 모달창 띄우기
			
			1. css, js 파일 추가
			2. 모달요소 복사
				타이틀 및 메세지 수정
			3. 자바스크립트로 모달창 열기
				자바스크립트를 이용 > 모달객체 생성 후 show()메서드 호출
			4. 모달창 닫기
				자바스크립트를 이용 닫는 이벤트 발생시 뒤로가기 추가
				-> 모달창이 닫히면서 발생하는 이벤트 (hidden.bs.modal)에 뒤로가기 추가
			
		*/
		
		
		window.onload = function(){
			if(msg != ''){

			// 메세지 출력
			document.querySelector(".modal-body").innerHTML = msg;
			
			// 버튼 출력 제어
			document.querySelector("#btnModalSave").style.display=""
			
			const myModal = new bootstrap.Modal('#myModal', {
				  keyboard: false
				});
					
			// 모달 보여주기
				myModal.show();
				
			}
			
			
		}
	</script>    
  </head>
  <body>
   
<%@include file ="../common/header.jsp"%>

<main class="container">
  <div class="bg-light p-5 rounded">
    <h1>게시판</h1>
    <p class="lead">부트스트랩을 이용한 게시판 만들기</p>
    <a class="btn btn-lg btn-primary" href="../board/write" role="button">글쓰기 &raquo;</a>
  </div>
<%@include file ="../common/searchForm.jsp"%>
  <p></p>
  <br>

  <div class="list-group w-auto">
  
  <c:forEach items="${list}" var="board">
    <a href="../board/view?bno=${board.bno}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
      <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
      <div class="d-flex gap-2 w-100 justify-content-between">
        <div>
          <h6 class="mb-0">제목 : ${board.title } &nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp 작성자 : ${board.writer }</h6>
          <!--  <p class="mb-0 opacity-75">${board.content }</p> -->
        </div>
        <small class="opacity-50 text-nowrap">${board.updatedate }</small>
      </div>
    </a>
    </c:forEach>
  </div>

		<!-- 페이징 include -->
		<%@include file ="../common/pageNavi.jsp"%>
</main>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">알리미</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ${msg }
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
        <button type="button" id="btnModalSave" class="btn btn-primary">저장</button>
      </div>
    </div>
  </div>
</div>


	


<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
crossorigin="anonymous"></script>
   <!--  <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->

     
  </body>
</html>