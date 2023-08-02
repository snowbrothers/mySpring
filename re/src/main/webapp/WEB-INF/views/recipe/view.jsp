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

	.ingredientImgDiv{
		width: 100%;
		height: 100%;
		margin-top: 30px;
	}

	.materialName{
 			
 		font-weight: 900;
 		font-family: 'IBM Plex Sans KR';
 		
 	}
 		

	.italicTitle{
		
		font-size: 20px;
    	font-style: italic;
    	color: #f7863b61;
	}

	.writeBtn{
		width: 100px;
    	background-color: #F7863B;
    	height: 100%;
    	color: white;
    	font-weight: 800;
    	border: 1px;
	}

	.media-body {
		margin-bottom: 30px;
		border-bottom: 1px solid;
		border-color: #00000045;
	}

	.media-heading{
		font-size: 15px;
		
	}
	
	.reply-regdate{
		margin-left: 10px;
		opacity: 50%
	}
	
	.reply-regdate-star{
		margin-left: 10px;
		
	}
	
	.reply-star{
		font-size: 18px;
	}

	.info_name_f{
 			font-size: 18px;
 			color: #F7863B;
 		}
 		
 	.reply_list_cont{
 		font-size:13px;
 	}	

	

<!-- 모달창 포토리스트 -->

	
	.roket {
		margin-left: 10px;
	}
	
	.stepFont-Family {
		font-family: 'IBM Plex Sans KR';
		
	}
	
	.photoList img{
            border: 1px solid;
            width: 100px;
            height: 80px;
        }

		.w100{
		
			width : 100px;
			height : 100px;
		
		}
		
		.w136{
			width: 136px;
			height : 136px;
		}
		
		.w20p{
			width: 20%;
			height: 100%
		}
		
		.MB40T20{
			margin-top: 10px;
			margin-bottom: 40px;
		}
		
		/*안의 요소 들여쓰는 마진*/
		.elementsMargin{
			margin: 30px
		}
		
		.ingreModal_wrap{
			
			width: 100%;
			
		}
		
		.ingreModal_img{
			border-radius: 50%;
			width: 100px;
			height: 100px;
			margin-left: 20px;
			
		}
		
		.ingreModalName{
			font-size: 40px;
			vertical-align: middle;
		}
		
		.ingredientInfoDiv th{
			   
		    background: #f7863b8a;
		    font-weight: 500;
		    padding: 12px 0 12px 40px;
		    font-size: 15px;
		    border-top: 1px solid;
		    border-color: #995c307d;
		}
		
		.ingredientInfoDiv td {
		    font-weight: normal;
		    padding: 12px 20px;
		    font-size: 15px;
		}
		
		.ingredientInfoDiv{
			margin-top: 20px;
   		 	border-top: 1px solid;
		}
		
		
<!-- 이미지 미리보기 -->

	.bodySection{
	margin-top: 20px;
	}

	#image_container{
    /* Set the container size to match the image size */
    width: auto;
    height: auto;
    max-width: 30%;
    max-height: 30%;
	}

/* Set the image to be responsive inside the container */
	#image_container img {
	    width: 30%;
	    height: 30%;
	    object-fit: contain;
	}

