<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색폼</title>
</head>
<body>

${pageDto }
/${pageDto.cri.pageNo }
/${pageDto.cri.searchField }
/${pageDto.cri.searchWord }	

<form class="row g-3" action="/board/list_bs"
			 method="get" name="searchForm">
			 
  <input type="text" name="pageNo" value="${pageDto.cri.pageNo}">
  <div class="row g-3 justify-content-center">
  <div class="col-auto">
    <select name="searchField" class="form-select" aria-label="Default select example">
  <option value="title" 
  <c:if test ="${pageDto.cri.searchField == 'title' }"> selected 
  </c:if>>제목</option>
  <option value="content" ${pageDto.cri.searchField =='content' ? "selected" : '' } >내용</option>
  <option value="writer" ${pageDto.cri.searchField =='writer' ? "selected" : '' }>작성자</option>
</select>
  </div>
  <div class="col-auto">
    <label for="inputPassword2" class="visually-hidden"></label>
    <input name="searchWord" id="searchWord" type="text" class="form-control" value="${pageDto.cri.searchWord }" >
  </div>
  <div class="col-auto">
    <button type="submit" class="btn btn-primary mb-3" onclick="go(1)">Confirm identity</button>
  </div>
  </div>
</form>

</body>
</html>