<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
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
			
			
			pwCheck.addEventListener('blur', function(){
				
				if(!signUpPw.value){
					signupMag.innerHTML = '비밀번호르 입력해주세요';
				}
				if(!pwCheck.value){
					signuupMsg.innerHTML = '비밀번호 확인을 입력 해주세요'
				}
				if(signUpPw.value == pwCheck.value){
					pwCheckRes.value=1;
				}else{
					signuupMsg.innerHTML = '비밀번호가 일치하지 않습니다.'
					pwCheck.focus();
					pwCheck.value='';
					pwCheckRes.value=0;
				}
				
				
				// 비밀번호 체크 -> 서버 호출 필요 x
			})

			
			signUpId.addEventListener('blur', function(){
				if(!signUpId.value){
					signupMsg.innerHTML = '아이디를 입력 해주세요';
					return;
				}
				
				
				let obj = {id : signUpId.value};
				console.log("아이디 체크 ", obj);
				
				fetchPost('/idCheck', obj, (map)=>{
					
					if(map.result == 'success'){
						console.log(map.msg);
						// 아이디 사용 가능
						idCheckRes.value = '1';
						signUpName.focus();
					}else{
						idCheckRes.value= '0';
						signUpId.focus();
						signUpId.value='';
						// 아이디 사용 불가능
					}
					
					signupMsg.innerHTML = map.msg;
				
					
				});
				
				// id 체크 -> 서버 연동 필요
			})	
			
			
			btnSignup.addEventListener('click', function(e){
				
				e.preventDefault();
				
				let id = document.querySelector("#signUpId").value;
				let pw = document.querySelector("#signUpPw").value;
				let name = signUpName.value;
				
				
				if(!id){
					signupMsg.innerHTML = '아이디를 입력해주세요.';
				}
				if(!pw){
					signupMsg.innerHTML = '비밀번호를 입력해주세요.';
				}
				if(!name){
					signupMsg.innerHTML = '이름을 입력해주세요.';
				}
				
				// 아이디 중복체크 확인
				if(idCheckRes.value != 1){
					signupMsg.innerHTML = '비밀번호 중복체크를 해주세요';
					signUpId.focus();
					return;
				}
				
				// 비밀번호 일치 확인
				if(idCheckRes.value != 1){
					signupMsg.innerHTML = '비밀번호가 일치하는지 확인 해주세요.';
					pwCheck.focus();
					return;
				}
				
				let obj = {id : id
							, pw : pw
							, name : name}
				
				console.log('obj : ', obj);
				
				fetchPost('/register', obj, (map)=>{
					
					if(map.result == 'success'){
					
						location.href='/login?msg='+map.msg;
						
					}else{
						signupMsg.innerHTML = map.msg;
					}
					
					console.log(map)
				
				});
				
			})
			
		})
		
		function loginCheck(map){
			// console.log(map);
			
			if(map.result == 'success'){
				location.href = "/board/list";
			}else{
				msg.innerHTML = map.msg;
			}
			
			console.log(map)
			
		}
	
		function idCheck(map){
			
			if(map.result == 'success'){
				console.log(map.msg);
				// 아이디 사용 가능
				idCheckRes.value = '1';
			}else{
				idCheckRes.value= '0';
				// 아이디 사용 불가능
			}
				signupMsg.innerHTML = map.msg;
			
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
      
      .middle{
	    border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
        margin-bottom: 0px;
        
	  }
      .start  {
        margin-bottom: -1px;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
      }
	  
      .end  {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
        
       
  
  }
    /* #signUpPw {
    	margin-bottom: 0;
    	}  */
    </style>

    
    <!-- Custom styles for this template -->
    <link href="../resources/css/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<main class="form-signin w-100 m-auto">
  <form method="post" name='signinForm' action="./loginAction">
 	
 	<input type="hidden" value="0" id="idCheckRes"> 
 	
 	<input type="hidden" value="0" id="pwCheckRes">
  
	<div id="msg" >${msg }</div>	
    <img class="mb-4" src="../resources/img/common.jpeg" alt="" width="100" height="120">
    <h1 class="h3 mb-3 fw-normal">로그인</h1>
	
    <div class="form-floating">
      <input type="text" class="form-control start" required="required" id="idInput" name="id" placeholder="ID" >
      <label for="id">ID</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control end"  required="required" id="pwInput" name="pw" placeholder="Password">
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
	<div id="signupMsg" ></div>
    <div class="form-floating">
      <input type="text" class="form-control start" required="required" id="signUpId" name="id" placeholder="ID" >
      <label for="signUpId">ID</label>
    </div>
    <div class="form-floating">
      <input type="text" class="form-control middle" required="required" id="signUpName" name="name" placeholder="Name" >
      <label for="signUpName">Name</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control middle" required="required" id="signUpPw" name="pw" placeholder="Password">
      <label for="signUpPw">Password</label>
    </div>
    
    <div class="form-floating">
      <input  type="password" class="form-control end" id="pwCheck" placeholder="Password">
      <label for="pwCheck">PasswordCheck</label>
    </div>
    
    <button class="w-100 btn btn-lg btn-primary" type="submit" id="btnSignup">회원가입</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2023</p>
    
    
  </form>
  
  <button id="btnSignupView">회원가입</button>
 	<button id="btnSigninView">로그인</button>
 	
 	<%
    String clientId = "kMpAeqzzDn_neSLaFX2C";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/login/naver_callback", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    
    // 요청 URL -> 네이버 로그인 및 사용자 정보 제공 동의 -> 콜백으로 코드를 제공
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
 	
 	<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
</main>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    
  </body>
</html>
