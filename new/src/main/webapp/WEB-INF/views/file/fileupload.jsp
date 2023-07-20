<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
<script src="https://kit.fontawesome.com/4863a16a12.js" crossorigin="anonymous"></script>
<script type="text/javascript">
		
		window.addEventListener('load', function(){
			
			btnList.addEventListener('click', function(){
				
				getFileList();
			
			})
	
			// 파일 업로드 버튼이 클릭되었을때...
			btnFileupload.addEventListener('click', function(){
				
				// 웹 개발에서 HTML 에서 Form 데이터를 
				// JavaScript 로 쉽게 전송 할 수 있는 방법을 제공하는 API;
				
				// form 이 가지고 있는 모든 요소를 가지고 갈 수 있음
				let formData = new FormData(fileuploadForm);
				formData.append('name','momo')
				
				console.log("forData :" , formData)
				// FormData 의 값 확인
				
				// pair << 이름 
				for(var pair of formData.entries()){
					console.log(pair);
					console.log(pair[0] +':'+ pair[1]);
					
					
					if(typeof(pair[1]) == 'object'){
						let fileName = pair[1].name;
						let fileSize = pair[1].size;
						// 파일 확장자, 크기체크
						// 서버에 전송 가능한 형식인지 확인
						// 최대 전송가능한 용량을 초과하지 않는지.
								
						if(!checkExtension(fileName, fileSize)){
							
							return false;
						}
						
						console.log('fileName', fileName);
						console.log('fileSize', fileSize);
						console.log('fileType', pair[1].type);
					}
				}
				
				
				fetch('/file/fileuploadActionFetch'
						,{ 
							method: 'post'
							, body : formData
						})
					.then(response => response.json())
					.then(map => fileuploadRes(map))
						
					});
						
			})
			
		
	function checkExtension(fileName, fileSize){

			let maxSize = 1024 * 1024 * 10;
			// .exe, .sh, .zip, .alz 끝나는 문자열
			let regex 	= new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			
			if(maxSize <= fileSize){
				alert("파일 사이즈 초과 ! !")
				return false;
			}
		
		// 문자열에 정규식 패턴을 만족하는 값이 있으면 true, 없으면  false를 리턴한다.
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드 할 수 없습니다.")
				return false;
		}
			return true;
		}
		
		function fileDeleteRes(map){
			if(map.result === 'success'){
				
				divFileDeleteRes.innerHTML = map.msg;
				
				// 리스트 조회 바로 반영 \^o^/
				getFileList();
			}else{
				alert(map.msg);
			}
		}
		
		function fileuploadRes(map){
			if(map.result === 'success'){
			console.log(map);
			divFileuploadRes.innerHTML = map.msg;
			// 게시글 등록
			}else{
			 	alert(map.msg);
			}
		}			
			
		
		function getFileList(){
			
			//file/list/{bno}
			let bno = document.querySelector("#bno").value;
			fetch('/file/list/' + bno)
				.then(response => response.json())
				.then(map => viewFileList(map));
		}
		
		// 파일 삭제
		function attachFileDelete(e){
			(e.dataset.aaa)?'true':'false';
			console.log(e.dataset.bno
							,e.dataset.uuid
							,e.dataset.aaa
							,encodeURIComponent(e.dataset.savePath));
			console.log(e);
			
			let uuid = e.dataset.uuid;
			let bno = e.dataset.bno;
			let savePath = encodeURIComponent(e.dataset.savePath);
			let fileName = e.dataset.filename;
			
			console.log('uuid : ',uuid );
			console.log('bno : ',bno );
			console.log('savePath : ',encodeURIComponent(savePath));
			console.log('fileName : ',fileName );
			console.log('========================== ');
			
			console.log('/file/delete/'+uuid+'/'+bno+'/'+savePath+'/'+fileName);
			
			//fetch 요청
			fetch('/file/delete/'+uuid+'/'+bno+'/'+savePath+'/'+fileName)
				.then(response => response.json())
				.then(map => fileDeleteRes(map));
		}
		
		function viewFileList(map){
			
			console.log(map);
			let content = '';
			if(map.list.length > 0)
					{ map.list.forEach(function(item, index){
						
						let savePath = item.savePath;
						console.log('savePath : ', savePath);
						
						content += 
								'<a href="/file/download?fileName='
								+	encodeURIComponent(savePath)+'">'	
								+	item.filename + '</a>'
//								+ '/' +item.savePath +'&nbsp'
								+ 	'<i onclick="attachFileDelete(this)" ' 
								+	' data-bno="'+item.bno+'" data-uuid="'+item.uuid +'"' 
								+   ' data-savePath="'+encodeURIComponent(savePath)+'" data-fileName="'+item.filename+'" '
								+ 	' class="fa-solid fa-square-xmark" style="color: #a3141b;"></i>'
								+ '<br>';
					})
	
				}else{
					content = '등록된 파일이 없습니다.';
				}
				divFileupload.innerHTML = content;
		}
		
</script>

</head>
<body>
	
	
	
	<h2>파일 업로드</h2>
	<form method="post" action="/file/fileuploadAction" 
								enctype="multipart/form-data" name="fileuploadForm">
	
	<h2>파일선택</h2>
	
	bno : <input type="text" id="bno" name="bno" value="993"><br><br>
	<!-- 같은 name 으로 여러개가 넘어가기 때문에 List 로 받는다. -->
	
	<!-- multiplt ="multiple" 					다수의 파일 선택 가능 -->
	파일 1 :  <input type="file" name="files" multiple="multiple"> <br><br>
	파일 2 :  <input type="file" name="files"> <br><br>
	파일 3 :  <input type="file" name="files"> <br><br>
	파일 4 :  <input type="file" name="files"> <br><br>
	
	<button type="submit">파일 업로드</button>
	<button type="button" id="btnFileupload">Rest 방식 (fetch)파일업로드</button>
	<div id="divFileuploadRes"></div>
	res : ${param.msg}
	
	</form>
	<div id="divFileDeleteRes"></div>
	<h2>파일 리스트 조회</h2>
	<button type="button" id="btnList" >리스트 조회</button>
	<div id="divFileupload"></div>
	

</body>
</html>