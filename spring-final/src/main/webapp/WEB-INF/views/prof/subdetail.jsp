<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<style>
	hr.one{
   width : 100%;
   border: thin solid #1c86ee;
   color: #1c86ee;
}
</style>
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
			<tbody>
				<colgroup>
					<col width="25%">
					<col width="75%">
				</colgroup>
						<tr>
							<th>과목명</th>
							<td>${subno.subjectName }</td>
						</tr>
						<tr>
							<th>교수</th>
							<td>${subno.professor.name }</td>
						</tr>
						<tr>
							<th>학기</th>
							<td>${subno.selectNo.semeSelect}</td>
						</tr>
						<tr>
							<th>학년</th>
							<td>${subno.grade}학년</td>
						</tr>
						<tr>
							<th>이수구분</th>
							<td>${subno.passed.passedName}</td>
						</tr>
						<tr>
							<th>학과코드</th>
							<td>${subno.siteCode.name}</td>
						</tr>
						<tr>
							<th>학점</th>
							<td>${subno.score}</td>
						</tr>
						<tr>
							<th>강의요일</th>
							<tD>${subno.enroll.enrollDay}</tD>	
						</tr>
						<tr>
							<th>강의시간</th>
							<td>${subno.enroll.enrollTime}</td>
						</tr>
			</tbody>
		</table>
		<div class="pull-right">
			<a href="/jhta/prof/subupdate?no=${subno.enroll.no }" class="btn btn-primary">수정</a>
			<a href="/jhta/prof/subinfo" class="btn btn-warning">뒤로</a>
		</div>
	</div>
</body>
</html>