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

<link href="/resources/css/view.css" rel="stylesheet">
<script src="/resources/js/view.js"></script>
<style>
.material-span {
	/* Add some padding on the right side of the text "Eggs" */
	padding-left: 150px;
	/* Alternatively, you can use margin to create a gap between the text and <span> */
	/* margin-right: 10px; */
}

/* 모달창 스타일 */
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
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#photoReviewDiv {
	display: flex;
}

/*#recipeStepDiv {
		display: flex;
		
	}*/
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
			
		
			initializeStarRatings();
			
		 
			// 좋아요 버튼 클릭 시 실행되는 함수
			likeBtn.addEventListener('click', function(){
				
				
				LikeRecipe();

			});
			
			// 댓글 작성 클릭시 실행되는 함수
			replyWriteBtn.addEventListener('click',function(){
				
				// 댓글 작성 함수
				replyWrite();
				
			});
			
			//파일업로드
			replyPhotoupload.addEventListener('click', function(){
				
				event.preventDefault();
				
				let formData = new FormData(replyPhotoForm);
				formData.append('name','photo');
				
				console.log("formData : ", formData);
				
				for(var pair of formData.entries()){
					
					if(typeof(pair[1]) == 'object') {
						let fileName = pair[1].name;
						let fileSize = pair[1].fileSize;
						
						console.log('fileName', fileName);
						console.log('fileSize', fileSize);
						
					}
					
				}
				
				fetch('/file/photoReview'
						, {
							method : 'post'
							, headers : {'Content-Type' : 'application/json'}
							, body : formData
				})
					.then(response => response.json())
					.then(map => fileuploadRes(map));
				
			});
		})
		
		
	
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
			
		
		
		
		 
	  
   </script>
<body>

	<script src="https://kit.fontawesome.com/4863a16a12.js"
		crossorigin="anonymous"></script>

	<input id="m_no" type="text" value="2">
	

	<!-- 상단 -->
	<div class="header">
		<!-- Insert representative photo here -->
		<div id="headImgDiv"></div>

		<h1>${board.title }</h1>
		<button id="likeBtn">레시피 저장</button>
		<p>${board.intro }</p>
	</div>




	<!-- 재료 -->


	<div class="material">
		<h2>재료</h2>


		<div id="materialContentDiv"></div>
	</div>



	<!-- 모달창 -->
	<div id="ingredientModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<h2>재료 정보</h2>
			<div id="ingredientImgDiv">
				<!-- 재료 사진 출력  -->
			</div>

			<div id="ingredientInfoDiv">
				<!-- 재료 정보가 여기에 출력될 것입니다. -->
			</div>
		</div>
	</div>

	<div id="photoReviewModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<h2>포토리뷰</h2>
			<div id="photoReviewImgDiv"></div>
			<div id="photoReviewReplyDiv"></div>

		</div>

		<div id="photoReviewModalList"></div>

	</div>




	<!-- 조리 순서 -->
	<div class="cooking-order">
		<h2>조리순서</h2>

		<div id="recipeStepDiv"></div>

		<div id="regdate">
			<span>작성일 : ${board.regdate }</span>&nbsp;|<span>수정일 :
				${board.updatedate }</span>
		</div>

	</div>

	<!-- 작성자 정보 -->

	<div>
		<h2>레시피 작성자</h2>
		<div id="MemberInfoDiv">${board.nickname}</div>
	</div>

	<!-- 요리후기  -->
	<div class="cooking-review">
		<h2>요리후기 ${replyCnt}건</h2>
		<!-- 포토리뷰 -->
		<div class="photo-review">

			<h3>포토리뷰</h3>

			<div id="photoReviewDiv"></div>

		</div>

		<!-- 일반 요리 후기 -->
		<div class="general-comment" id="generalCommentDiv"></div>

		<!-- 댓글 작성 부분, 사진 첨부 추가 -->
		<div class="comment-writing">

		<form id="replyPhotoForm" enctype="multipart/form-data" name="replyPhotoForm" >
			<input id="b_no" name ="b_no" type="text" value="${board.b_no}">
			<input type="file" name="files">
			<button type="button" id="replyPhotoupload">Fetch파일업로드</button>
			
			<div id="photouploadRes"></div>
			
		</form>


			<form id="replyWriteForm" enctype="multipart/form-data" onsubmit="replyWrite(); return false;" >
				<!--  작성자 나중엔 세션에서 받아와야함 .... -->
				<input type="text" id="replyer">
				
				<textarea id="replyContent" name="replyContent" class="form-control"
					placeholder="다양한 요리 후기를 작성해주세요!"
					style="height: 100px; width: 100%; resize: none;"></textarea>

				<button id="replyWriteBtn">댓글 작성</button>
			</form>
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
</body>
</html>
