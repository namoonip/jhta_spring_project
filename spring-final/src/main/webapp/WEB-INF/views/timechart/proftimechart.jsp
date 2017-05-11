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
	$(function(){
		
		function getColIndex(day) {
			if (day == '월요일') return 1;
			if (day == '화요일') return 2;
			if (day == '수요일') return 3;
			if (day == '목요일') return 4;
			if (day == '금요일') return 5;
		}
		
		$.ajax({
			type:'get',
			url : 'timeschedule',
			dataType : 'json',
			success : function(data){
				
				console.log(data);
				var $tbody = $('#chart-table tbody');
				$.each(data, function(index, item) {
					var enrollDay = item.enrollDay;
					var times = item.enrollTime.split(",")
					$.each(times, function(index, time) {
						var colIndex = getColIndex(enrollDay) -1;
						$tbody.find("tr").eq(time -1).find('td').eq(colIndex)
						.addClass('day'+colIndex)
						.text(item.subjectName);
						
					})
				})
			}
		});
	});
</script>
<style type="text/css">
	th{
		text-align: center !important;
		width: 50px;
		height: 50px;
	}
	
	td {
		text-align: center !important;
	}
	
	.day0 {
		background-color:#FFCA6C !important;
	}
	.day1 {
		background-color:#FF6C6C !important; 
	}
	.day2 {
		background-color:#FFF136 !important; 
	}
	.day3 {
		background-color:#CFFF24 !important; 
	}
	.day4 {
		background-color:#368AFF !important; 
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/navi/profnavi.jsp" %>
<%@ include file="/WEB-INF/views/navi/sidebarprof.jsp" %>
	<div class="container" style="margin-left: 250px; padding-top:25px;">
		<div class="row text-right">
		</div>
		<div class="row">
			<h4><span class="glyphicon glyphicon-th-list"></span> 시간표!!</h4>
			<hr style="border:solid 0.5px #2C7BB5;">
		</div>
		<div style="margin-top: 20px;"></div>
		<div class="row">
			<table class="table" id="chart-table">
				<thead>
					<tr>
						<th style="background-color: #B0E0E6;"></th>
						<th style="background-color: #DCDCDC;">월</th>
						<th style="background-color: #DCDCDC;">화</th>
						<th style="background-color: #DCDCDC;">수</th>
						<th style="background-color: #DCDCDC;">목</th>
						<th style="background-color: #DCDCDC;">금</th>
					</tr>				
				</thead>
				<tbody>
					<tr>
						<th style="background-color: #FFFACD;">1교시</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th style="background-color: #FFFACD;">2교시</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th style="background-color: #FFFACD;">3교시</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th style="background-color: #FFFACD;">4교시</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th style="background-color: #FFFACD;">5교시</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th style="background-color: #FFFACD;">6교시</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th style="background-color: #FFFACD;">7교시</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th style="background-color: #FFFACD;">8교시</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th style="background-color: #FFFACD;">9교시</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th style="background-color: #FFFACD;">10교시</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<c:forEach var="timeChart" items="${timeChartList }">
		<div hidden="true" id="timechart-${timeChart. enrollNo}">
			<input id="enrollTime" value="${timeChart.enrollTime }">
			<input id="enrollDay" value="${timeChart.enrollDay }">
		</div>	
	</c:forEach>
<%@ include file="/WEB-INF/views/footer/footer.jsp" %>
</body>
</html>