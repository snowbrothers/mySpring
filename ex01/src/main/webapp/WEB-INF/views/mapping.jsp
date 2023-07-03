<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mapping.jsp</title>
</head>
<body>

<!-- MappingController 와 연결 확인 -->
	<h2>짜잔</h2>
	
	이름 : ${name } <br>
	나이 : ${age }<br>
	==========================
	
	<h2>파라메터 자동수집 VO 출력</h2>
	getMappingVO.name = ${member.name }<br>
	getMappingVO.age = ${member.age }<br>
	날짜 출력 : ${member.dueDate}<br>
	메세지 : ${message }<br>
	<!-- 링크로 메서드 호출 -->
	
	<h3>배열 출력</h3>
	<!-- 리퀘스트영역에 공유됨 -->
	<!-- param. 가능 -->
	배열출력 : ${ids}<br>
	
	
	<h3>리스트 출력</h3>
	<a href="/mapping/getMappingList?ids=이한규&ids=김태리&ids=오정세&ids=강하늘">리스트정보출력</a><br>
	
	<a href="/mapping/getMappingArr?ids=이한규&ids=김태리&ids=오정세&ids=강하늘">배열정보출력</a><br>
	
	
	<a href="/mapping/requestMapping?name=이한규">메서드 2 호출</a><br>
	
	<a href="/mapping/getMapping?name=김말이&age=10">getMapping 호출</a><br>
	
	
	<a href="/mapping/getMappingVO?name=자동수집&age=10&dueDate=2023/07/03">getMappingVO 호출</a><br>
	<!-- form 태그로호출 -->
	<form action="/mapping/requestMapping" method="post">
		<input type="submit" value="메서드2호출">
	</form>
	
	<h3>객체 리스트를 파라메터로 전달</h3>
	파라메터 전달 방법 : 
	list[0].name=momo&list[0].age=1234&list[1].name=admin&list[1].age=120<br>
	
	<script type="text/javascript">
		function voList() {
			let url = "/mapping/getMappingMemberList?"
					+"list[0].name=momo&list[0].age=1234"
					+"&list[1].name=admin&list[1].age=120"
			
			url = encodeURI(url);					
			alert(url);
			console.log(url);
			location.href=url;
			
		}
	</script>
	
	<a href="#" onclick="voList()">객체리스트 전달</a>	
	
	<form action="getMappingMemberList" method="post">
		<input type="submit" value="전송">
	</form>

</body>
</html>