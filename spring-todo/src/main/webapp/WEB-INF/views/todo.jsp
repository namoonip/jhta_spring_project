<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>일정 관리 - 일정 목록</title>
</head>
<body>
<div class="container">
	<h1>일정 리스트</h1>
	
	<div class="row">
	<table class="table">
		<colgroup>
			<col width="20%" />
			<col width="60%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th>날짜</th>
				<th>제목</th>
				<th>처리여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="todo" items="${todoList }">
				<tr>
					<td><fmt:formatDate value="${todo.eventDate}"/></td>
					<td><c:out value="${todo.title}"/></td>
					<td>${todo.completed}</td>
				</tr>			
			</c:forEach>
		</tbody>
	</table>
	<div class="text-right">
		<a href="home.do" class="btn btn-default">홈</a>
	</div>
	</div>
</div>
</body>
</html>