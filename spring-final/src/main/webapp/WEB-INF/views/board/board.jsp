<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/navi/adminnavi.jsp" %>
<%@ include file="/WEB-INF/views/navi/adminSidebar.jsp" %>
	  <div class="container" style="margin-left: 250px; padding-top:25px;">
		  <div class="row text-right">
	         홈 > 학적관리 > 입학관리 > 신입학 조회 
	      </div>
	      <div class="row">
	         <h4><span class="glyphicon glyphicon-th-list"></span> 게시판 관리</h4>
	         <hr style="border:solid 0.5px #2C7BB5;">
	      </div>
	      <div class="col-sm-6">
	      <h6><span class="glyphicon glyphicon-th-list"></span> 공지사항</h6>
		      <div class="panel panel-default panel-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>날짜</th>
							<th>조회수</th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>공지사항</td>
							<td>공지사항테스트입니다.</td>
							<td>17-04-12</td>
							<td>0</td>
							<td><a href="javascript:;" class="btn btn-danger btn-xs">삭제</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-sm-6">
			<h6><span class="glyphicon glyphicon-th-list"></span> 1:1문의사항</h6>
		      <div class="panel panel-default panel-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>공지사항</td>
							<td>공지사항테스트입니다.</td>
							<td>17-04-12</td>
							<td>0</td>
							<td><a href="javascript:;" class="btn btn-danger btn-xs">삭제</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row text-center">
			<a href="boardForm" class="btn btn-primary btn-xs text-right">공지사항 작성</a>
		</div>
      </div>
      <%@ include file="/WEB-INF/views/footer/footer.jsp" %>
</body>
</html>