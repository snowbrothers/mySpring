
			
		
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
							,e.dataset.aaa);
			console.log(e);
			
			let uuid = e.dataset.uuid;
			let bno = e.dataset.bno
			
			
			console.log('/file/delete/'+uuid+'/'+bno);
			
			//fetch 요청
			fetch('/file/delete/'+uuid+'/'+bno)
				.then(response => response.json())
				.then(map => fileDeleteRes(map));
		}
		
		function viewFileList(map){
			
			console.log(map);
			let content = '';
			if(map.list.length > 0)
					{ map.list.forEach(function(item, index){
						
						let savePath = encodeURIComponent(item.savePath);
						console.log(savePath);
						
						content += 
								'<a href="/file/download?fileName='
								+	savePath+'">'	
								+	item.filename + '</a>'
//								+ '/' +item.savePath +'&nbsp'
								+ 	'<i onclick="attachFileDelete(this)" ' 
								+	' data-bno="'+item.bno+'" data-uuid="'+item.uuid+'" '
								+ 	' class="fa-solid fa-square-xmark" style="color: #a3141b;"></i>'
								+ '<br>';
					})
	
				}else{
					content = '등록된 파일이 없습니다.';
				}
				divFileupload.innerHTML = content;
		}