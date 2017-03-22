<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<h1>회원가입 폼</h1>
	<div class="row well">
		<!-- userform이라는 이름으로 빈 객체를 만들어 놓는다. 값을 보낼 때 모델객체 안에 담아서 보낸다. -->
		<!-- 유효성 체크가 통과되지 않았을 때  내부이동으로 다시돌아 오게된다. 이때 이 객체가 다시 값을 뿌려준다.-->
		<form:form method="post" action="register.do" commandName="userform">
			<div class="form-group">
				<label for="">아이디</label>
				<form:input path="id" cssClass="form-control"/>
				<form:errors path="id" cssClass="text-danger"></form:errors>
			</div>
			<div class="form-group">
				<label for="">비밀번호</label>
				<form:input path="pwd" cssClass="form-control"/>
				<form:errors path="pwd" cssClass="text-danger"></form:errors>
			</div>
			<div class="form-group">
				<label for="">name</label>
				<form:input path="name" cssClass="form-control"/>
				<form:errors path="name" cssClass="text-danger"></form:errors>
			</div>
			<div class="form-group">
				<label for="">전화번호</label>
				<form:input path="phone" cssClass="form-control"/>
				<form:errors path="phone" cssClass="text-danger"></form:errors>
			</div>
			<div class="form-group">
				<label for="">이메일</label>
				<form:input path="email" cssClass="form-control"/>
				<form:errors path="email" cssClass="text-danger"></form:errors>
			</div>
			<div class="form-group text-right">
				<button type="submit" class="btn btn-primary">가입</button>
				<a href="home.do" class="btn btn-danger">취소</a>
			</div>
		</form:form>
	</div>	
</div>
</body>
</html>
