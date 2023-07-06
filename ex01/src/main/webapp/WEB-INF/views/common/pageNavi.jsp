<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 네비</title>
<script type="text/javascript">
	// 
	function go(page){
		
		// value 빠졌었음
		document.searchForm.pageNo.value = page;
		
		document.searchForm.submit();	
		
	}
	
</script>

</head>
<body>

    <c:set value="${pageDto}" var="dto"></c:set>
	
	
<!-- 페이지 블럭 생성 -->
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item ${dto.prev?'':'disabled' }"><a class="page-link" onclick='go(${dto.startNo - 1 })'>이전</a></li>
	
	<!-- jstl 반복문 사용법 -->
	<c:forEach begin="${dto.startNo }" end="${dto.endNo }" var="i">
    <li class="page-item"><a class="page-link ${pageDto.cri.pageNo == i ? 'active':'' }" onclick='go(${i})'>${i }</a></li>
    </c:forEach>
    
    
    <li class="page-item ${dto.next?'':'disabled' }"><a class="page-link" onclick='go(${dto.endNo + 1 })'>다음</a></li>
  </ul>
</nav>

</body>
</html>