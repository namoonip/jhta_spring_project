<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				
				// data 가 없을 경우 data.length 가 0 이라서 실행되지 않는다.
				for (var i=0; i<data.length; i++) {
					$("#select-major").append("<option value="+data[i].code+">"+data[i].name+"</option>");	
				}
				
				// data 가 없을 경우 학과선택을 표시하게 하는 코드
				if (data.length == 0) {
					$("#select-major").append("<option value='0'>학과선택</option>");	
				}
			}
		});
	});
	
	$("#search-button").click(function() {
		var dept = $("#select-dept :selected").val();
		var major = $("#select-major :selected").val();
		var semester = $("#select-semester :selected").val();
		
		if (dept == 0 || major == 0 || semester == 0) {
			alert("검색 값을 입력해주세요.");
			return false;
		}
	});
	
	// 페이지를 검색할 때 li 의 값을 읽어와서 페이지를 바꾸는 코드
	$("ul.pagination li > a").click(function(event) {
		event.preventDefault();
		
		if ($(this).attr("id")) {
			var pageNo = $(this).attr("id").replace("pageNo-", "");
			$(":input:hidden#pageNo").val(pageNo);
			
			$("#select-major").append("<option value='${param.major }' selected></option>");
			$("#select-semester").append("<option value='${param.semesterNo }' selected></option>");
			$("#select-page").val("${param.pagination }");
		}
		
		$(".form-inline").submit();
	});
	
	// 전체 표시개수를 변경할 때 데이터를 전달하는 코드
	$("#select-page").change(function(event) {
		if (!"${param.major }") {
			alert("검색 값을 입력해주세요.");
			return false;
		}
		
		$("#select-major").append("<option value='${param.major }' selected></option>");
		$("#select-semester").append("<option value='${param.semesterNo }' selected></option>");
		
		$(".form-inline").submit();
	});
})
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/navi/adminnavi.jsp" %>
<%@ include file="/WEB-INF/views/collegeregister/sidebar-hakjuk.jsp" %>
<div class="container" style="margin-left: 250px; padding-top: 25px;">
	<form method="post" action="adminregsubject" class="form-inline">
		<div class="row">
			<div class="col-sm-12">
				<div class="row">
					<h4><span class="glyphicon glyphicon-th-list"></span> 수강 관리</h4>
					<hr style="border:solid 0.5px #2C7BB5;">
				</div>
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
										<option value="0">대학선택</option>
									<c:forEach items="${deptList }" var="dept">
										<option value="${dept.code }">${dept.name }</option>
									</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label>학과선택:</label>
									<select class="form-control" name="major" id="select-major">
										<option value="0">학과선택</option>
									</select>
								</div>
								<div class="form-group">
									<label>학기선택:</label>
									<select class="form-control" name="semesterNo" id="select-semester">
										<option value="0">학기선택</option>
									<c:forEach items="${semesterList }" var="semester">
										<option value="${semester.no }">${semester.semeSelect }</option>
									</c:forEach>	
									</select>	
								</div>
								<div class="pull-right">
									<button type="submit" class="btn btn-info" id="search-button">조회</button>
								</div>
							</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-2">
				<select class="form-control" name="pagination" id="select-page">
					<option value="5" ${param.pagination eq 5 ? 'selected=selected' : '' }>5개씩 조회</option>
					<option value="10" ${param.pagination eq 10 ? 'selected=selected' : '' }>10개씩 조회</option>
					<option value="20" ${param.pagination eq 20 ? 'selected=selected' : '' }>20개씩 조회</option>
				</select>
			</div>
		</div><br>
		<div class="row">
			<div class="col-sm-12">
				<table class="table table-bordered">
					<colgroup>
						<col width="10%">
						<col width="13%">
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
							<th>수강가능여부</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${subList }" var="sub">
						<tr>
							<td>${sub.ISPASSED }</td>
							<td>${sub.DEPTNAME }</td>
							<td>${sub.SUBJECTNAME }</td>
							<td>${sub.GRADE }</td>
							<td>
								<fmt:formatDate value="${sub.SEMSTART }" pattern="yyyy/MM/dd"/> ~
							 	<fmt:formatDate value="${sub.SEMEND }" pattern="yyyy/MM/dd"/>
							</td>
							<td>${sub.SCORE }</td>
							<td>${sub.LIMITSTU }</td>
							<td>${sub.ENROLLNUM }</td>
							<td>
							<c:choose>
								<c:when test="${sub.LIMITNUMBER } &glt;= ${sub.ENROLLNUM }">수강마감</c:when>
								<c:otherwise>수강가능</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row text-center">
			<div class="col-sm-12">
				<ul class="pagination">
				<c:if test="${paginationList.blockCurrentNo ne paginationList.blockBeginNo }">
					<li><a href="adminregsubject?pageNo=${paginationList.blockBeginNo-1 }" id="pageNo-${paginationList.blockBeginNo-1 }"><span aria-hidden="true">&laquo;</span></a></li>
				</c:if>
				<c:forEach var="pno" begin="${paginationList.blockBeginNo }" end="${paginationList.blockEndNo }">
					<c:if test="${!empty subList }">
						<li><a href="adminregsubject?pageNo=${pno }" id="pageNo-${pno }">${pno }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${paginationList.totalPageNo ne paginationList.blockEndNo }">
					<li><a href="adminregsubject?pageNo=${paginationList.blockEndNo+1 }" id="pageNo-${paginationList.blockEndNo+1 }"><span aria-hidden="true">&raquo;</span></a></li>
				</c:if>
				</ul>
			</div>
		</div>
		<div>
			<input type="hidden" value="1" name="currentPageNo" id="pageNo">
		</div>
	</form>
</div>
</html>