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
<script type="text/javascript">
	$(function() {
		$("#att_Btn").click(function() {
			$('#attDataBox').empty();
			$('#attDataBox').append('<label>홍길동 디지털코드 출석정보</label><div class="progress"><div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;" id="attDataBar">60%</div></div>');			
		});
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/navi/adminnavi.jsp" %>
<%@ include file="/WEB-INF/views/navi/sidebarscore.jsp" %>
	<!-- 성적/과제/출결 현황 리스트 -->
	<div class="container" style="margin-left: 250px; padding-top: 25px;">
		<div class="panel panel-heading">
		<h3>성적관리</h3>
		<hr style="border:solid 0.5px #2C7BB5;">		                            	   

		<form class="form-group" method="post" action="">
			<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#score" aria-controls="score" role="tab" data-toggle="tab" aria-expanded="true">성적</a></li>
					<li role="presentation"><a href="#attendance" aria-controls="attendance" role="tab" data-toggle="tab" aria-expanded="false">출결</a></li>
					<li role="presentation"><a href="#report" aria-controls="report" role="tab" data-toggle="tab" aria-expanded="false">과제현황</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="score">
					<table class="table table-condensed">
						<tbody>
							<tr>
								<td bgcolor="#dceef3" style="color: #333; width: 10%; vertical-align: middle; height: 30px;"><strong>조회</strong></td>
								<td bgcolor="#f0fcff">
									과정구분: 
									<select>
										<option value="">재학생</option>
										<option value="">계절학기</option>
									</select>
								</td>
								<td bgcolor="#f0fcff">
									이름:
									<input type="text"/>
								</td>
								<td bgcolor="#f0fcff">
									학기:
									<select>
										<option value="">2015년 1학기</option>
										<option value="">2015년 2학기</option>
										<option value="">2016년 1학기</option>
										<option value="">2016년 2학기</option>
										<option value="">2017년 1학기</option>
										<option value="">2017년 2학기</option>
									</select>
								</td>
								<td bgcolor="#f0fcff">
									<button class="btn btn-default btn-xs" type="submit">조회하기</button>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="panel panel-body">
						<table class="table table-condensed">
							<thead>
								<tr bgcolor="#f0fcff">
									<th>수강번호</th>
									<th>학번</th>
									<th>학년</th>
									<th>이름</th>
									<th>교과목명</th>
									<th>이수구분</th>
									<th>출결점수</th>
									<th>과제점수</th>
									<th>중간점수</th>
									<th>기말점수</th>
									<th>등급</th>
									<th>학점</th>
									<th>수정</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="scoreinfolist" items="${scoreinfolist }">
								<tr>
									<td>${scoreinfolist.no }</td>
									<td>${scoreinfolist.student.id }</td>
									<td>${scoreinfolist.student.grade }</td>
									<td>${scoreinfolist.student.name }</td>
									<td>${scoreinfolist.subject.subjectName }</td>
									<td>${scoreinfolist.subject.isPassed }</td>
									<td>${scoreinfolist.score.attScore }</td>
									<td>${scoreinfolist.score.reportScore }</td>
									<td>${scoreinfolist.score.midtermScore }</td>
									<td>${scoreinfolist.score.endtermScore }</td>
									<td>${scoreinfolist.score.scoreGrade }</td>
									<td>${scoreinfolist.score.scoreCredit }</td>
									<td><a href="" class="btn btn-default btn-xs">수정</a></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>	
				
				<div role="tabpanel" class="tab-pane" id="attendance">
					<table class="table table-condensed">
						<tbody>
							<tr>
								<td bgcolor="#dceef3" style="color: #333; width: 10%; vertical-align: middle; height: 30px;"><strong>조회</strong></td>
								<td bgcolor="#f0fcff">
									학기선택:
									<select>
										<option value="">2015년 1학기</option>
										<option value="">2015년 2학기</option>
										<option value="">2016년 1학기</option>
										<option value="">2016년 2학기</option>
										<option value="">2017년 1학기</option>
										<option value="">2017년 2학기</option>
									</select>
								</td>
								<td bgcolor="#f0fcff">
									과목선택:
									<select>
										<option value="">디지털코드</option>
										<option value="">회로이론</option>
										<option value="">공업수학</option>
										<option value="">C언어 프로그래밍</option>
									</select>
								</td>
								<td bgcolor="#f0fcff">
									<button class="btn btn-default btn-xs" type="submit">조회하기</button>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="panel panel-body">
						<div id="attDataBox"></div>
						<table class="table table-condensed">
							<thead>
								<tr bgcolor="#f0fcff">
									<th>학번</th>
									<th>이름</th>
									<th>학기</th>
									<th>교과목명</th>
									<th>출석일수</th>
									<th>선택</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>testid</td>
									<td>홍길동</td>
									<td>2015년 1학년 1학기</td>
									<td>디지털회로</td>
									<td>13</td>
									<td><button class="btn btn-primary btn-xs" id="att_Btn" type="button">출석현황</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				<div role="tabpanel" class="tab-pane" id="report">
					<table class="table table-condensed">
						<tbody>
							<tr>
								<td bgcolor="#dceef3" style="color: #333; width: 10%; vertical-align: middle; height: 30px;"><strong>조회</strong></td>
								<td bgcolor="#f0fcff">
									과정구분: 
									<select>
										<option>재학생</option>
										<option>계절학기</option>
										<option>재학생</option>
									</select>
								</td>
								<td bgcolor="#f0fcff">
									학기선택:
									<select>
										<option value="">2015년 1학기</option>
										<option value="">2015년 2학기</option>
										<option value="">2016년 1학기</option>
										<option value="">2016년 2학기</option>
										<option value="">2017년 1학기</option>
										<option value="">2017년 2학기</option>
									</select>
								</td>
								<td bgcolor="#f0fcff">
									과목선택:
									<select>
										<option value="">디지털코드</option>
										<option value="">회로이론</option>
										<option value="">공업수학</option>
										<option value="">C언어 프로그래밍</option>
									</select>
								</td>
								<td bgcolor="#f0fcff">
									<button class="btn btn-sm-default" type="submit">조회하기</button>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="panel panel-body">
						<table class="table table-condensed">
							<thead>
								<tr bgcolor="#f0fcff">
									<th>학번</th>
									<th>학기</th>
									<th>교과목명</th>
									<th>제출기한</th>
									<th>제출일</th>
									<th>과제명</th>
									<th>점수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>testid</td>
									<td>2015년 1학년 1학기</td>
									<td>디지털회로</td>
									<td>2015.07.21</td>
									<td>2015.07.16</td>
									<td>코드별 정리</td>
									<td>7 / 10</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</form>
		</div>
	</div>
</body>
</html>