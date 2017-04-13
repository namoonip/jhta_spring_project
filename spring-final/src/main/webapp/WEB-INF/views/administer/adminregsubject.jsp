<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#select-dept").change(function() {
		var dept = $(this).val();
		
		$.ajax({
			url: "adminregsubjectmenu?dept=" + dept,
			dataType: "json",
			type: "POST",
			success: function(data) {
				$("#select-major").empty();
				
				for (var i=0; i<data.length; i++) {
					$("#select-major").append("<option value="+data[i].code+">"+data[i].name+"</option>");	
				}
			}
		});
	});
})
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/navi/adminnavi.jsp" %>
<%@ include file="/WEB-INF/views/navi/sidebarsubject.jsp" %>
<div class="container" style="margin-left: 250px; padding-top: 25px;">
	<form method="post" action="adminregsubject" class="form-inline">
		<div class="row">
			<div class="col-sm-12">
				<h4>수강신청관리</h4><hr>
				<table class="table table-bordered">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<thead>
						<tr>
							<th><label>조회</label></th>
							<th>
								<div class="form-group">
									<label>대학선택:</label>
									<select class="form-control" name="dept" id="select-dept">
										<option>학과선택</option>
									<c:forEach items="${deptList }" var="dept">
										<option value="${dept.code }">${dept.name }</option>
									</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label>학과선택:</label>
									<select class="form-control" name="major" id="select-major"></select>
								</div>
								<div class="form-group">
									<label>학기선택:</label>
									<select class="form-control" name="">
										<option value="">2016-1</option>
										<option value="">2016-2</option>
										<option value="">2017-1</option>
										<option value="">2017-2</option>
									</select>	
								</div>
								<div class="pull-right">
									<a href="adminregsubject" class="btn btn-default">전체조회</a>
									<button type="submit" class="btn btn-info">조회</button>
								</div>
							</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-2">
				<select class="form-control" name="">
					<option value="">10개씩 조회</option>
					<option value="">20개씩 조회</option>
					<option value="">50개씩 조회</option>
				</select>
			</div>
		</div><br>
		<div class="row">
			<div class="col-sm-12">
				<table class="table table-bordered">
					<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="*">
						<col width="5%">
						<col width="20%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="10%">
					</colgroup>
					<thead class="table-active">
						<tr>
							<th>이수구분</th>
							<th>시행학과</th>
							<th>과목명</th>
							<th>학년</th>
							<th>수강신청기간</th>
							<th>학점</th>
							<th>인원제한</th>
							<th>신청인원</th>
							<th>개설상태</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${subList }" var="sub">
						<tr>
							<td>${sub.isPassed }</td>
							<td>${sub.siteCode.name }</td>
							<td>${sub.subjectName }</td>
							<td>${sub.grade }</td>
							<td></td>
							<td>${sub.score }</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row text-center">
			<div class="col-sm-12">
				<ul class="pagination">
					<li><a href="#"><span aria-hidden="true">&laquo;</span></a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#"><span aria-hidden="true">&raquo;</span></a></li>
				</ul>
			</div>
		</div>
	</form>
</div>
</html>