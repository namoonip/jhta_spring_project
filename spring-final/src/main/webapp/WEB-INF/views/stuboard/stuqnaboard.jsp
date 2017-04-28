<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title></title>
<style type="text/css">
   th { 
   	  text-align: center !important;
      vertical-align: middle !important;
      }
   td{
   	  text-align: center !important;
      vertical-align: middle !important;
   }
</style>
<script type="text/javascript">
	$(function(){
		
		var code = '';
		code = $('select[name="subjectSelect"]').val();
		$('#search-form :input[name="subjectNo"]').val(code);
		
		$('select[name="subjectSelect"]').change(function(){
			 code = $('select[name="subjectSelect"]').val();
			$('#search-form :input[name="subjectNo"]').val(code);
		});
		
		$('#search-btn').click(function(){
			
			$('#search-form').submit();
		});
		
		var error = $('#err').val();
		if (error) {
			alert('수강신청을 먼저 해주세요.');
			history.back();
		}
		
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/navi/stunavi.jsp" %>
<%@ include file="/WEB-INF/views/navi/sidebarstud.jsp" %>
	<div class="container" style="margin-left: 250px; padding-top:25px;">
		<div class="row text-right">
			홈 > 학적관리 > 입학관리 > 신입학 조회
		</div>
		<div class="row">
			<h4><span class="glyphicon glyphicon-th-list"></span> Q&amp;A 게시판</h4>
			<hr style="border:solid 0.5px #2C7BB5;">
		</div>
		<div style="margin-top: 20px;"></div>
		<div class="row well">
			<div class="form-inline">
				<select class="form-control" name="subjectSelect" style="width: 300px;">
				<c:forEach var="item" items="${subject }">
					<option value="${item.division }">${item.subjectName }</option>
				</c:forEach>
				</select>
				<button id="search-btn" class="btn btn-primary">검색</button>
			</div>
		</div>
		<div class="row">
			<table class="table table-striped">
				<colgroup>
						<col width="5%">
						<col width="5%">
						<col width="*">
						<col width="10%">
						<col width="10%">
						<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>
							<input type="checkbox" id="allCheck">
						</th>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${boardList }">
						<tr>
							<td>
								<input type="checkbox" id="deleteCheck-${board.no }">
							</td>
							<td>${board.no }</td>
							<td><a href="stuqnadetail?bno=${board.no }">${board.title }</a></td>
							<td>${board.writer }</td>
							<td><fmt:formatDate value="${board.regdate }"/> </td>
							<td>${board.countView }</td>
						</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="text-right">
			<a href="stuqnaboardform" class="btn btn-primary btn-xs">Q&amp;A 등록</a>
		</div>
		<div class="text-center">
			<div class="text-center">
				<%@ include file="/WEB-INF/views/board/nav.jsp" %>
			</div>
		</div>
	</div>
	<form id="search-form" action="stuqnaboard" method="post">
		<input type="hidden" name="pageNo" value="1">
		<input type="hidden" name="searchType"  value="${serch.searchType }">
		<input id="keyword" type="hidden" name="keyword" value="${search.keyword }" >
		<input type="hidden" name="display"  value="10">
		<input type="hidden" name="subjectNo" value="">
	</form>
	<input type="hidden" id="err" value=${err eq 'error' }>
<%@ include file="/WEB-INF/views/footer/footer.jsp" %>
</body>
</html>