<!-- ----------------->


		#generalReplyContainer{
			margin-top: 20px;
		}
		
		#viewContainer {
			margin : 0 auto;
		}
			
		.material-span {
			/* Add some padding on the right side of the text "Eggs" */
			padding-left: 0px;
			float: right;
			margin-right: 10px;
			/* Alternatively, you can use margin to create a gap between the text and <span> */
			/* margin-right: 10px; */
		}
		
		#roketBtn {
			float: right;
		}
		
		
		#headIntroDiv {
			margin-top : 30px;
			width : 100%;
		}
		
		#headTitle {
		  display: flex;
		  align-items: center; /* Align items vertically at the center */
		  justify-content: center;
		}
		
		#h1-title {
		  margin: 0; /* Remove default margin for <h1> */
		  font-family: 'IBM Plex Sans KR', sans-serif;
		}
		
		#likeBtn {
		  margin-top : 7px;
		  border: 1px solid;
		  border-color: #d79587;
		  font-weight: 600;
		  color: #F7863B;
		  font-size: 13px;
		}
		
		.h3FW800 {
 			font-weight: 800;
 			font-family: 'IBM Plex Sans KR', sans-serif;
 		}
		
		/* 모달 스타일 */
			.modal {
			    display: none;
			    position: fixed;
			    z-index: 1;
			    left: 0;
			    top: 0;
			    width: 100%;
			    height: 100%;
			    overflow: auto;
			    background-color: rgba(0, 0, 0, 0.4);
			    font-family: 'Noto Sans KR';
			}
			
			.modal-content {
			    display: flex;
			    flex-wrap: wrap; /* 공간 부족 시 항목을 다음 줄로 랩핑 */
			    justify-content: space-between; /* 항목을 수평으로 정렬하고 사이에 공간을 추가 */
			    background-color: #fefefe;
			    margin: 15% auto;
			    padding: 20px;
			    border: 1px solid #888;
			    width: 500px;
			    max-height: 80%; /* 모달 내용의 최대 높이 제한 */
			    overflow-y: auto; /* 내용이 넘칠 경우 수직 스크롤바 추가 */
			}
			
			#container {
			    flex-basis: 70%; /* 가능한 가로 공간의 70%를 차지 */
			    max-width: 70%;
			    height: 100%;
			}
			
			#photoReviewModalList {
			    flex-basis: 30%; /* 가능한 가로 공간의 30%를 차지 */
			    max-width: 30%;
			    height: 100%;
			    overflow-y: auto; /* 내용이 넘칠 경우 수직 스크롤바 추가 */
			}
			
			.close {
			    color: #aaa;
			    font-size: 28px;
			    font-weight: bold;
			    align-self: flex-start; /* 닫기 버튼을 상단에 정렬 */
			    margin-left: 420px;
			}
			
			.close:hover, .close:focus {
			    color: black;
			    text-decoration: none;
			    cursor: pointer;
			}
			
			#photoReviewDiv {
			    width: 100%;
			    display: flex;
			}
		
		/*#recipeStepDiv {
				display: flex;
				
			}*/
	
	<!-- 요리순서 css -->
	
		#recipeStepDiv {
            background-color: antiquewhite;
            display: flex;
        }

        /* Set the container to flex and set the direction to row */
        #recipeContainer {
        	font-size: 22px;
            margin-bottom: 60px;
            display: flex;
            flex-direction: row;
            padding: 40px;
           font-family: 'Noto Sans KR', sans-serif;
            /*align-items: center; 텍스트 중앙정렬 */
        }

        /* Add some margin between the text and the image */
        #recipeContainer > div:first-child {
            margin-right: 10px;
        }

        /* Optional: Add some styles to the image */
        #recipeContainer img {
           	border-radius: 30px;
            
            width: 300px;
            height: 200px;
        }
        
        #replyWriteForm {
        	display: flex;
        }
        
        
