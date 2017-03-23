<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>일정관리 - 일정 관리폼</title>
</head>
<body>
<div class="container">
	<h1>새 일정 등록하기</h1>
	<div class="row well">
		<form:form action="addtodo.do" method="post" modelAttribute="todoform">
			<div class="form-group">
				<label for="">제목</label>
				<form:input path="title" cssClass="form-control"/>
				<form:errors path="title" cssClass="text-danger"></form:errors>
			</div>
			<div class="form-group">
				<label for="">날짜</label>
				<form:input path="eventDate" type="date" cssClass="form-control"/>
				<form:errors path="eventDate" cssClass="text-danger"></form:errors>
			</div>
			<div class="form-group">
				<label for="">내용</label>
				<form:input path="description" cssClass="form-control"/>
				<form:errors path="description" cssClass="text-danger"></form:errors>
			</div>
			<div class="form-group text-right">
				<button type="submit" class="btn btn-primary">등록</button>
				<a href="home.do" class="btn btn-danger">취소</a>
			</div>
		</form:form>
	</div>
</div>
</body>
</html>
