<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Employee Search Page</title>
<link type="text/css" rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="resources/jquery/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="resources/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
$(function () {   
	function setSearchFormField(pageNo) {
		pageNo = pageNo || 1;
	    $("#search-form :input[name='pageNo']").val(pageNo);
	      
	    var rows = $("select[name='rows']").val();
	    $("#search-form :input[name='display']").val(rows);
	      
	    var opt = $("#origin-search-form select[name='opt']").val();
	    $("#search-form :input[name='opt']").val(opt);
	      
	    var keyword = $("#origin-search-form :input[name='keyword']").val();
	    $("#search-form :input[name='keyword']").val(keyword);
	   }
	   
	$("select[name='rows']").change(function(){
		// 지금 선택된 보기 갯수를 hidden 필드에 설정
	    //var rows = $(this).val();
	    //$(":input[name='display']").val(rows);
	      
	    // 무조건 1페이지로 hidden 필드에 설정
	    //$(":input[name='pageNo']").val(1);
	      
	    setSearchFormField();
	    $("#search-form").submit();
	});
	
	$("ul.pagination li > a").click(function(event) {
		event.preventDefault();
	      
	    // 지금 선택한 페이지번호를 hidden 필드에 설정
	    var pageNo = $(this).attr("id").replace("navi-", "");
	    $(":input[name='pageNo']").val(pageNo);
	      
	    // 지금 선택된 보기 갯수를 hidden 필드에 설정
	    //var rows = $("select[name='rows']").val();
	    //$(":input[name='display']").val();
	    setSearchFormField(pageNo);
	    $("#search-form").submit();
	});
});   
</script>
</head>
<body>
<div class="container">
	<h1>사원 조회</h1>
	
	<div class="row pull-right">
		<select name="rows" class="form-control" style="width: 130px;">
			<option value="5" ${search.display eq 5 ? 'selected=selected' : ''}>5개씩 보기</option>
			<option value="10" ${search.display eq 10 ? 'selected=selected' : ''}>10개씩 보기</option>
			<option value="20" ${search.display eq 20 ? 'selected=selected' : ''}>20개씩 보기</option>
			<option value="50" ${search.display eq 50 ? 'selected=selected' : ''}>50개씩 보기</option>
		</select>
	</div>
	
	<div class="row">
		<table class="table">
			<thead>
				<tr>
					<th>사원 번호</th>
					<th>이름</th>
					<th>부서 번호</th>
					<th>직종</th>
					<th>전화번호</th>
					<th>급여</th>
					<th>커미션</th>
					<th>입사일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="emp" items="${employees}">
					<tr>
						<td>${emp.id }</td>
						<td>${emp.name }</td>
						<td>${emp.dept }</td>
						<td>${emp.job }</td>
						<td>${emp.phone }</td>
						<td><fmt:formatNumber value="${emp.salary }" pattern="#,###"/></td>
						<td><fmt:formatNumber value="${emp.comm }" pattern="#,##%"/></td>
						<td><fmt:formatDate value="${emp.hiredate }" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="row text-center">
		<ul class="pagination">
		<c:if test="${pagination.currentBlock gt 1}">
			<li>
				<a href="search.fo?pageNo=${pagination.prevBlock }" id="navi-${pagination.prevBlock }" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>		
		</c:if>
		<c:forEach var="pno" begin="${pagination.beginPage }" end="${pagination.endPage }">
			<c:choose>
				<c:when test="${pno eq pagination.currentPage }">
					<li class="active">
						<a id="navi-${pno }" href="search.do?pageNo=${pno }">${pno }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a id="navi-${pno }" href="search.do?pageNo=${pno }">${pno }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pagination.currentBlock lt pagination.totalBlocks}">
			<li>
				<a href="search.fo?pageNo=${pagination.nextBlock }" id="navi-${pagination.nextBlock }" aria-label="Previous">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>		
		</c:if>
		</ul>
	</div>
	
	<div class="row">
		<div class="row text-center">
			<form id="origin-search-form" action="" class="form-inline">
				<div class="form-group">
					<label for="" class="sr-only">검색 옵션</label>
					<select name="opt" class="form-control">
						<option value="dept" ${search.opt eq 'dept' ? 'selected=selected' : ''}>부서 번호</option>
						<option value="job" ${search.opt eq 'job' ? 'selected=selected' : ''}>직종</option>
						<option value="name" ${search.opt eq 'name' ? 'selected=selected' : ''}>사원명</option>
						<option value="salary" ${search.opt eq 'salary' ? 'selected=selected' : ''}>급여</option>
					</select>
				</div>
				<div class="form-group">
					<label for="" class="sr-only">검색어</label>
					<input type="text" class="form-control" name="keyword" value="${search.keyword }"/>
				</div>
				<button type="submit" class="btn btn-default">검색</button>
			</form>
		</div>
	</div>
	<form id="search-form" action="search.do">
		<input type="hidden" name="pageNo" value="1"/>
		<input type="hidden" name="opt" value=""/>
		<input type="hidden" name="keyword" value=""/>
		<input type="hidden" name="display" value="5"/>
	</form>
</div>
</body>
</html>