</style>
<script type="text/javascript">
  

	window.addEventListener('load', function(){
  			
	  
			
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
		
		map.generalReply.forEach(function(item, index){
							
				 content +=
					
				'<div class="generalHead margin-B30" style="border-bottom: 1px solid; border-color: #a52a2a52">' 
	            + '<b style="font-size:17px">'+item.replyer+'</b> | <span style="font-size:14px; color: #0000007a;">'+item.regdate+'</span>'
	            
	            + '<div style="font-size:14px; margin-bottom:5px;" class="generalContent">'+item.content+'</div>'
	          	+'</div>'
		
	
	          	
	         
	});
		
		 generalReplyDiv.innerHTML = content;
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

	<input id="m_no" type="text" value="2">
	

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
	<div class="cooking-review margin-T12">
		<div class="sectionTitle MB40T20"><h3 class="h3FW800">요리후기 ${replyCnt}건</h3></div>
		<!-- 포토리뷰 -->
		<div class="photo-review">

			<h3 class="h3FW800">포토리뷰</h3>

			<div id="photoReviewDiv"></div>

		</div>

		<!-- 일반 요리 후기 -->
			
		<div class="general-comment margin-T12" id="generalCommentDiv">
		
		
		</div>
		<div class="d-grid gap-2 col-6 mx-auto "><button id="moreButton" type="button" class="btn btn-success">댓글 더보기</button></div></div>
		<!-- 댓글 작성 부분, 사진 첨부 추가 -->
		
		<!-- <button id="moreButton">더보기</button> -->
		<div class="comment-writing margin-T12">


			
			<form id="replyPhotoForm_Test" enctype="multipart/form-data" name="replyPhotoForm_Test">
					
						
				<div class="starDiv" data-max="5"></div>
					<input id="b_no" name ="b_no" type="hidden" value="${board.b_no}">
					<input type="hidden" id="star">
				
					<input type="file" name="files" id="image" accept="image/*" onchange="setThumbnail(event);">
				<div id="image_container"></div>			
					<input type="hidden" id="writer" name="writer" value="나는작성자"> 
				
				
					<textarea id="reply" name="reply" class="form-control"
						placeholder="다양한 요리 후기를 작성해주세요!"
						style="height: 100px; width: 60%; resize: none; border-radius: 0px;"></textarea><span ><button class="writeBtn" style="width:85px; height: 100%; " id="replyPhotoupload_Test" value="나는 후기">작성</button></span>
			
			</form>	
		</div>
		
		
		<!-- 일반댓글 표시 -->
		
		<div  class="generalReply margin-T12" id="generalReplyContainer">
			
			<div class="sectionTitle MB40T20"><h3 class="h3FW800">한줄댓글 <span class="italicTitle">Reply</span></h3></div>
			
			<div id="generalReplyDiv">
			
			</div>
		
		
			<div class="generalReplyWrite bodySection ">
			
				
				<form id="grForm">
					
					<input type="hidden" id="replyer" name="replyer" value="작성자입력">
					<textarea id="content" name="contnet" rows="" cols="" placeholder="댓글을 작성해주세요!" >
						댓글작성테스트댓글
					</textarea>
				
					<button id="grBtn" onclick="grWrite()">댓글작성</button>
			
				</form>
			
			</div>
			
			
		
		</div>

<!-- 

		  <form id="replyPhotoForm" method="post"enctype="multipart/form-data" name="replyPhotoForm" >
			<input id="b_no" name ="b_no" type="text" value="${board.b_no}">
			<input type="file" name="files">
			<button type="button" id="replyPhotoupload">Fetch파일업로드</button>
			
			<div id="photouploadRes"></div>
			
		</form>

		
			<form id="replyWriteForm"  onsubmit="replyWrite(); return false;" enctype="multipart/form-data" >
				  작성자 나중엔 세션에서 받아와야함 .... 
				<input type="text" id="replyer">
				<textarea id="replyContent" name="replyContent" class="form-control"
					placeholder="다양한 요리 후기를 작성해주세요!"
					style="height: 100px; width: 60%; resize: none;"></textarea><span ><button style="width:85px; height: 86px;" id="replyWriteBtn">작성</button></span>

				<input id="b_no" name ="b_no" type="text" value="${board.b_no}">
				
				
			</form>
		</div>
	 -->
	
	
	<!-- 모달창 -->
	<div id="ingredientModal" class="modal">
		<div class="modal-content">
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
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<h2>포토리뷰</h2>
			<div id="container">
			<div id="photoReviewImgDiv"></div>
			<div id="photoReviewReplyDiv"></div>
			</div>
		
		
			<!-- 전체 포토리뷰가 표시되는 부분 -->
			<div id="photoReviewModalList">
			
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
