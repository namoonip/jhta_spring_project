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
	$("#all-check").change(function() {
		var isChecked = $(":input[name='dnoList']").attr("checked");
		
		if (!isChecked) {
			$(":input[name='dnoList']").attr("checked", true);
		} else {
			$(":input[name='dnoList']").attr("checked", false);
		}
	});
	
	$("#delete-button").click(function() {
		if (!$(":input[name='dnoList']").attr("checked")) {
			alert("삭제할 쪽지를 선택해주세요.");
			return false;
		}
	});
})
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/navi/adminnavi.jsp" %>
<%@ include file="/WEB-INF/views/navi/adminSidebar.jsp" %>
<div class="container" style="margin-left: 250px; padding-top: 25px;">
	<form method="get" action="deletemessage">
		<div class="row" style="margin-bottom: 15px;">
			<div class="col-sm-12">
				<div class="btn-group">
					<a href="adminrecmessagebox" class="btn btn-info">받은쪽지</a>
					<a href="adminsendmessagebox" class="btn btn-info">보낸쪽지</a>
					<a href="adminmessageform" class="btn btn-info">쪽지쓰기</a>
				</div>			
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<table class="table table-bordered">
					<colgroup>
						<col width="70%">
						<col width="30%">
					</colgroup>
					<tbody>
						<tr>
							<td style="vertical-align: middle;">
								읽지 않은 쪽지가 0통이 있습니다. 전체 받은 쪽지 (0통)
							</td>
							<td class="text-right">
								<button class="btn btn-default" id="delete-button">선택삭제</button>
								<button class="btn btn-default">전체삭제</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>받은쪽지</p>
				<table class="table table-bordered">
					<colgroup>
						<col width="5%">
						<col width="10%">
						<col width="*">
						<col width="15%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>
								<input type="checkbox" name="all" id="all-check">
							</th>
							<th>보낸사람</th>
							<th>제목</th>
							<th>첨부</th>
							<th>보낸날짜</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${messageList }" var="message">
						<c:if test="${message.isDeletedBySender ne 'Y'.charAt(0) }">
						<tr>
							<td>
								<input type="checkbox" name="dnoList" value="${message.no }">
							</td>
							<td>${message.writerName }</td>
							<td><a style="cursor: pointer;" data-toggle="modal" data-target="#modal-${message.no }">${message.title }</a></td>
							<td><a href="messagedownload?no=${message.no }">${message.filename }</a></td>
							<td><fmt:formatDate value="${message.sendTime }" pattern="M/dd"/></td>
						</tr>
						</c:if>
						<div id="modal-${message.no }" class="modal fade" role="dialog">
							<div class="modal-dialog modal-sm">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<p style="text-align: center;">${message.title }<p>
									</div>
									<div class="modal-body">
										<p>${message.contents }</p>
									</div>
									<div class="modal-footer text-right">
										<button type="button" class="btn btn-info" data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row text-center">
			<div class="col-sm-12">
				<ul class="pagination">
					<li><a href="adminsendmessagebox?pno=${pagination.beginPage-1 }"><span aria-hidden="true">&laquo;</span></a></li>
				<c:forEach begin="${pagination.beginPage }" end="${pagination.endPage }" var="pageNo">
					<li><a href="adminsendmessagebox?pno=${pageNo }">${pageNo }</a></li>
				</c:forEach>
					<li><a href="adminsendmessagebox?pno=${pagination.endPage+1 }"><span aria-hidden="true">&raquo;</span></a></li>
				</ul>
			</div>
		</div>
	</form>
</div>
</html>