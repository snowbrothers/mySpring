function photoModal_rerere(savePath, replyJson, replyListJson, photoReviewJson, r_no) {
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
  console.log('r_no: ', r_no);

  
  //Display the clicked photo's image in the modal
  photoReviewImgDiv.innerHTML = matchedReply
    ? '<img src="/display?fileName=' + savePath + '">'
    : '일치하는 이미지가 없습니다.';

  // 포토리뷰 전체를 보여주는 부분
  let photoList = '<ul>';

  photoReview.forEach(function (item, index) {
    let saveP = encodeURIComponent(item.savePath);

    // 각 이미지마다 고유한 'data-r_no' 속성을 추가하여 중복 불러오기 문제를 해결합니다.
    photoList += '<li class="photoList"><img class="w100" name="photoList" src="/display?fileName=' + saveP + '" data-r_no="' + item.r_no + '"></li>';
  });

  photoList += '</ul>'
	  
  photoReviewModalList.innerHTML = photoList;
  
  // 'photoList' 클래스를 가진 모든 이미지 요소를 가져옵니다.
  const photoListImages = document.querySelectorAll('.photoList img');
  console.log('photoListImages :', photoListImages);
  
  // 클릭한 사진의 이미지와 댓글 정보를 초기화합니다.
  photoReviewReplyDiv.innerHTML = '';

  // photoList의 각 이미지에 클릭 이벤트 리스너를 추가합니다.
  photoListImages.forEach((image) => {
    image.addEventListener('click', function () {
      // 클릭한 이미지에서 'data-r_no' 속성을 가져옵니다.
      const clickedRNo = image.getAttribute('data-r_no');

      // 클릭한 이미지의 'data-r_no' 속성과 일치하는 댓글을 'replyList'에서 찾습니다.
      const matchedReply = replyList.find((item) => item.r_no == clickedRNo);

      // 모달창에 클릭한 사진의 이미지를 표시합니다.
      photoReviewImgDiv.innerHTML = matchedReply
	    ? '<img src="/display?fileName=' + savePath + '">'
	    : '일치하는 이미지가 없습니다.';

      // 댓글 정보를 'photoReviewReplyDiv'에 표시합니다.
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
        // 일치하는 댓글이 없는 경우, 댓글을 표시하는 영역에 메시지를 표시합니다.
        photoReviewReplyDiv.innerHTML = '일치하는 댓글이 없습니다.';
      }
    });
  });

  modal.style.display = 'block';
}