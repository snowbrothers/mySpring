<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>
<title>Bulletin Board Detail Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="/resources/css/view.css" rel="stylesheet">
<script src="/resources/js/view.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;500&family=Nanum+Gothic&family=Noto+Sans+KR&family=Orbit&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Nanum+Gothic&family=Orbit&display=swap" rel="stylesheet">
<style>
	.recipeFinishImg {
		
		justify-content: center;
	    display: flex;
	    margin-bottom: 20px;
	    padding-top: 20px;
	    border-top: 2px solid;
	    border-color: #00000054;
	
	} 
</style>
<script type="text/javascript">
  

	window.addEventListener('load', function(){
  			
		const moreButton = document.getElementById('moreButton');
		  const reduceButton = document.getElementById('reduceBtn');
		  const cookingReviewSection = document.getElementById('cookingReviewSection'); // 요리 리뷰 부분의 ID를 추가합니다.

		  moreButton.addEventListener('click', function() {
		    generalCommentDiv.style.display = 'block'; // 댓글 섹션을 보이게 합니다.
		    moreButton.style.display = 'none'; // "댓글 전체보기" 버튼을 숨깁니다.
		    reduceButton.style.display = 'block'; // "댓글 줄이기" 버튼을 보이게 합니다.
		  });

		  reduceButton.addEventListener('click', function() {
		    moreButton.style.display = 'block'; // "댓글 전체보기" 버튼을 보이게 합니다.
		    reduceButton.style.display = 'none'; // "댓글 줄이기" 버튼을 숨깁니다.
			
			  getRecipeReply();

			  cookingReviewSection.scrollIntoView({ behavior: 'auto' });
		  });
		  
		  // 일반댓글 ==============================================
		  
		  const moreGRButton = document.getElementById('moreGRButton');
		  const reduceGRButton = document.getElementById('reduceGRBtn');
		  const generalReplyContainer = document.getElementById('generalReplyContainer'); // 요리 리뷰 부분의 ID를 추가합니다.

		  moreGRButton.addEventListener('click', function() {
			  generalReplyDiv.style.display = 'block'; // 댓글 섹션을 보이게 합니다.
		    moreGRButton.style.display = 'none'; // "댓글 전체보기" 버튼을 숨깁니다.
		    reduceGRButton.style.display = 'block'; // "댓글 줄이기" 버튼을 보이게 합니다.
		  });

		  reduceGRButton.addEventListener('click', function() {
			  moreGRButton.style.display = 'block'; // "댓글 전체보기" 버튼을 보이게 합니다.
			  reduceGRButton.style.display = 'none'; // "댓글 줄이기" 버튼을 숨깁니다.
			
			  getGeneralReply();

			  generalReplyContainer.scrollIntoView({ behavior: 'auto' });
		  });
		  
		
		//=========================================================================================
			
			// 상단 사진 이미지 출력
			getFileList();
			
			// 재료 정보 출력
			getMaterial();
			
			// 요리 순서 출력
			getRecipeStep();
			
			// 댓글 출력 
			getRecipeReply();
			
			
			
			// 별점
			initializeStarRatings();
			
			// 일반 댓글 출력
			getGeneralReply();
			
		 
			// 좋아요 버튼 클릭 시 실행되는 함수
			likeBtn.addEventListener('click', function(){
				
				
				LikeRecipe();

			});
			
			/*
			reduceBtn.addEventListener('click', function(){
				
				getRecipeReply();
			});*/
			
			
			
			// 댓글 작성 클릭시 실행되는 함수
			/*replyWriteBtn.addEventListener('click',function(){
				
				// 댓글 작성 함수
				replyWrite();
				
			});*/
			
			
			
			//파일업로드
			replyPhotoupload_Test.addEventListener('click', function(){
				
				event.preventDefault();
				
				let b_no = document.querySelector('#b_no').value;
				
				
				
				
				document.querySelector('#star').value = document.querySelector('.starDiv').dataset.max;
				
				
				
				
				let formData = new FormData(replyPhotoForm_Test);
				
				console.log("b_no : ", b_no);
				
				console.log("formData : ", formData);
				
				console.log("writer : ", writer);
				
				console.log("reply : ", reply);
				
				
				
				
				
				
				
				for(var pair of formData.entries()){
					
					if(typeof(pair[1]) == 'object') {
						let fileName = pair[1].name;
						let fileSize = pair[1].fileSize;
						
						console.log('fileName', fileName);
						console.log('fileSize', fileSize);
						
					}
					
				}
				
				fetch('/file/photoReview_Test'
						, {
							method : 'post'
							, body : formData
				})
					.then(response => response.json())
					.then(map => fileuploadRes_Test(map));
				
			}); // 
			
			
			// 별점 전송
			  $(".starDiv").score({
			    starColor: "gold",
			    editable: true,
			    integerOnly: true,
			    send: {
			      sendable: true,
			      name: "star",
			    },
			    display: {
			      showNumber: true,
			    },
			  });

			  // .starDiv 클릭 이벤트 리스너
			 /* $(".starDiv").on("click", function () {
			    // Get the selected star rating value
			    const starRating = $(this).data("score");

			    // Update the hidden input field with the selected rating value
			    $("#star").val(starRating);
			  }); */
			//*/
			
			
  
			
			
	        });
			
	
		
		// 일반 댓글 작성 함수
		
		function grWrite(){
			
			event.preventDefault();
			
			let b_no = document.querySelector('#b_no').value;
			let content = document.querySelector('#content').value;
			let replyer = document.querySelector('#replyer').value;
			
			let obj = {b_no : b_no
					, content : content
					, replyer : replyer}
			
			fetchPost('/reply/grWrite', obj, grRes);
			
		}
	
		function grRes(map){
			
			getGeneralReply();
			
			if(map.result == 'success'){
				alert("댓글 입력 성공");
			
			}else{
				alert("댓글 입력 중 오류 발생");
			} 
			
		}
	
	
	
		
		
		function fileuploadRes_Test(map){
			// 댓글 출력 
			getRecipeReply();
		console.log(map.result);
	}
		
		
		
		
		
		
		// 댓글 작성 함수
	   function replyWrite(){
		
		   event.preventDefault(); // Prevent the default form submission behavior (page refresh)
		   
			let bno = document.querySelector('#b_no').value;
			let reply = document.querySelector('#replyContent').value;
			let writer = document.querySelector('#replyer').value;
			
			let obj = {bno : bno
					, reply : reply
					, writer : writer}
			
			console.log("bno", bno);
			console.log("reply", reply);
			console.log("writer", writer);
			
			// url : /reply/insert : 요청경로
			// obj : json 형식으로 전달할 데이터
			// callback : 응답을 받아 실행할 함수 / 콜백함수
			fetchPost('/reply/write', obj, replyRes);
			
			
			// =========================================================== 파일 업로드 합치기
			
		}
		
		
		
	
		function fileuploadRes(map){
	   
	   			console.log(map.result);
	   			
	   
   		}
		
		
		function fetchPost(url, obj, callback){
			
		try {
			
			fetch(url
					,{method : 'post'
					, headers : {'Content-Type' : 'application/json'}
					, body : JSON.stringify(obj)
			})
			// 요청결과 json 문자열을 javascript 객체로 반환
			.then(response => response.json())
			// 콜백함수 실행
			.then(map => callback(map));
			
		} catch (e) {
			console.log(e);
		}	
	}
   
   
	   
  	
	   
	   function replyRes(map){
		      // 성공 : 리스트 조회 및 출력
		      // 실패 : 메세지 출력
		      console.log('map', map);
		      
		      if (map.result == "success"){
		    	 
		    	  getRecipeReply();
		         
		         // 댓글 등록, 수정 후 화면 조회 시 입력창 초기화
		         document.querySelector('#reply').value = "";
		         document.querySelector('#replyer').value = "";
		      } else {
		         alert("다른내용");
		      }
		   }
   
	
   
   
   // 레시피 저장 함수
   function LikeRecipe(){
	   
	   	let m_no = document.querySelector('#m_no').value; // 세션 정보에서 m_no 를 받아온다면 저장
		let b_no = document.querySelector('#b_no').value; // 화면에서 게시글의  b_no 를 읽어와서 저장
	   
		let obj = {m_no : m_no
				, b_no : b_no }
		
		console.log("m_no :" , m_no); // 확인 완료
		console.log("b_no :" , b_no);
		
		
		fetchPost('/recipe/likeRecipe', obj, LikeRecipeRes);
   }
   
	// 레시피 저장을 알려주는 함수
	   function LikeRecipeRes(map){
	   	
			alert(map.message);
	   	
	   }
			
		
		
		
		 
	function getGeneralReply(){
		
		let b_no = document.querySelector('#b_no').value;
   		
		
   		// fetch 사용
   		// 정보를 가져와서 함수에 파라메터로 넣는다.
   		fetch('/reply/generalReply/' + b_no)
   			.then(response => response.json())
   			.then(map => viewGeneralReply(map));
		
	}
	
	
	function viewGeneralReply(map){
		
		console.log('map.generalReply', map.generalReply)
	
		let content = '';
		
		 let showAll = false;

		  // Function to generate the HTML content for a single item
		  function generateHtml(item) {
		    
			let gr_no = item.gr_no; // comment number
		    let regdate = item.regdate; // Date Created
		    let replyer = item.replyer; // detail
		    let content = item.content; // Writer

		    // Let's take it to the input hidden and make it available when
			// clicking on it.
		    // We need to get the picture associated with the comment later.
		    return (
		    		
	    		'<div class="generalHead margin-B30" style="border-bottom: 1px solid; border-color: #a52a2a52">' 
	            + '<b style="font-size:17px font-size: 14px; margin-bottom: 5px; ">'+replyer+'</b> | <span style="font-size:14px; color: #0000007a;">'+regdate+'</span>'
	            
	            + '<div style="font-size:14px; margin-bottom:5px; margin-top: 10px; margin-left: 5px;" class="generalContent">'+content+'</div>'
	          	+'</div>'
		      
		    );
		    
		  }

		  // Function to display all items in map.replyList
		  function displayGReply() {
		    showAll = true;
		    content = '';
		    map.generalReply.forEach(function (item) {
		      content += generateHtml(item);
		    });
		    generalReplyDiv.innerHTML = content;
		    
		  }

		 
		  
		  // If there is a value specified when putting it to the map in
			// the controller...
		  if (map.generalReply.length > 0) {
		    // Show the first five items initially
		    for (let index = 0; index < Math.min(5, map.generalReply.length); index++) {
		      const item = map.generalReply[index];
		      content += generateHtml(item);
		    }
		    generalReplyDiv.innerHTML = content;
	

		    // Add event listener to the '더보기' button
		    const moreGRButton = document.getElementById('moreGRButton');
		    moreGRButton.addEventListener('click', displayGReply);
		  } else {
		    content = '댓글이 없습니다.. 첫번째 후기를 남길 기회에요!';
		    generalReplyDiv.innerHTML = content;
		  }
		
		
		
		/*map.generalReply.forEach(function(item, index){
							
				 content +=
					
				'<div class="generalHead margin-B30" style="border-bottom: 1px solid; border-color: #a52a2a52">' 
	            + '<b style="font-size:17px font-size: 14px; margin-bottom: 5px; ">'+item.replyer+'</b> | <span style="font-size:14px; color: #0000007a;">'+item.regdate+'</span>'
	            
	            + '<div style="font-size:14px; margin-bottom:5px; margin-top: 10px; margin-left: 5px;" class="generalContent">'+item.content+'</div>'
	          	+'</div>'
		  
	});
		
		 generalReplyDiv.innerHTML = content;*/
		}
	
	
	
	//-----------------------------------------------------------------------------------------------
	
	// 이미지 보여주기 
	
	function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);

          // Remove any previously added images
          var container = document.querySelector("div#image_container");
          while (container.firstChild) {
            container.removeChild(container.firstChild);
          }

          container.appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
	

   </script>
