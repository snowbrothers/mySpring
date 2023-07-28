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
			
		 
			
		})
		
		 
	  
   </script>
<body>

	<script src="https://kit.fontawesome.com/4863a16a12.js"
		crossorigin="anonymous"></script>

	<input id="b_no" type="text" value="${board.b_no}">

	<!-- 상단 -->
	<div class="header">
		<!-- Insert representative photo here -->
		<div id="headImgDiv"></div>

		<h1>${board.title }</h1>

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
			<form id="replyWriteForm" method="post">
				<textarea id="cmt_tx_content1" onclick="EZ.ATLogin(); return false;"
					name="frm[cmt_tx_content]" class="form-control"
					placeholder="다양한 요리 후기를 작성해주세요!"
					style="height: 100px; width: 100%; resize: none;"></textarea>
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
