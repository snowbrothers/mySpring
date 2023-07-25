<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Strongly Typed by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>No Sidebar - Strongly Typed by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/css/main.css" />
		<script src='/resources/js/jquery-3.7.0.js'></script>
		<script type="text/javascript">
		$(document).ready(function(){
			
			$('.photoReview').css({
                width :'100px'
                ,height:'100px'
            })
			
            
             $(".recenetSearch").css({
                width : '200px'
                ,height : '200px'
            })
			
		});
		</script>
	</head>
	<body class="no-sidebar is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">
					<div class="container">

						<!-- Logo -->
							<h1 id="logo"><a href="index.html">냉장고를 부탁해</a></h1>
							<p>미처 다 표현하지 못한 부분은 마음의 눈으로 봐주시면 감사하겠습니다..</p>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li><a class="icon solid fa-home" href="index.html"><span>홈페이지</span></a></li>
									<li>
										<a href="#" class="icon fa-chart-bar"><span>요리교실</span></a>
										<ul>
											<li><a href="#">Lorem ipsum dolor</a></li>
											<li><a href="#">Magna phasellus</a></li>
											<li><a href="#">Etiam dolore nisl</a></li>
											<li>
												<a href="#">Phasellus consequat</a>
												<ul>
													<li><a href="#">Magna phasellus</a></li>
													<li><a href="#">Etiam dolore nisl</a></li>
													<li><a href="#">Phasellus consequat</a></li>
												</ul>
											</li>
											<li><a href="#">Veroeros feugiat</a></li>
										</ul>
									</li>
									<li><a class="icon solid fa-cog" href="left-sidebar.html"><span>마이페이지</span></a></li>
									<li><a class="icon solid fa-retweet" href="right-sidebar.html"><span>로그인</span></a></li>
									<li><a class="icon solid fa-sitemap" href="no-sidebar.html"><span>망한 요리 게시판</span></a></li>
								</ul>
							</nav>

					</div>
				</section>

			<!-- Main -->
				<section id="main">
					<div class="container">
						<div id="content">

							<!-- Post -->
								<article class="box post">
									<header>
										<h2><strong>! 초간단</strong> 3분같은 5분조금넘는 계란말이 레시피<br /></h2>
									</header>
									<span class="image featured"><img src="/resources/img/eggmary.jpg" alt="" /></span>
									
									<hr>
									<h2>요리 소개</h2>
									<p>간단한 계란말이 입니다. 조리방법은 쉽습니다.</p>
								
									
									<hr>
									
									<div id="ingredients">
									<h2>재료</h2>
									
									<ul>
										
										<b>[재료]</b>																				
										<li>계란</li>
										<li>설탕</li>
										
									
									</ul>
									
									</div>
									
									
									<hr>
									
									<div id="cookStepContainer">
									<h2>- 조리 순서</h2>
									
									<div id="cookStep">
										
										<!-- 해당 게시글의 요리 순서를 조회해서 하나씩 뿌려준다.. 사진 + 내용 -->
										<!-- 자바스크립트로 반복 배운거 활용하면 될듯?  -->
										<div id="stepDiv1" class="view_step_cont step1">
											<div id="stepdescr1"><strong>STEP1 </strong> 계란과 설탕을 준비, 요리할 준비를 해주세요</div>
											<div id="stepImg1"><img alt="" src="/resources/img/계란.jpg">
											</div>
										</div>
										
										
										<div id="stepDiv2" class="view_step_cont step2">
											<div id="stepdescr2"><strong>STEP2 </strong> 후라이팬에 기름을 두르고 불위에 올려주세요</div>
											<div id="stepImg2"><img alt="" src="/resources/img/후라이팬기름.jpg">
											</div>
										</div>
										</div>
										
									
									</div>
									
									
									<hr>
									
									<div id="view_writer">
									<h2>- 작성자 정보</h2>

									작성자 이름 & 간단한 자기소개글 % 구독버튼
									
									</div>
									
									
									
									<hr>
									
									
										
									<div class="view_reply">
										
									<!-- 사진이 등록되어 있는 댓글의 개수 조회 -->	
									<!-- 사진을 클릭하면 해당 모달창을 띄워서 사진과 후기를 보여 줄 수 있는 페이지 만들기 ! -->									
									<h2>- 포토리뷰 200 건</h2>	
									
									<p><img class="photoReview" src="/resources/img/겨란말이.jpeg" alt="">
									<img  class="photoReview" src="/resources/img/계란부침개.jpeg" alt="">
									<img  class="photoReview"src="/resources/img/계란찜.jpeg" alt=""></p>
									
									
									</div>

	
									<div class="view_reply">									
									<!-- 총 댓글 수 조회 건수 표시 -->
									<h2>- 요리 후기 104 건</h2>		
									
									<!-- rec_reply 테이블에서 댓글 조회  -->
									<ul>
										<li></li>
									</ul>
									
									<hr>
									</div>
									
									<!-- 클릭하면 해당 게시물 페이지로 이동 할 수 있도록..  -->
									<div id="recentView">
									<h2>최근 방문한 레시피</h2>
										<img class="recenetSearch" src="/resources/img/김치찌개.jpeg" alt="">
       									 <img class="recenetSearch" src="/resources/img/삼겹살.jpeg" alt="">
									</div>
								
								</article>

						</div>
						
						
					</div>
				</section>

			<!-- Footer -->
				<section id="footer">
					<div class="container">
						<header>
							<h2>Questions or comments? <strong>Get in touch:</strong></h2>
						</header>
						<div class="row">
							<div class="col-6 col-12-medium">
								<section>
									<form method="post" action="#">
										<div class="row gtr-50">
											<div class="col-6 col-12-small">
												<input name="name" placeholder="Name" type="text" />
											</div>
											<div class="col-6 col-12-small">
												<input name="email" placeholder="Email" type="text" />
											</div>
											<div class="col-12">
												<textarea name="message" placeholder="Message"></textarea>
											</div>
											<div class="col-12">
												<a href="#" class="form-button-submit button icon solid fa-envelope">Send Message</a>
											</div>
										</div>
									</form>
								</section>
							</div>
							<div class="col-6 col-12-medium">
								<section>
									<p>Erat lorem ipsum veroeros consequat magna tempus lorem ipsum consequat Phaselamet
									mollis tortor congue. Sed quis mauris sit amet magna accumsan tristique. Curabitur
									leo nibh, rutrum eu malesuada.</p>
									<div class="row">
										<div class="col-6 col-12-small">
											<ul class="icons">
												<li class="icon solid fa-home">
													1234 Somewhere Road<br />
													Nashville, TN 00000<br />
													USA
												</li>
												<li class="icon solid fa-phone">
													(000) 000-0000
												</li>
												<li class="icon solid fa-envelope">
													<a href="#">info@untitled.tld</a>
												</li>
											</ul>
										</div>
										<div class="col-6 col-12-small">
											<ul class="icons">
												<li class="icon brands fa-twitter">
													<a href="#">@untitled</a>
												</li>
												<li class="icon brands fa-instagram">
													<a href="#">instagram.com/untitled</a>
												</li>
												<li class="icon brands fa-dribbble">
													<a href="#">dribbble.com/untitled</a>
												</li>
												<li class="icon brands fa-facebook-f">
													<a href="#">facebook.com/untitled</a>
												</li>
											</ul>
										</div>
									</div>
								</section>
							</div>
						</div>
					</div>
					<div id="copyright" class="container">
						<ul class="links">
							<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
						</ul>
					</div>
				</section>

		</div>

		<!-- Scripts -->
			<script src="/resources/js/jquery.min.js"></script>
			<script src="/resources/js/jquery.dropotron.min.js"></script>
			<script src="/resources/js/browser.min.js"></script>
			<script src="/resources/js/breakpoints.min.js"></script>
			<script src="/resources/js/util.js"></script>
			<script src="/resources/js/main.js"></script>

	</body>
</html>