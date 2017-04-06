<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<c:forEach var="student" items="${studentList}">
	<table>
		<thead></thead>
		<tbody>
			<tr>
				<th>번호</th>
				<td>${student.no}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${student.name }</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${student.id }</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>${student.pwd }</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${student.regdate }</td>
			</tr>	
		</tbody>
	</table>

</c:forEach>
<form action="studentExcel.do" method="post">
	<button class="btn btn-primary">학생 목록 다운로드</button>
</form>
</body>
</html>
