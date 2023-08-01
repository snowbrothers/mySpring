console.log('연결 확인 ===================================================') 

		function initializeStarRatings() {
   			 $(".test-score1").score();
  		}

		function openModalAndInitializeStars() {
		    const modal = document.getElementById("photoReviewModal");
		    modal.style.display = "block";
		    initializeStarRatings(); // 모달창의 댓글에 대한 별점 초기화
		  }
		
		
		document.addEventListener("click", function (event) {
		    if (event.target && event.target.className == "fa-circle-info") {
		      // "fa-circle-info" 클래스 이름을 가진 요소를 클릭할 때 모달을 열어 별점을 초기화합니다.
		      const i_no = event.target.getAttribute("onclick").match(/\d+/)[0];
		      goModal(i_no);
		      openModalAndInitializeStars();
		    }
		  });
		
		function getFileList(){
		
		
		let bno = document.querySelector('#b_no').value;
		
		// fetch 사용
		// 정보를 가져와서 함수에 파라메터로 넣는다.
		fetch('/file/list/' + bno)
			.then(response => response.json())
			.then(map => viewFileList(map));
			
		}
		
		// 상단 img
		// ======================================================================
		
		function viewFileList(map){
			
			// 잘 들어왔는지 확인
			// console.log('map 출력 :', map);
			let content = '';
			
			if(map.list.length > 0) {
				
				map.list.forEach(function(item, index){
					
					let savePath = encodeURIComponent( item.savePath);
					// console.log('savePath : ', savePath);
					
					content +=
						
						'<a><img src="/display?fileName=' + savePath +'"></a>';
				})
				
				
			}else { 
				content = '등록된 파일이 없습니다.';
			}
			
			headImgDiv.innerHTML = content;
			
		}
			
			
		

		
		
		
		// 재료정보출력
		// ========================================================================
		
		function getMaterial(){
			
			let bno = document.querySelector('#b_no').value;
	   		
	   		// fetch 사용
	   		// 정보를 가져와서 함수에 파라메터로 넣는다.
	   		fetch('/recipe/material/' + bno)
	   			.then(response => response.json())
	   			.then(map => viewMaterialList(map));
	   			
	   		}
		
		
		function viewMaterialList(map){
				
			// console.log('재료정보 map 출력 : ', map);
			let content = '<div><b>[재료]</b></div>';
			// Controller 에서 map 에 put 할때 지정한 값이 있다면..
			
			if(map.materialList.length > 0){
				
				map.materialList.forEach(function(item, index){
					
					let i_name = item.i_name;
					let materialCnt = item.materialcnt;
					// input hidden 으로 가지고 간다음 클릭하면 넘어갈때 가져갈 수 있도록 해보자
					var i_no = item.i_no;
					
					
						
				content +=   						
						
					'<input type="hidden" value="'+i_no+'">'
						+'<div>'
					
					+'<ul>'
   				+'<li >' + i_name +'&nbsp;<i class="fa-solid fa-circle-info" style="color: #374967;" onclick="goModal(' + i_no + ',\''+i_name+ '\')"></i>'
   				+'</i><span class="material-span">'+materialCnt+'개</span>'
   				+'<span id="roketBtn"><i class="fa-solid fa-rocket" style="color: #588adf;" onclick=goRoket("'+i_name+'")></i></span></li>'
   				+'</ul>'
					+'</div>'
				})
				
				
			}else{
				content='재료 정보를 불러오지 못했습니다.';
			}
			
			
			materialContentDiv.innerHTML = content;
		}
		
		
		
		// 버튼을 클릭하면 모달창 출력
		function goModal(i_no, i_name){
			
// console.log('goMoal 출력 : ', i_no);
// console.log('goMoal 출력 : ', i_name);
			
			
		// fetch 사용
	   		// 정보를 가져와서 함수에 파라메터로 넣는다.
	   		fetch('/recipe/modal/ingredientModal/' + i_no +'/'+ i_name)
	   			.then(response => response.json())
	   			.then(map => viewIngredientsModal(map));
	   			
	   		}
			
		
		
		
		
		function viewIngredientsModal(map){
			
			// console.log('모달창 재료 정보 map 출력 : ', map)
			
		 	const modal = document.getElementById("ingredientModal");
		  	const ingredientInfoDiv = document.getElementById("ingredientInfoDiv");
	
		  	let contentImg = '';
		  	if(map.ingredientImg){
		  		
		  		let savePath = encodeURIComponent( map.ingredientImg.savePath);
			// console.log('savePath : ', savePath);
		  		
		  		contentImg = 
		  			
		  		'<a><img src="/display?fileName=' + savePath +'"></a>';
		  	}
		  	
		  	
		  	let content = '';
		  	if (map.ingredient) {
		    content +=
		      '<p><b>재료명: </b>' + map.ingredient.i_name + '</p>' 
		      	+ '<p><b>효능: </b>' + map.ingredient.i_power + '</p>'
		   		+ '<p><b>잘맞는 음식: </b>' + map.ingredient.i_friendfood + '</p>' 
				+ '<p><b>손질법: </b>' + map.ingredient.i_repair + '</p>'
				+ '<p><b>관련요리: </b>' + map.ingredient.i_cook + '</p>';
		  } else {
		    content = '재료 정보를 가져오지 못했습니다.';
		  }

		  ingredientInfoDiv.innerHTML = content;
		  ingredientImgDiv.innerHTML = contentImg;
		  modal.style.display = "block";
		}

		
		function closeModal() {
		  const modal = document.getElementById("ingredientModal");
		  modal.style.display = "none";
		
		}
			
			
		
		
		
		// --------------------------------------------------------------------------------------
			
		// 요리 순서 출력
		function getRecipeStep(){
			
			let bno = document.querySelector('#b_no').value;
	   		
	   		// fetch 사용
	   		// 정보를 가져와서 함수에 파라메터로 넣는다.
	   		fetch('/recipe/recipeStep/' + bno)
	   			.then(response => response.json())
	   			.then(map => viewRecipeStep(map));
	   			
	   		}
		
		//---------------------------------------------------------------------------------------
			
		function viewRecipeStep(map) {
		   // console.log('조리순서 map 출력 : ', map);
		    let content = '';

		    if (map.recipeStep.length > 0) {
		        map.recipeStep.forEach(function (item, index) {
		            let step_content = item.step_content;
		            var s_no = item.s_no;

		            // Verifica si 'map.fileStepList' está definido y es una
					// matriz
		            if (Array.isArray(map.fileStepList)) {
		                // Utiliza el método 'find' solo si 'map.fileStepList'
						// es una matriz
		               // console.log("fileStepList
						// =======================================")
		                
		                let matchedImage = map.fileStepList.find(function (imageItem) {
		                    return imageItem.s_no === s_no;
		                });

		                content +=
		                    '<input type="hidden" value="' + s_no + '">'
		                    + '<div id="recipeContainer">'
		               
		                    + '<div class="stepContent stepFont" id="stepContent">'+ step_content +'</div>';
		                    

		                if (matchedImage) {
		                    let savePath = encodeURIComponent(matchedImage.savePath);
		                    content +=
		                        '<div class="stepContent" id="stepImg"><a><img src="/display?fileName=' + savePath + '"></a></div>';
		                }

		                content += 
		                    		 '</div>';
		            } else {
		                // Maneja el caso cuando 'map.fileStepList' no es una
						// matriz
		                content +=
		                    '<input type="text" value="' + s_no + '">'
		                    + '<div>'
		                    + '<ul>'
		                    + '<li class="">' + step_content + '</li>'
		                    + '</ul>'
		                    + '</div>';
		            }
		        });
		    } else {
		        content = '재료 정보를 불러오지 못했습니다.';
		    }

		    recipeStepDiv.innerHTML = content;
		}
		
		
		/*
		 * function viewRecipeStep(map){
		 * 
		 * console.log('조리순서 map 출력 : ', map); let content = ''; // Controller
		 * 에서 map 에 put 할때 지정한 값이 있다면..
		 * 
		 * if(map.recipeStep.length > 0){
		 * 
		 * map.recipeStep.forEach(function(item, index){
		 * 
		 * let step_content = item.step_content;
		 *  // input hidden 으로 가지고 간다음 클릭하면 넘어갈때 가져갈 수 있도록 해보자. var s_no =
		 * item.s_no;
		 * 
		 * content +=
		 *  '<input type="text" value="'+s_no+'">' +'<div>' +'<ul>' +'<li class="">'
		 * +step_content+ '</li>' +'<li id="stepImg"></li>' +'</ul>' +'</div>' })
		 * 
		 * 
		 * }else{ content='재료 정보를 불러오지 못했습니다.'; }
		 * 
		 * 
		 * recipeStepDiv.innerHTML = content;
		 * 
		 *  }
		 */
		

		
		
		// 댓글 정보 출력
		// =================================================================
		
		function getRecipeReply(){
			
				let bno = document.querySelector('#b_no').value;
	   		
		   		// fetch 사용
		   		// 정보를 가져와서 함수에 파라메터로 넣는다.
		   		fetch('/replyList/' + bno)
		   			.then(response => response.json())
		   			.then(map => viewReplyList_Test2(map));
				
		   		$(".test-score1").score();
		}
		
		
		
		/*
		 * function viewReplyList(map){
		 * 
		 * console.log('댓글리스트 map 출력 : ', map);
		 * 
		 * 
		 * let content = ''; // Controller 에서 map 에 put 할때 지정한 값이 있다면..
		 * 
		 * if(map.replyList.length > 0){
		 * 
		 * map.replyList.forEach(function(item, index){
		 * 
		 * let r_no = item.r_no; // 댓글번호 let replydate = item.replydate; // 작성일
		 * let reply = item.reply; // 내용 let writer = item.writer; // 작성자 let
		 * star = item.star;
		 *  // input hidden 으로 가지고 간다음 클릭하면 넘어갈때 가져갈 수 있도록 해보자. // 나중에 댓글과 연결된
		 * 사진 가져와야함.
		 *  // 댓글 5개 보여주기 // 더보기 버튼을 누르면 전체 댓글 표시 될 수 있도록
		 * 
		 * 
		 * 
		 * content +=
		 *  '<div class="media-body">' +'<h4 class="media-heading">' +'<b
		 * class="info_name_f">'+writer+'</b>'+replydate+'<div
		 * class="test-score1" data-max="5" data-rate="'+star+'"></div>' +'</h4>' +'<p class="reply_list_cont">'+reply+'</p></div>';
		 *  })
		 * 
		 * 
		 * }else{ content='재료 정보를 불러오지 못했습니다.'; }
		 * 
		 * 
		 * generalCommentDiv.innerHTML = content;
		 * 
		 * 
		 * 
		 * let photoReply = '';
		 * 
		 * console.log(map.photoReview); console.log(map.replyList); if
		 * (map.photoReview.length > 0) {
		 * 
		 * map.photoReview.forEach(function(item, index) {
		 * 
		 * let savePath = encodeURIComponent(item.savePath); let r_no =
		 * item.r_no; console.log('savePath : ', savePath);
		 *  // Use encodeURIComponent for the entire JSON string to handle
		 * quotes correctly let photoReviewJson =
		 * encodeURIComponent(JSON.stringify(map.photoReview)); let
		 * replyListJson = encodeURIComponent(JSON.stringify(map.replyList));
		 * 
		 * 
		 * console.log('================================');
		 * console.log(map.replyList[index]); console.log(map.replyList);
		 * 
		 * let reply = map.replyList[index]; let replyJson =
		 * JSON.stringify(reply); console.log(replyJson);
		 * 
		 * photoReply += '<div><a onclick="photoModal_test(\'' + savePath +
		 * '\', \'' + encodeURIComponent(replyJson) + '\')">' + '<img
		 * src="/display?fileName=' + savePath + '"></a></div>'; });
		 * 
		 * 
		 * 
		 * photoReviewDiv.innerHTML = photoReply; } }
		 * 
		 * 
		 * 
		 * function photoModal_test(savePath, replyJson) {
		 * 
		 * 
		 * let reply = JSON.parse(decodeURIComponent(replyJson));
		 * console.log("reply 출력 : ", reply);
		 * 
		 * const modal = document.getElementById("photoReviewModal"); const
		 * photoReviewImgDiv = document.getElementById("photoReviewImgDiv");
		 * const photoReviewReplyDiv =
		 * document.getElementById("photoReviewReplyDiv");
		 * 
		 * 
		 *  // 사진 div photoReviewImgDiv.innerHTML = '<img
		 * src="/display?fileName=' + savePath + '"></a>';
		 * 
		 * let content =
		 *  '<div id="modalContent">' +'<div id="modalHead">' + '<span>'+reply.writer+'</span>&nbsp;<div
		 * class="test-score1" data-max="5" data-rate="'+reply.star+'"></div>' +
		 * '&nbsp;<span>'+reply.replydate+'</span>' +'</div>' +'<div
		 * id="modalContent">'+reply.reply+'</div>' +'</div>'
		 *  // 댓글 div photoReviewReplyDiv.innerHTML = content;
		 * 
		 * 
		 * modal.style.display = "block";
		 * 
		 *  }
		 */
		
		// =================================================================================================
			
			
		function viewReplyList_Test(map) {
			  // console.log('comments list map output: ', map);

			  let content = '';
			  let showAll = false;

			  // Function to generate the HTML content for a single item
			  function generateItemHtml(item) {
			    let r_no = item.r_no; // comment number
			    let replydate = item.replydate; // Date Created
			    let reply = item.reply; // detail
			    let writer = item.writer; // Writer
			    let star = item.star;

			    // Let's take it to the input hidden and make it available when
				// clicking on it.
			    // We need to get the picture associated with the comment later.
			    return (
			    		
			      '<div class="media-body">' +
			      '<h4 class="media-heading">' +
			      '<b class="info_name_f">' + writer + '</b>' + replydate + '<div class="test-score1" data-max="5" data-rate="' + star + '"></div>' +
			      '</h4>' +
			      '<p class="reply_list_cont">' + reply + '</p></div>'
			      
			    );
			    
			  }

			  // Function to display all items in map.replyList
			  function displayAllItems() {
			    showAll = true;
			    content = '';
			    map.replyList.forEach(function (item) {
			      content += generateItemHtml(item);
			    });
			    generalCommentDiv.innerHTML = content;
			    $(".test-score1").score();
			  }

			 
			  
			  // If there is a value specified when putting it to the map in
				// the controller...
			  if (map.replyList.length > 0) {
			    // Show the first five items initially
			    for (let index = 0; index < Math.min(5, map.replyList.length); index++) {
			      const item = map.replyList[index];
			      content += generateItemHtml(item);
			    }
			    generalCommentDiv.innerHTML = content;
			    $(".test-score1").score();

			    // Add event listener to the '더보기' button
			    const moreButton = document.getElementById('moreButton');
			    moreButton.addEventListener('click', displayAllItems);
			  } else {
			    content = 'Failed to load material information.';
			    generalCommentDiv.innerHTML = content;
			  }

			  let photoReply = '';

			// console.log(map.photoReview);
			 // console.log(map.replyList);

			  if (map.photoReview.length > 0) {
			    map.photoReview.forEach(function (item, index) {
			      let savePath = encodeURIComponent(item.savePath);
			      let r_no = item.r_no;
			     // console.log('savePath : ', savePath);

			      // Use encodeURIComponent for the entire JSON string to
					// handle quotes correctly
			      let photoReviewJson = encodeURIComponent(JSON.stringify(map.photoReview));
			      let replyListJson = encodeURIComponent(JSON.stringify(map.replyList));

			    // console.log('================================');
			    // console.log(map.replyList[index]);
			    // console.log(map.replyList);

			      let reply = map.replyList[index];
			      let replyJson = JSON.stringify(reply);
			   // console.log(replyJson);

			      if (!showAll && index >= 5) {
			        photoReply +=
			          '<div style="display: none;"><a onclick="photoModal_re(\'' + savePath + '\', \'' + encodeURIComponent(replyJson) + '\' , \'' + replyListJson + '\' , \'' + photoReviewJson + '\')">' +
			          '<img class="w150" src="/display?fileName=' + savePath + '"></a></div>';
			      } else {
			        photoReply +=
			          '<div><a onclick="photoModal_re(\'' + savePath + '\', \'' + encodeURIComponent(replyJson) + '\' , \'' + replyListJson + '\' , \'' + photoReviewJson + '\')">' +
			          '<img class="w150" src="/display?fileName=' + savePath + '"></a></div>';
			      }
			    });
			    
			    photoReviewDiv.innerHTML = photoReply;
			  }
			}
		
		//===========================================================================================
		
		/*
			function photoModal_ex(r_no){
				
				let r_no = r_no;
				
				fetch('/file/photoReviewGo'
						,{method : 'post'
						, r_no : r_no
				})
				// 요청결과 json 문자열을 javascript 객체로 반환
				.then(response => response.json())
				// 콜백함수 실행
				.then(map => callback(map));
				
			}*/
		
		
		
			function photoModal_re(savePath, replyJson, replyListJson, photoReviewJson) {
				  
				  const modal = document.getElementById("photoReviewModal");
				  const photoReviewImgDiv = document.getElementById("photoReviewImgDiv");
				  const photoReviewReplyDiv = document.getElementById("photoReviewReplyDiv");
				  const photoReviewModalList = document.getElementById("photoReviewModalList"); // Element
																								// to
																								// display
																								// all
																								// images

				  photoReviewImgDiv.innerHTML = '<img src="/display?fileName=' + savePath + '">';

				  // Parse the stringified JSON objects back into
					// arrays/objects
				  var photoReview = JSON.parse(decodeURIComponent(photoReviewJson));
				  var replyList = JSON.parse(decodeURIComponent(replyListJson));
				  var reply = JSON.parse(decodeURIComponent(replyJson));

				  // Display all images in the photoReview array
				  let photoList = '';
				  photoReview.forEach(function (item, index) {
				    let saveP = encodeURIComponent(item.savePath);
				    photoList += '<img src="/display?fileName=' + saveP + '">';
				  });

				  photoReviewModalList.innerHTML = photoList;

				  // Display reply information in the photoReviewReplyDiv
				  let content =
				    '<div id="modalContent">' +
				    '<div id="modalHead">' +
				    '<span>' + reply.writer + '</span> <div class="test-score2" data-max="5" data-rate="' + reply.star + '"></div>' +
				    '<span>' + reply.replydate + '</span>' +
				    '</div>' +
				    '<div id="modalContent">' + reply.reply + '</div>' +
				    '</div>';

				  photoReviewReplyDiv.innerHTML = content;
				  $(".test-score2").score();
				  modal.style.display = "block";
				}
		
		
			/*=============================================================================================================*/
			
			
			function viewReplyList_Test2(map) {
				  // console.log('comments list map output: ', map);

				  let content = '';
				  let showAll = false;

				  // Function to generate the HTML content for a single item
				  function generateItemHtml(item) {
				    let r_no = item.r_no; // comment number
				    let replydate = item.replydate; // Date Created
				    let reply = item.reply; // detail
				    let writer = item.writer; // Writer
				    let star = item.star;

				    // Let's take it to the input hidden and make it available when
					// clicking on it.
				    // We need to get the picture associated with the comment later.
				    return (
				    		
				      '<div class="media-body">' +
				      '<h4 class="media-heading">' +
				      '<b class="info_name_f">' + writer + '</b>' + replydate + '<div class="test-score1" data-max="5" data-rate="' + star + '"></div>' +
				      '</h4>' +
				      '<p class="reply_list_cont">' + reply + '</p></div>'
				      
				    );
				    
				  }

				  // Function to display all items in map.replyList
				  function displayAllItems() {
				    showAll = true;
				    content = '';
				    map.replyList.forEach(function (item) {
				      content += generateItemHtml(item);
				    });
				    generalCommentDiv.innerHTML = content;
				    $(".test-score1").score();
				  }

				 
				  
				  // If there is a value specified when putting it to the map in
					// the controller...
				  if (map.replyList.length > 0) {
				    // Show the first five items initially
				    for (let index = 0; index < Math.min(5, map.replyList.length); index++) {
				      const item = map.replyList[index];
				      content += generateItemHtml(item);
				    }
				    generalCommentDiv.innerHTML = content;
				    $(".test-score1").score();

				    // Add event listener to the '더보기' button
				    const moreButton = document.getElementById('moreButton');
				    moreButton.addEventListener('click', displayAllItems);
				  } else {
				    content = 'Failed to load material information.';
				    generalCommentDiv.innerHTML = content;
				  }

				  
				  
				  
				  // 포토리뷰 출력 부 ---------------------------------------------------- 
				  
				  let photoReply = '';

				// console.log(map.photoReview);
				 // console.log(map.replyList);

				  if (map.photoReview.length > 0) {
				    map.photoReview.forEach(function (item, index) {
				      let savePath = encodeURIComponent(item.savePath);
				      let r_no = item.r_no;
				     // console.log('savePath : ', savePath);

				      // Use encodeURIComponent for the entire JSON string to
						// handle quotes correctly
				      let photoReviewJson = encodeURIComponent(JSON.stringify(map.photoReview));
				      let replyListJson = encodeURIComponent(JSON.stringify(map.replyList));

				    // console.log('================================');
				    // console.log(map.replyList[index]);
				    // console.log(map.replyList);

				      let reply = map.replyList[index];
				      let replyJson = JSON.stringify(reply);
				   // console.log(replyJson);

				      if (!showAll && index >= 5) {
				        photoReply +=
				          '<div class="w20p" style="display: none;"><a onclick="photoModal_rere(\'' + savePath + '\', \'' + encodeURIComponent(replyJson) + '\' , \'' + replyListJson + '\' , \'' + photoReviewJson + '\', \'' + r_no + '\')">' +
				          '<img  src="/display?fileName=' + savePath + '"></a></div>';
				      } else {
				        photoReply +=
				          '<div><a onclick="photoModal_rere(\'' + savePath + '\', \'' + encodeURIComponent(replyJson) + '\' , \'' + replyListJson + '\' , \'' + photoReviewJson + '\', \'' + r_no + '\')">' +
				          '<img class="w136" src="/display?fileName=' + savePath + '"></a></div>';
				      }
				    });
				    
				    photoReviewDiv.innerHTML = photoReply;
				  }
				}



			function photoModal_rere(savePath, replyJson, replyListJson, photoReviewJson, r_no) {
				
				  const modal = document.getElementById("photoReviewModal");
				  const photoReviewImgDiv = document.getElementById("photoReviewImgDiv");
				  const photoReviewReplyDiv = document.getElementById("photoReviewReplyDiv");
				  const photoReviewModalList = document.getElementById("photoReviewModalList");

				  // Parse the stringified JSON objects back into arrays/objects
				  var photoReview = JSON.parse(decodeURIComponent(photoReviewJson));
				  var replyList = JSON.parse(decodeURIComponent(replyListJson));
				  var reply = JSON.parse(decodeURIComponent(replyJson));

				  // Find the correct comment that matches the clicked photo's r_no
				  let matchedReply = replyList.find((item) => item.r_no == r_no);
				  
				  console.log('matchedReply', matchedReply);
				  console.log('r_no: ',r_no);
				  
				  // Display the clicked photo's image in the modal
				  photoReviewImgDiv.innerHTML = matchedReply
				    ? '<img src="/display?fileName=' + savePath + '">'
				    : '일치하는 이미지가 없습니다.';

				  // 포토리뷰 전체를 보여주는 부분
				  let photoList = '';
				  
				  photoList =
					  '<ul>';
				  
				  photoReview.forEach(function (item, index) {
				    let saveP = encodeURIComponent(item.savePath);
	
				    photoList += 
				    	'<li class="photoList"><img class="w100" name="photoList" src="/display?fileName=' + saveP + '"></li>';
				 
				  });
				  
				  photoList +=
					  '</ul>'
				  photoReviewModalList.innerHTML = photoList;

				  // Display reply information in the photoReviewReplyDiv
				  if (matchedReply) {
				    let content =
				      '<div id="modalContent">' +
				      '<div id="modalHead">' +
				      '<span>' +
				      matchedReply.writer +
				      '</span> <div class="test-score2" data-max="5" data-rate="' +
				      matchedReply.star +
				      '"></div>' +
				      '<span>' +
				      matchedReply.replydate +
				      '</span>' +
				      '</div>' +
				      '<div id="modalContent">' +
				      matchedReply.reply +
				      '</div>' +
				      '</div>';

				    photoReviewReplyDiv.innerHTML = content;
				    $(".test-score2").score();
				  } else {
				    // If there's no matching comment, display a message in the reply div
				    photoReviewReplyDiv.innerHTML = 'No matching comment found.';
				  }

				  modal.style.display = 'block';
				}
			
		

	function closeModal() {
	  const photoReviewModal = document.getElementById("photoReviewModal");
	  const ingredientModal = document.getElementById("ingredientModal");
	  photoReviewModal.style.display = "none";
	  ingredientModal.style.display = "none";
	}
		
		
		
	function goRoket(i_name){
		
		let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1200, height=800, top=0,left=0";
		let searchWord = encodeURIComponent(i_name);
		let url = 'https://www.coupang.com/np/search?component=&q=' + searchWord + '&channel=user';
		  window.open(url ,"_blank", options);
		}
		
	
	// 별점
