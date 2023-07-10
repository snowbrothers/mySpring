<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나는테스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/4863a16a12.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	
	
	
	// 1. 서버에 댓글리스트 요청
	function getList(){
		
	let bno = document.querySelector("#bno").value;
	// url 의 요청결과를 받아옵니다.
	fetch('/reply/list/'+ bno)
	// response.json() : 요청결과를 js.object 형식으로 반환
	.then(response => response.json())
	// 반환받은 오브젝트를 이용하여 화면에 출력
	.then(list => replyView(list));
	}
	
	
	
	
	// 2. 리스트를 화면에 출력
	function replyView(list){
		// 콘솔차에 리스트 출력
		console.log(list)
		// 답긍르 DIV 에 출력
		
		
		replyDiv.innerHTML = ''; 	
						
	
		// 반복문								
		list.forEach((reply, index) => {
			
			console.log();
			/*replyDiv.innerHTML += '<br>' + reply.bno;
			replyDiv.innerHTML += '<br>' + reply.rno;
			replyDiv.innerHTML += '<br>' + reply.reply;
			replyDiv.innerHTML += '<br>' + reply.replyer;
			replyDiv.innerHTML += '<br>' + reply.replyDate + '<p></p>';*/
			
			replyDiv.innerHTML += 
				
			'<figure id="reply'+index+'">'
				+ '		<blockquote class="blockquote">'
			+ '			<p>'+ reply.reply 
			+ '<i class="fa-solid fa-pen-nib" onclick="editReply('+ index +')"  style="cursor : pointer"></i>'
			+'<i class="fa-solid fa-trash" onclick="deleteReply(' + reply.rno + ')" style="cursor : pointer" ></i>'
			+'</p>'
		  	+ '		</blockquote>'
				
		  	+ '		<figcaption class="blockquote-footer">'
			+ '    ' +reply.replyer  
			+' <cite title="Source Title">' + reply.replyDate + '</cite>'
			+ '		</figcaption>'
			+ '</figure>';
			
			
		});
	}
	
	
	// 버튼이 생성되고 나서 이벤트를 부여하기위해 onload이벤트에 작성
	
	window.onload = function(){
		
		// 리스트 조회 및 출력
		getList();
		
		
		
		btnWrite.addEventListener('click', function(){
			
			let bno = document.querySelector('#bno').value;
			let reply = document.querySelector('#reply').value;
			let replyer = document.querySelector('#replyer').value;
			
			console.log("bno", bno);
			console.log("reply", reply);
			console.log("replyer", replyer);
			
			
			// 1. 전송할 테이터를 javascript객체로 생성
			let replyObj = {
				bno : bno
				, reply : reply
				, replyer : replyer
			};
			
			// 2.객체를 json타입으로 변환
			// object 를 json 형태로 변환
			let replyJson = JSON.stringify(replyObj);
			
			console.log('replyObj', replyObj);
			console.log('replyJson', replyJson);
			
			// JSON.parse object 를 문자열로
			//
			
			fetch('/reply/insert'
					,{method : 'post'
						,headers : {'Content-type' : 'application/json'}
						,body : replyJson})
				.then(response => response.json())
				.then(map => replyWriteRes(map));
			//.then(map => getList());
		})
		
		btnEdit.addEventListener('click', function(){
			
			let rno = document.querySelector('#rno').value;
			
		})
		
		
	};
		
		function replyWriteRes(map){
			if(map.result == 'success'){
				// 등록성공
				// 리스트 조회및 출력
				getList();
			}else{
				alert(map.message);
			}
		}
		
		function deleteReply(rno) {
		    fetch('/reply/delete/' + rno)
		    .then(response => response.json())
		    .then(map => {
		        if (map.result === 'success') {
		            // Deletion successful
		            getList(); // Refresh the reply list
		        } else {
		            alert(map.message);
		        }
		    });
		}
		
		function editReply(index){
			
			document.querySelector('#reply'+index+'').innerHTML = 
				
				'<div class="input-group mb-3">'
			  	+  '<input type="text" value="" id="reply" class="form-control" aria-label="Recipient s username" aria-describedby="button-addon2">'
				+  '<button class="btn btn-outline-secondary" type="button" id="btnEdit">댓글수정</button>'
				+ '</div>'
		}
		
	
	
</script>

</head>
<body>

<h2>답글달기</h2>
<input type="text" name="bno" id="bno" value="51">


<div class="input-group mb-3">
  <input type="text" id="replyer">
  <input type="text" id="reply" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
  <button class="btn btn-outline-secondary" type="button" id="btnWrite">댓글작성</button>
</div>

<div id="replyDiv"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>