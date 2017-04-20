<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@ include file="/WEB-INF/views/navi/adminnavi.jsp" %>
<%@ include file="/WEB-INF/views/navi/sidebarscore.jsp" %>
	<div class="container" style="margin-left: 250px; padding-top: 25px;">
		<div class="panel panel-heading">
			<table class="table table-condensed">
				<tbody>
					<tr>
						<td bgcolor="#dceef3" style="color: #333; width: 10%; vertical-align: middle; height: 30px;"><strong>전체 취득점수</strong></td>
						<td bgcolor="#f0fcff">
							<label>평점평균</label>
							<input class="form-control" type="text" id="score_box3" disabled="disabled"/>		
						</td>
						<td bgcolor="#f0fcff">
							<label>백분율</label>
							<input class="form-control" type="text" id="score_box3" disabled="disabled"/>
						</td>
						<td bgcolor="#f0fcff">
							<label>신청학점</label>
							<input class="form-control" type="text" id="score_box3" disabled="disabled"/>
						</td>
						<td bgcolor="#f0fcff">
							<label>취득학점</label>
							<input class="form-control" type="text" id="score_box3" disabled="disabled"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="panel panel-body">
			<label>전체성적 리스트 (홍진호)</label>
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
							<td><a href="scoreform.do?sno=${regilist.score.no }"class="btn btn-primary btn-xs">수정</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<label>학기별 리스트 (홍진호)</label>
			<table class="table table-condensed">
				<thead>
					<tr bgcolor="#f0fcff">
						<th>학기</th>
						<th>이수학년</th>
						<th>신청학점</th>
						<th>취득학점</th>
						<th>평균점수</th>
						<th>백분율점수</th>
						<th>학사경고</th>
						<th>전필</th>
						<th>전선</th>
						<th>교필</th>
						<th>교선</th>
					</tr>
				</thead>
				<tbody id="score_td_box">
					<tr style="text-align: left;">
						<td>${savg.semename }</td>
						<td>1</td>
						<td>${savg.credit1 }</td>
						<td>${savg.credit2 }</td>
						<td>${savg.credit3 }</td>
						<td>${savg.credit4 }</td>
						<td>N</td>
						<td>${savg.pass1 }</td>
						<td>${savg.pass2 }</td>
						<td>${savg.pass3 }</td>
						<td>${savg.pass4 }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="panel panel-footer">
			<label>자료가 *건 조회되었습니다.</label>
		</div>
	</div>
</body>
</html>