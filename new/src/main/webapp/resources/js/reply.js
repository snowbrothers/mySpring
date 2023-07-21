
console.log('reply.js ===================================================')

// Get 방식 요청
function fetchGet(url, callback){
			
		try {
			
			fetch(url)
			// 요청결과 json 문자열을 javascript 객체로 반환
			.then(response => response.json())
			// 콜백함수 실행
			.then(map => callback(map));
			
			} catch (e) {
			// TODO: handle exception
		}
}
		
// url 요청후 받아온 값을 가지고 callback 함수의 매개변수로 넣어줌...


// 데이터를 함께 전송하고싶당 ㅇㅅㅇ
// Post 방식 요청
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

// 댓글 조회 및 출력
function getReplyList(page){
	
	// form 태그안에 input 박스로 포함되어 있음..
	let bno = document.querySelector('#bno').value;
	
	console.log('bno :', bno);
	
	// 변수를 (+)로 연결하지 않는 방법;
	
	console.log('/reply/Newlist/' + bno + '/' + page);
	console.log(`/reply/list/${bno}/${page}`);
	
	// fetch << 서버에 요청
	// url : 요청경로
	// callback : 응답결과를 받아 실행시킬 함수
	fetchGet(`/reply/NewList/${bno}/${page}`, replyView)
	
	
}


// 리스트 결과를 받아서 화면에 출력합니다..
function replyView(map){
	
	// map 에 담긴 list 의 정보를 변수에 담는다.
	let list = map.list;
	let pageDto = map.pageDto;
	
	console.log('나는 리스트 : '+ list);
	console.log(pageDto);
	
	if(list.length == 0){
		replyDiv.innerHTML ='등록된 댓글 없음'
	
	}else{
		
	
	
	let replyDivStr ='댓글목록'
	
	+ '<table class="table text-break text-center">                       '
	+ '  <thead>                                   '
	+ '    <tr>                                    '
	+ '      <th scope="col">번호</th>                '
	+ '      <th scope="col">댓글</th>            '
	+ '      <th scope="col">작성자</th>             '
	+ '      <th scope="col">작성일</th>           '
	+ '    </tr>                                   '
	+ '  </thead>                                  '
	+ '  <tbody>                                   '
	
	list.forEach(reply => {
		
		replyDivStr += 
		'    <tr id="tr'+reply.rno+'">                                    '
		+ '      <th scope="row">'+reply.rno+'</th>                '
		+ '      <td class="text-start">'+ reply.reply ;
		
		if(replyer.value == reply.replyer){
			replyDivStr +=
				` <i class="fa-solid fa-pen-nib" style="cursor : pointer" onclick="replyEdit('${reply.rno}','${reply.replyer}')"></i>`
				+ '<i class="fa-solid fa-trash" style="cursor : pointer" onclick="replyDelete('+reply.rno+')"></i>'
		}

		replyDivStr +=
		 '</td>                         '
		+ '      <td>'+ reply.replyer +'</td>                         '
		+ '      <td>'+reply.replyDate + '</td>                         '
		+ '    </tr>';   
	})
	
	replyDivStr += '  </tbody>'
				+ '</table>'
	
			replyDiv.innerHTML = replyDivStr;
	
	let pageBlock = '';
		
	pageBlock +=
	'	<nav aria-label="Page navigation example">                                              '
	+'  <ul class="pagination justify-content-center">                                             ';
	
	if(pageDto.prev){
	// prev 버튼
		pageBlock+=
	'    <li class="page-item disabled" onclick="getPage('+ (pageDto.startNo-1) +')">                                   '
	+'      <a class="page-link">Previous</a>                               '
	+'    </li>                                                           ';
		}
	
	
	 for(let i = pageDto.startNo; i <= pageDto.endNo; i++){
		 
		 let activeStr =  (pageDto.cri.pageNo == i)?'active':'';
	 
	pageBlock +=
	'    <li class="page-item '+activeStr+'" onclick="getPage('+i+')"><a class="page-link" onclick="getReplyList('+i+')" href="#">'+i+'</a></li>    '
	 }
	 
	 if(pageDto.next){
		 // next 버튼
		 pageBlock +=
		 '    <li class="page-item" onclick="getPage('+ (pageDto.endNo+1) +')">                                            '
		 +'      <a class="page-link" href="#">Next</a>                          '
		 +'    </li>                                                           ';
	 }
	
	pageBlock +=
	'  </ul>                                                               '
	+'</nav>                                                                ';
	
	
	replyDiv.innerHTML += pageBlock;
	
	}
}

function replyWrite(){
	
	
	
	let bno = document.querySelector('#bno').value;
	let reply = document.querySelector('#reply').value;
	let replyer = document.querySelector('#replyer').value;
	
	let obj = {bno : bno
			, reply : reply
			, replyer : replyer}
	
	console.log("bno", bno);
	console.log("reply", reply);
	console.log("replyer", replyer);
	
	// url : /reply/insert : 요청경로
	// obj : json 형식으로 전달할 데이터
	// callback : 응답을 받아 실행할 함수 / 콜백함수
	fetchPost('/reply/insert', obj, replyRes);
}

// 답글 등록, 수정, 삭제의 결과를 처리하는 함수
function replyRes(map){
	console.log(map);
	
	if(map.result == 'success'){
		
		getReplyList(1);
	}else{
		alert(map.message);
	}
	
	// 성공 : 리스트 조회 및 출력
	// 실패 : 메세지 출력
}


function replyDelete(rno){
	console.log('rno',rno)
	
	fetchGet('/reply/delete/'+ rno, replyRes);
}


function replyEdit(rno,replyer){
	
	let edit = document.querySelector('#tr'+rno);	
	
	
	edit.innerHTML = 
		'<td colspan="4">'
	 + '  <div class="input-group">'
	 + '  <span class="input-group-text">답글수정</span>'
	 + '  <input type="text" id="reply'+rno+'" aria-label="First name" class="form-control">'
	 + '  <input type="text" id="replyer'+rno+'" aria-label="First name" class="form-control"  value="'+replyer+'" readonly>'
	 + '  <input type="button" aria-label="Last name" class="form-control" onclick="replyEditAction('+rno+')" value="댓글수정">'
	 + '  </div>'
		+' </td>'
	
}


function replyEditAction(rno) {
	// 파라메터 수집

	// 전송할 데이터를 js 객체로 생성
	
	// 서버에 요청
	console.log('replyEditAction 실행  : ' + rno)
	
	let reply = document.querySelector('#reply'+rno).value;
	
	let obj = {rno : rno
			, reply : reply
	}
	
	fetchPost('/reply/update', obj, replyRes);
	
}

function getPage(page){
	
	localStorage.setItem('pageNo', page);
	document.querySelector("#page").value = page;
	getReplyList(page);
}