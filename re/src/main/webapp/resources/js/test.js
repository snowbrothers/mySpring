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
			          '<div style="display: none;"><a onclick="photoModal_rere(\'' + savePath + '\', \'' + encodeURIComponent(replyJson) + '\' , \'' + replyListJson + '\' , \'' + photoReviewJson + '\', \'' + r_no + '\')">' +
			          '<img src="/display?fileName=' + savePath + '"></a></div>';
			      } else {
			        photoReply +=
			          '<div><a onclick="photoModal_re(\'' + savePath + '\', \'' + encodeURIComponent(replyJson) + '\' , \'' + replyListJson + '\' , \'' + photoReviewJson + '\')">' +
			          '<img src="/display?fileName=' + savePath + '"></a></div>';
			      }
			    });
			    
			    photoReviewDiv.innerHTML = photoReply;
			  }
			}





function photoModal_rere(savePath, replyJson, replyListJson, photoReviewJson, r_no) {
	  
	  const modal = document.getElementById("photoReviewModal");
	  const photoReviewImgDiv = document.getElementById("photoReviewImgDiv");
	  const photoReviewReplyDiv = document.getElementById("photoReviewReplyDiv");
	  const photoReviewModalList = document.getElementById("photoReviewModalList"); // Element
																					// to
																					// display
																					// all
	  


	  // Parse the stringified JSON objects back into
		// arrays/objects
	  var photoReview = JSON.parse(decodeURIComponent(photoReviewJson));
	  var replyList = JSON.parse(decodeURIComponent(replyListJson));
	  var reply = JSON.parse(decodeURIComponent(replyJson));

	  reply.forEach(function(item,index){
		  	
		  if(r_no == item.r_no ){
			  
			  photoReviewImgDiv.innerHTML = '<img src="/display?fileName=' + savePath + '">';

		  }else{
			  
			  photoReviewImgDiv.innerHTML = '일치하는 이미지가 없습니다.';
		  }

	  })

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