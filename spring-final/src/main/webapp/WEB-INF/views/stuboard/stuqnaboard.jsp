<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title></title>
<script type="text/javascript">
	$(function(){
		var code = $('select[name="subjectSelect"]').val();
		$.ajax({
			type:'post',
			url: '/jhta/stud/stuqnaboard.json',
			data : {subjectCode : code},
			dataType: 'json',
			success : function(data){
				var $tbody = $('tbody');
				$(data).each(function(index, item){
					var htmlContent = "<tr>";
						htmlContent += "<td><input type='checkbox' id='deleteCheck-"+item.no+"'</td>";
						htmlContent += "<td>"+item.no+"</td>";
						htmlContent += "<td><a href='detail?bno="+item.no+"'>"+item.title+"</a></td>";
						htmlContent += "<td>"+item.writer+"</td>";
						htmlContent += "<td>"+item.regdate+"</td>";
						htmlContent += "<td>"+item.countView+"</td>";
						htmlContent += "</tr>";
						$tbody.append(htmlContent);
				});
			}
		});
		
		$('select[name="subjectSelect"]').change(function(){
			console.log("실행");
		});
		
		
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
			<select class="form-control" name="subjectSelect">
			<c:forEach var="sub" items="${subject }">
				<option value="${sub.subjectCode }">${sub.sbjectName}</option>
			</c:forEach>
			</select>
		</div>
		
		<table class="table table-striped">
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
				
			</tbody>
		</table>
		<div class="text-center">
			<%@ include file="/WEB-INF/views/board/nav.jsp" %>
		</div>
	</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp" %>
</body>
</html>