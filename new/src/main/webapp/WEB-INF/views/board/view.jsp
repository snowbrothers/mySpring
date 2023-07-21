<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Fixed top navbar example · Bootstrap v5.2</title>

	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/navbar-fixed/">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link href="/resources/css/style.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/4863a16a12.js" crossorigin="anonymous"></script>
	<script src="/resources/js/reply.js"></script>
	<script src="/resources/js/fileupload.js"></script>
	<!-- link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet"> -->


</head>
<body>

<%@include file="../common/header.jsp" %>
<script type="text/javascript">

window.addEventListener('load',function(){ 
	// 로그인한 아이디와 게시글의 작성자가 일치하면
	// 수정, 삭제 버튼에 이벤트를 적용
	
	if(${userId eq board.writer}){
		
		

		// 수정 페이지 이동
	btnEdit.addEventListener('click',function(){
		viewForm.action='/board/edit';
		viewForm.submit();
	});
		
	btnDelete.addEventListener('click', function(){
		viewForm.action='/board/delete';
		viewForm.submit();
	});
	}
	
	
	
	
	btnList.addEventListener('click', function(){
		viewForm.action='/board/list';
		viewForm.submit();
	})
	
	btnReplyWrite.addEventListener('click',function(){
		replyWrite();
	})

	getReplyList(1);
	
	getFileList();
	
	/*btnFileList.addEventListener('click', function () {
		
		getFileList();
		
	})*/
	
});
	function getFileList(){
		
		//file/list/{bno}
		let bno = '${board.bno}';
		fetch('/file/list/' + bno)
			.then(response => response.json())
			.then(map => viewFileList(map));
	}
	
	function viewFileList(map){
		
		console.log(map);
		let content = '';
		if(map.list.length > 0){
			content +=
			
			 '<div class="mb-3">'
			+ '	  <label for="attachFile" class="form-label">'
			+ '   첨부파일목록</label> '
			+ '	  <div class="form-control" id="attachFile"> '
			
			
			map.list.forEach(function(item, index){
					
					let savePath =encodeURIComponent( item.savePath);
					console.log('savePath : ', savePath);
					
					content += 
							'<a href="/file/download?fileName='
							+	savePath+'">'	
							+	item.filename + '</a>'
							+ '<br>';
				})

				
			content	+= '	  </div> '
					+ '</div> ';
				
			}else{
				content = '등록된 파일이 없습니다.';
			}
			divFileupload.innerHTML = content;
	}
	


function requestAction(url){
	viewForm.action=url;
	viewForm.submit();
}




</script>
<main class="container">
  <div class="bg-light p-5 rounded">
    <h1>게시판 상세보기</h1>
    <p class="lead">부트스트랩을 이용한 게시판 만들기</p>
    <a class="btn btn-lg btn-primary" 
    	href="#" id="btnList" 
    	role="button">리스트 &raquo;</a>
  </div>
  <p></p>
  <!-- 상세보기 -->
  <div class="list-group w-auto">
    <form method="get" name="viewForm">
    
    <input type="hidden" name="bno" id="bno" value="${board.bno }">
    <input type="hidden" name="page" id="page" value="1">
    <input type="hidden" name="pageNo" value="${param.pageNo }">
    <input type="hidden" name="searchField" value="${param.searchField }">
    <input type="hidden" name="searchWord" value="${param.searchWord }">
	
	<!--  <button type="button" id="btnFileList" class="btn btn-secondary btn-sm">파일리스트</button> -->
	
	<div id="divFileupload" class="mb-3"></div>

	
	
	
		
	<div class="mb-3">
	  <label for="title" class="form-label">제목</label>
	  <input name="title" id="title" 
	  type="text" readonly class="form-control" value='${board.title }'>
	</div>
	
	<div class="mb-3">
	  
	  <label for="content" class="form-label">내용</label>
	  <textarea class="form-control" id="content" readonly
	  			 name="content" rows="3">${board.content }</textarea>
	</div>
	<div class="mb-3">
	  <label for="writer" class="form-label">작성자</label>
	  <input type="text" class="form-control" readonly
	  			value='${board.writer }' id="writer" name="writer">
	</div>
	
	
	<!-- 로그인한 사용자의 아이디와 게시글의 작성자가 일치하면 버튼을 노출 -->
	<c:if test="${userId eq board.writer }">
	<div class="d-grid gap-2 d-md-flex justify-content-md-center">
		<button type="button" id="btnEdit" class="btn btn-primary btn-lg">수정</button>
		
		<button type="button" id="btnDelete" class="btn btn-primary btn-lg" >삭제</button>
	</div>
	</c:if>
	</form>
    
  </div>
  
  
  <p></p>
  
  <!-- 댓글 작성자를 로그인한 사용자의 아이디를 입력 -->
  <input type="text" id="replyer" value="${userId}">
 <div class="input-group">
  <span class="input-group-text">답글작성</span>
  <input type="text" id="reply" aria-label="First name" class="form-control">
  <input type="text" id="replyer" aria-label="First name" class="form-control" placeholder="작성자">
  <input type="button" id="btnReplyWrite" aria-label="Last name" class="form-control" value="댓글작성">
</div>
  
  
  <!-- 댓글 리스트 -->
  <div id="replyDiv">
  
  </div>
  
</main>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>
















