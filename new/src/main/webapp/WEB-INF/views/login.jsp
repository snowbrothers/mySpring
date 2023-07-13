<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Signin Template · Bootstrap v5.2</title>

	<script type="text/javascript" src="/resources/js/common.js"></script>
	<script type="text/javascript">
		
		window.addEventListener('load', function(){
			
			/* loginForm.action = "/loginAction";
			loginForm.submit; */
			
			btnSigninView.addEventListener('click', function(){
				signupForm.style.display='none';
				signinForm.style.display='';
			})
			
			btnSignupView.addEventListener('click', function(){
				signupForm.style.display='';
				signinForm.style.display='none';
			})
			
			
			btnLogin.addEventListener('click', function(e){
				
				// 기본 이벤트 제거..
				e.preventDefault();
				
				let id = document.querySelector("#idInput").value;
				let pw = document.querySelector("#pwInput").value;
				
				let obj = {id : id
							, pw : pw}
				
				fetchPost('/loginAction', obj, loginCheck)
			})
			
			
		})
		
		function loginCheck(map){
			// console.log(map);
			
			if(map.result == 'success'){
				location.href = "/board/list";
			}else{
				msg.innerHTML = map.msg;
			}
		}
	
	</script>
			
			
	
	    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sign-in/">

    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="../resources/css/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<main class="form-signin w-100 m-auto">
	
  <form method="post" name='signinForm' action="./loginAction">
    <img class="mb-4" src="../resources/img/common.jpeg" alt="" width="100" height="120">
    <h1 class="h3 mb-3 fw-normal">로그인</h1>
	<div id="msg" style='color : red'></div>
    <div class="form-floating">
      <input type="text" class="form-control" id="idInput" name="id" placeholder="ID" >
      <label for="id">ID</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="pwInput" name="pw" placeholder="Password">
      <label for="pw">Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> 기억해줘
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit" id="btnLogin">로그인</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2023</p>
    
    
  </form>
  
  <form method="post" name='signupForm' style='display:none' action="./loginAction">
    <img class="mb-4" src="../resources/img/주빵맨.JPG" alt="" width="200" height="200 ">
    <h1 class="h3 mb-3 fw-normal">회원가입</h1>
	<div id="msg" style='color : red'></div>
    <div class="form-floating">
      <input type="text" class="form-control" id="id" name="id" placeholder="ID" >
      <label for="id">ID</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="pw" name="pw" placeholder="Password">
      <label for="pw">Password</label>
    </div>
    
    <button class="w-100 btn btn-lg btn-primary" type="submit" id="btnSignup">회원가입</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2023</p>
    
    
  </form>
  
  <button id="btnSignupView">회원가입</button>
 	<button id="btnSigninView">로그인</button>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    
  </body>
</html>