<body>

	<script src="https://kit.fontawesome.com/4863a16a12.js"
		crossorigin="anonymous"></script>

	<div class="viewContainer bor">

	<input id="m_no" type="hidden" value="2">
	

	<!-- 상단 -->
	<div class="header" >
		<!-- Insert representative photo here -->
		<div id="headImgDiv"></div>
		<span><button id="likeBtn">♡  찜하기</button></span>
		<div id="headTitle"><h1 id="h1-title" style="margin-top: 30px;">${board.title}</h1></div>
		
		<div id="headIntroDiv">

		<p>${board.intro}</p>
		</div>
		
		<div id="headCookTip">
		<p>${board.cooktip}</p>
		</div>
		
		<div class="videoLinkDiv">
			<iframe width="560" height="315" src="https://www.youtube.com/embed/${board.videoCode}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
		</div>
	</div>


	<!-- 재료 -->


	<div class="material margin-T12">
		<div class="sectionTitle MB40T20"><h3 class="h3FW800">재료 <span class="italicTitle">Material</span></h3></div>
		


		<div class="materialContent elementsMargin" id="materialContentDiv"></div>
		
    	
	</div>


	<!-- 조리 순서 -->
	<div class="cooking-order margin-T12">
		<div class="sectionTitle MB40T20"><h3 class="h3FW800">조리순서 <span class="italicTitle">Step</span></h3></div>

		<div class="recipeStep elementsMargin" id="recipeStepDiv">
		
		</div>
		
		
		<!-- 요리 완성사진 -->
		<div class="recipeFinishImg" id="recipeFinishImg">
						
				
		</div>


		<div class="regdateDiv regDottd" id="regdate">
			<span style="float:left; margin-top: 10px; margin-left: 10px"><b>작성일</b> : ${board.regdate }&nbsp;<b>|</b>&nbsp;<b>수정일</b> : ${board.updatedate }</span>
		</div>

	</div>

	<!-- 작성자 정보 -->

	<div class="writerInfoDiv margin-T12">
		<div class="sectionTitle MB40T20"><h3 class="h3FW800">레시피 작성자 <span class="italicTitle">Writer</span></h3></div>
		<div id="MemberInfoDiv ">${board.nickname}</div>
	
	</div>

	<!-- 요리후기  -->
	<div id="cookingReviewSection" class="cooking-review margin-T12">
		
		<!-- 포토리뷰 -->
		<div class="photo-review">

			<h3 class="h3FW800">포토리뷰 <span id="photoReviewCnt" class="cntClass"></span></h3>

			<div id="photoReviewDiv">
			</div>

		</div>
	</div>
		<!-- 일반 요리 후기 -->
			
			
		<div class="general-commentContainer margin-T12">	
		<div style="margin-left: 60px; margin-bottom: 10px;" class="sectionTitle MB40T20"><h3 class="h3FW800">요리후기 <span id="replyCnt" class="cntClass"></span></h3></div>
			<div class="general-commentContents">
			<div class="general-comment margin-T12" id="generalCommentDiv"></div>
			
			
			<div class="d-grid gap-2 col-6 mx-auto">
			  <button id="moreButton" type="button" class="btn btn-success">댓글 전체보기</button>
			  <button id="reduceBtn" type="button" class="btn btn-success" style="display:none;">댓글 줄이기</button>
			</div>
			</div>
			
			
			
		</div>
		
		
		<!-- 댓글 작성 부분, 사진 첨부 추가 -->
		
		<!-- <button id="moreButton">더보기</button> -->
		<div class="comment-writing margin-T12">


			
			<form style="height:130px;" id="replyPhotoForm_Test" enctype="multipart/form-data" name="replyPhotoForm_Test">
					
						
				<div style="position: absolute; margin-top: 110px;" class="starDiv" data-max="5"></div>
					<input id="b_no" name ="b_no" type="hidden" value="${board.b_no}">
					<input type="hidden" id="star">
				
					<input style="display:none;" type="file" name="files" id="image" accept="image/*" onchange="setThumbnail(event);">
				<div id="image_container"></div>			
					<input type="hidden" id="writer" name="writer" value="나는작성자"> 
				
					<img  src="https://recipe1.ezmember.co.kr/img/pic_none3.gif" alt="파일첨부" width="100" height="100" onclick="document.getElementById('image').click();" style="cursor:pointer; margin-right: 10px;">
					<textarea id="reply" name="reply" class="form-control"
						placeholder="다양한 요리 후기를 작성해주세요!"
						style="height: 100px; width: 100%; resize: none; border-radius: 0px;"></textarea><span ><button class="writeBtn" style="width:85px; height: 77%; " id="replyPhotoupload_Test" value="나는 후기">작성</button></span>
			
			</form>	
		</div>
		
		
		<!-- 일반댓글 표시 -->
		
		<div  class="generalReply margin-T12" id="generalReplyContainer">
			
			<div class="sectionTitle MB40T20"><h3 class="h3FW800">한줄댓글 <span class="italicTitle">Reply</span></h3></div>
			
			<div id="generalReplyDiv"></div>
			<div class="d-grid gap-2 col-6 mx-auto">
			  <button id="moreGRButton" type="button" class="btn btn-success">댓글 전체보기</button>
			  <button id="reduceGRBtn" type="button" class="btn btn-success" style="display:none;">댓글 줄이기</button>
			</div>
		
		
			<div class="generalReplyWrite bodySection ">
			
				
				<form id="grForm">
					<input id="b_no" name ="b_no" type="hidden" value="${board.b_no}">
					<input type="hidden" id="replyer" name="replyer" value="작성자입력">
					<textarea style="width: 90%; resize: none; border-radius: 1px; border: 1px solid; border-color: #0000004d;" id="content" name="contnet" rows="" cols="" placeholder="댓글을 작성해주세요!" >한줄 댓글을 작성해주세요</textarea>
				
					<button id="grBtn" onclick="grWrite()">댓글작성</button>
			
				</form>
			
			</div>
			
			
		
		</div>

	
	<!-- 모달창 -->
	<div id="ingredientModal" class="modal">
		<div style="width: 500px;" class="modal-content ">
			<span class="close" onclick="closeModal()">&times;</span>
			<div class="ingreModal_wrap">
			<div class="ingredientImgDiv" id="ingredientTop">
				<!-- 재료 사진 출력  -->
			</div>

			<div class="ingredientInfoDiv" id="ingredientInfoDiv">
				<!-- 재료 정보가 여기에 출력될 것입니다. -->
			</div>
			</div>
		</div>
	</div>


	<div id="photoReviewModal" class="modal">
		<div style="padding-top: 0px; "class="modal-content">
			<span style="margin-left: 1030px; display: inline-block;" class="close" onclick="closeModal()">&times;</span>
			<div style="display:flex; margin-top: 30px">
			
			<div id="container">
			
			<div id="photoReviewImgDiv">
			
			</div>
			<div id="photoReviewReplyDiv"></div>
			</div>
		
		
			<!-- 전체 포토리뷰가 표시되는 부분 -->
			<div id="photoReviewModalList">
			</div>	
			</div>
			</div>
		

	</div>
	
	</div>
	
	
	<!-- 최근 방문한 레시피 -->
	<div class="recently-viewed">
		<!-- Display recently viewed recipes as clickable images -->
		<a href="link-to-recipe1"><img src="path/to/recipe1.jpg"
			alt="Recipe 1"></a> <a href="link-to-recipe2"><img
			src="path/to/recipe2.jpg" alt="Recipe 2"></a>
		<!-- Add more recently viewed recipes if needed -->
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
</body>
</html>
