<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<body>
	<%@ include file="/WEB-INF/views/navi/adminnavi.jsp"%>
	<%@ include file="/WEB-INF/views/navi/sidebarprof.jsp"%>
	<!-- 성적/과제/출결 현황 리스트 -->
	<div class="container" style="margin-left: 250px; padding-top: 25px;">
		<div class="row text-right">홈 > 성적관리 > 성적조회 ></div>
		<div class="row">
			<h4>
				<span class="glyphicon glyphicon-th-list"></span> 성적 관리
			</h4>
			<hr style="border: solid 0.5px #2C7BB5;">
		</div>

		<div class="row">
			<div class="panel panel-body" id="score_table">
				<table class="table table-condensed">
					<thead>
						<tr bgcolor="#f0fcff">
							<th>수강번호</th>
							<th>이름</th>
							<th>학번</th>
							<th>학기</th>
							<th>과목명</th>
							<th>이수구분</th>
							<th>학점</th>
							<th>등급</th>
							<th>과제</th>
							<th>출석</th>
							<th>중간</th>
							<th>기말</th>
							<th>수정</th>
						</tr>
					</thead>
					<tbody id="score_td_box">
						<c:forEach var="regilist" items="${regilist }">
							<tr style="text-align: left;">
								<td>${regilist.no}</td>
								<td>${regilist.student.name}</td>
								<td>${regilist.student.id}</td>
								<td>${regilist.subject.selectNo.semeSelect}</td>
								<td>${regilist.subject.subjectName}</td>
								<td>${regilist.subject.passed.passedName}</td>
								<td>${regilist.score.credit}</td>
								<td>${regilist.score.grade}</td>
								<td>${regilist.score.reportScore}</td>
								<td>${regilist.score.attScore}</td>
								<td>${regilist.score.midtermScore}</td>
								<td>${regilist.score.endtermScore}</td>
								<td><a href="scoreform.do?sno=${regilist.score.no }" class="btn btn-primary btn-xs">수정</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</body>
</html>