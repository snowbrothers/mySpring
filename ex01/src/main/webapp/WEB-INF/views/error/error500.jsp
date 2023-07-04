<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR 500</title>
</head>
<body>

<h1>예외 발생 ! !</h1>
예외 : ${exception.message}
	
	<ul>
		<c:forEach items="${exception.getStackTrace() }" var="stack"> 
			<li><c:out value="${stack}"></c:out> </li>
		</c:forEach>
	</ul>


</body>
</html>