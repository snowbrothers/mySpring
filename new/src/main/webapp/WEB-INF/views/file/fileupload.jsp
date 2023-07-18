<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>

<script type="text/javascript">
		
		window.addEventListener('load', function(){
			
			btnList.addEventListener('click', function(){
				
				getFileList();
			
			})
			
		});
		
		function getFileList(){
			
			//file/list/{bno}
			let bno = document.querySelector("#bno").value;
			fetch('/file/list/' + bno)
				.then(response => response.json())
				.then(map => viewFileList(map));
		}
		
		function viewFileList(map){
			
			console.log(map);
			let content = '';
			if(map.list.length > 0)
					{ map.list.forEach(function(item, index){
						content += item.filename + '/' +item.savePath+'<br>';
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
	
	bno : <input type="text" id="bno" name="bno" value="954"><br><br>
	<!-- 같은 name 으로 여러개가 넘어가기 때문에 List 로 받는다. -->
	
	<!-- multiplt ="multiple" 					다수의 파일 선택 가능 -->
	파일 1 :  <input type="file" name="files" multiple="multiple"> <br><br>
	파일 2 :  <input type="file" name="files"> <br><br>
	파일 3 :  <input type="file" name="files"> <br><br>
	파일 4 :  <input type="file" name="files"> <br><br>
	
	<button type="submit">파일 업로드</button>
	
	${param.msg}
	</form>
	
	<h2>파일 리스트 조회</h2>
	<button type="button" id="btnList" >리스트 조회</button>
	<div id="divFileupload"></div>

</body>
</html>