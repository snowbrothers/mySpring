<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>

<h2>로그인</h2>

<form method="post" action="/home/loginAction">
<input type="text" name="id" id="id" placeholder="아이디">
<input type="password" name="pw" id="pw" placeholder="비밀번호">
<input type="submit" value="로그인">
</form>
</body>
</html>