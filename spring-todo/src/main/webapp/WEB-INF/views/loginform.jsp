<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>일정관리 - 홈</title>
</head>
<body>
<div class="container">
	<h1>로그인 폼</h1>
	<div class="row well">
	
		<c:if test="${param.error eq 'invalid'}">
			<div class="alert alert-danger">
				<strong>오류!</strong> 아이디 혹은 비밀번호가 유효한 값이 아닙니다.
			</div>
		</c:if>
		<c:if test="${param.error eq 'deny'}">
			<div class="alert alert-danger">
				<strong>오류!</strong> 로그인이 필요한 서비스입니다.
			</div>
		</c:if>
		<form:form action="login.do" method="post">
			<div class="form-group">
				<label for="">아이디</label>
				<input type="text" name="id" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="">비밀번호</label>
				<input type="password" name="pwd" class="form-control"/>
			</div>
			<div class="form-group text-right">
				<button type="submit" class="btn btn-primary">로그인</button>
				<a href="home.do" class="btn btn-warning">취소</a>
			</div>
		</form:form>
	</div>
</div>
</body>
</html>