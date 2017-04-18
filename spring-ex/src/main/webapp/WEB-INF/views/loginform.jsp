<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<nav class="navbar navbar-default">
				<div class="container-fluid">
	    	<div class="navbar-header">
	      		<a class="navbar-brand" href="home.do">우리 회사</a>
	    	</div>
	    	<ul class="nav navbar-nav">
	      		<li class="active"><a href="home.do">홈</a></li>
	      		<li><a href="calendar.do">일정보기</a></li>
	    	</ul>
	    	<ul class="nav navbar-nav pull-right">
	      		<c:if test="${empty LOGIN_MEMBER }">
		      		<li><a href="login.do">로그인</a></li>
	      		</c:if>
	      		<c:if test="${not empty LOGIN_MEMBER }">
		      		<li><a href="logout.do">로그아웃</a></li>
	      		</c:if>
	    	</ul>
		</div>
	</nav>
	<div class="row">
		<div class="col-xs-4 col-xs-offset-4 well">
			<p>로그인 </p>
			<form method="post" action="login.do">
				<div class="form-group">
					<label>아이디</label>
					<input type="text" class="form-control" name="id" />
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" class="form-control" name="pwd" />
				</div>
				<div class="form-group">
					<button class="btn btn-default">로그인</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>