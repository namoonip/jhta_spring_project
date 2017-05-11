<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/navi/profnavi.jsp" %>
<%@ include file="/WEB-INF/views/navi/sidebarprof.jsp" %>
<div class="container" style="margin-left:250px; padding-top:25px;">
	<h1>강의조회</h1>
		<hr class="one">
		<table class="table table-condensed">
			<colgroup>
				<col width="10%">
				<col width="50%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">				
			</colgroup>
			<thead style="background-color: #E0FFFF">
				<tr>
					<th>번호</th>
					<th>과목명</th>
					<th>수강요일</th>
					<th>수강시간</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${subList}" varStatus="status">
					<tr>
						<td>${status.count } </td>
						<td><a href="/jhta/prof/subdetail?no=${item.no }">${item.subject.subjectName }</a></td>
						<td>${item.enrollDay }</td>
						<td>${item.enrollTime }</td>
						<td><a href="/jhta/prof/subupdate?no=${item.no }" class="btn btn-primary btn-sm">수정</a></td>
						<td><a href="/jhta/prof/subdel?no=${item.no }" class="btn btn-danger btn-sm">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="add text-right">
			<a href="/jhta/prof/addenrollform"><button class="btn btn-default">등록</button></a>
		</div>
	</div>
</body>
</html>