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
<style type="text/css">
	.hidden {display: none;}
</style>
<script type="text/javascript">
$(function() {
	$("tbody tr:not(:has(strong))").addClass('hidden');
	$("td > strong").click(function() {
		var $next = $(this).parents("tr").next().toggleClass("hidden");
		if($next.next().is(":has(img)")) {
			$next.next().toggleClass("hidden");
		};
	});
})
</script>
</head>
<body>
<div class="container">
	<h1>일정 리스트</h1>
	<div class="row">
		<table class="table table-condensed">
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
						<td><strong><c:out value="${todo.title}"/></strong>
							<c:if test="${not empty todo.attachFilename }">
								<a href="download.do?no=${todo.no}" class="pull-right btn btn-xs btn-link">${todo.attachFilename }</a>						
							</c:if>
						</td>
						<td>${todo.completed}</td>
					</tr>
					<tr class="hidden">
						<td></td>
						<td><c:out value="${todo.description }"/></td>
						<td>
							<a href="complete.do?no=${todo.no }" class="btn btn-primary btn-xs">처리완료</a>
							<a href="delete.do?no=${todo.no }" class="btn btn-danger btn-xs">삭제</a>
						</td>
					</tr>
					<c:if test="${not empty todo.mapFilename}">
						<tr class="hidden">
							<td></td>
							<td><img src="resources/images/map/${todo.mapFilename }" width="200px;" height="200px;"></td>
							<td></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="row text-right">
		<a href="home.do" class="btn btn-default">홈</a>
		<a href="addtodo.do" class="btn btn-primary">새 일정</a>
	</div>
</div>
</body>
</html>