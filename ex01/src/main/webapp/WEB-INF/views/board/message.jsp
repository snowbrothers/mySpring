<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 페이지</title>
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
				
			document.querySelector(".modal-body").innerHTML = msg;
			
			const myModal = new bootstrap.Modal('#myModal', {
				  keyboard: false
				});
			
				myModal.show();
				
			}
			const myModalEl = document.getElementById('myModal')
			myModalEl.addEventListener('hidden.bs.modal', event => {
			  history.go(-1)
			});
			
		}
		
	</script>
	<!-- 부트스트랩을 사용하기 위해서 css, js를 추가 합니다. -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>



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
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>




    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>