<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">

	window.addEventListener('load', function(){
	
		btnLogin.addEventListener('click', function(e){
			
			e.preventDefault();
			
			// id 로 접근 값 저장 
			let id = document.querySelector('#id').value
			let pw = document.querySelector('#pw').value
			
			// 객체로 넘겨줌
			let obj = {id : id
					, pw : pw}
			
			let url = '/loginAction';
			
			fetchPost(url, obj, loginDo)
			
		})
	})
		
			
		function loginDo(map){
			
			if(map.result == 'success'){
				location.href = '/board2/list';
			}else{
				msg.innerHTML = result;
			}
			
			
		}
		
	

</script>

</head>
<body>

<h2>로그인</h2>

 <div id="msg"></div>

<form method="post" >
<input type="text" name="id" id="id" placeholder="아이디">
<input type="password" name="pw" id="pw" placeholder="비밀번호">
<input type="button" value="로그인" id="btnLogin">
</form>
</body>
</html>