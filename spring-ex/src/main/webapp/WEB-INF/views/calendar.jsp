<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.3.1/fullcalendar.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://momentjs.com/downloads/moment.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/locale/ko.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.3.1/fullcalendar.min.js"></script>	 
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.3.1/locale/ko.js"></script>	 
	<script type="text/javascript">
	$(function() {
		// 모달창이 켜질 때 모달창의 값을 초기화한다.
		function initializeForm(date) {
			var yyyymmdd = date.format();
			var now = new Date();
			var hour = now.getHours();
			
			$("#event-form-modal #event-title").val("");
			$("#event-form-modal #event-description").val("");
			$("#event-form-modal #event-start-date").val(yyyymmdd);
			$("#event-form-modal #event-end-date").val(yyyymmdd);
			$("#event-form-modal #event-start-hour").val(hour);
			$("#event-form-modal #event-start-minute").val("00");
			$("#event-form-modal #event-end-hour").val(parseInt(hour)+1);
			$("#event-form-modal #event-end-minute").val("00");		
		}
		
		// 새로 등록할 일정정보를 모달창에서 읽어와서 객체로 만들기
		function createEventData() {
			var eventData = {};
			eventData["title"] = $("#event-title").val();
			eventData["description"] = $("#event-description").val();
			eventData["startDate"] = $('#event-start-date').val();
			eventData["startHour"] = $('#event-start-hour').val();
			eventData["startMinute"] = $('#event-start-minute').val();
			if (!$("#event-all-day").prop("checked")) {
				eventData["endDate"] = $('#event-end-date').val();
				eventData["endHour"] = $('#event-end-hour').val();
				eventData["endMinute"] = $('#event-end-minute').val();
			}
			eventData["allDay"] = $("#event-all-day").prop("checked");
			
			return eventData;
		}
		
		// 날짜에 대한 타임값을 YYYY-MM-DD HH:mm 형식을 문자열로 변환하기
		function timeToString(time) {
			return moment(new Date(time)).format("YYYY-MM-DD HH:mm");
		}		
		
		// 새로운 일정정보를 등록하는 버튼을 클릭했을 때 실행된다.
		$("#add-event-btn").click(function() {
			$.ajax({
				type:'post',
				url:'addevent.do',
				dataType:'json',
				data:createEventData(),	
				success:function(data) {
					$("#event-form-modal").modal("hide");
					// 캘린더를 갱신한다.
					$("#calendar-box").fullCalendar( 'refetchEvents' );
				}
			});
		});
		
		// 캘린더를 초기화한다.
		$("#calendar-box").fullCalendar({
			// [events : 일정데이트를 조회하는 콜백함수를 등록한다.]
			// 콜백함수는 캘린더에서 년/월/주가 변경될 때마다 실행된다.
			// 콜백함수는 start와 end는 moment함수다.
			// start와 end는 캘린더의 시작일자와 종료일자 정보를 담고 있다.
			events: function(start, end, timezone, callback) {
				$.ajax({
					url:"events.do",
					data:{start:start.format(), end:end.format()},
					dataType:"json",
					success:function(data) {
						// data에는 해당 사용자의 일정정보들이 들어있다.
						// data -> [{"id":1,"title":"테스트","start":1490857200000,"end":1490860800000,"description":"테스트"}]
						// 서버로부터 전달받은 데이터의 시작일/종료일이 time값이다.
						
						// 일정들을 하나씩 순회하면서 start값과 end값을 날짜형식으로 변환한다.
						// 1490857200000 -> 2017-03-25 09:00
						$.each(data, function(index, item) {
							// 타임값을 날짜형식의 문자열로 변환한다.
							item.start = timeToString(item.start);
							item.end = timeToString(item.end);
						})
						// 일정정보를 callback함수에 전달하고 callback함수를 실행한다.
						// callback함수를 실행하면 캘린더가 갱신된다.
						callback(data);
					},
					error:function() {
						alert("오류 발생");
					}
				});
				
			},	
			// [dayClick : 캘린더의 날짜를 클릭했을 때 실행되는 콜백함수다.]
			dayClick: function(date, jsEvent, view) {
				// 일정정보를 입력하는 모달창의 입력값을 초기화한다.
				initializeForm(date);
				// 모달창을 표시한다.
				$("#event-form-modal").modal("show");

			},
			// [eventClick : 캘린더에 표시된 일정 중 하나를 클릭했을 때 실행되는 콜백함수다.]
			eventClick: function(event, jsEvent, view) {
				console.log(event);
			}
		});
		
	})
	</script>	
</head>
<body>
<div class="container">
	<nav class="navbar navbar-default">
				<div class="container-fluid">
	    	<div class="navbar-header">
	      		<a class="navbar-brand" href="home.do">우리 회사</a>
	    	</div>
	    	<ul class="nav navbar-nav">
	      		<li><a href="home.do">홈</a></li>
	      		<li class="active"><a href="calendar.do">일정보기</a></li>
	    	</ul>
	    	<ul class="nav navbar-nav pull-right">
	      		<c:if test="${empty LOGIN_MEMBER }">
		      		<li><a href="login.do">로그인</a></li>
	      		</c:if>
	      		<c:if test="${not empty LOGIN_MEMBER }">
		      		<li><a href="logout.do">로그아웃</a></li>
	      		</c:if>
	    	</ul>
		</div>
	</nav>
	<div class="row">
		<div class="col-xs-9">
			<div id="calendar-box"></div>
		</div>
		<div class="col-xs-3">
			<div class="panel panel-default">
				<div class="panel-heading">사용자 목록</div>
				<ul class="list-group">
				<c:forEach var="member" items="${members }">
					<c:choose>
						<c:when test="${member.id ne LOGIN_MEMBER.id }">
							<li class="list-group-item" id="member-id-${member.id }">${member.username }</li>
						</c:when>
					</c:choose>
				</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="modal fade" id="event-form-modal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        			<h4 class="modal-title" id="gridSystemModalLabel">새 일정 등록폼</h4>
      			</div>
      			<div class="modal-body">
      				<form class="form-horizontal well">
  						<div class="form-group">
    						<label for="title" class="col-sm-2 control-label">제목</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" id="event-title" name="title" placeholder="제목을 입력하세요">
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="description" class="col-sm-2 control-label">내용</label>
    						<div class="col-sm-10">
      							<textarea rows="3" class="form-control" id="event-description" name="description" placeholder="내용을 입력하세요" ></textarea>
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="start-date" class="col-sm-2 control-label">시작 일시</label>
    						<div class="col-sm-4">
      							<input type="date" class="form-control" id="event-start-date" name="startDate" >
    						</div>
    						<div class="col-sm-2">
      							<input type="number" class="form-control" id="event-start-hour" name="startHour"  min="0" max="23" step="1">
    						</div>
    						<label for="start-hour" class="col-sm-1 control-label">시</label>
    						<div class="col-sm-2">
      							<input type="number" class="form-control" id="event-start-minute" name="startMinute"  min="00" max="50" step="10">
    						</div>
    						<label for="start-minute" class="col-sm-1 control-label">분</label>
  						</div>
  						<div class="form-group">
    						<label for="end-date" class="col-sm-2 control-label">종료 일시</label>
    						<div class="col-sm-4">
      							<input type="date" class="form-control" id="event-end-date" name="endDate" >
    						</div>
    						<div class="col-sm-2">
      							<input type="number" class="form-control" id="event-end-hour" name="endHour" min="0" max="23" step="1">
    						</div>
    						<label for="end-hour" class="col-sm-1 control-label">시</label>
    						<div class="col-sm-2">
      							<input type="number" class="form-control" id="event-end-minute" name="endMinute" min="00" max="50" step="10" >
    						</div>
    						<label for="end-minute" class="col-sm-1 control-label">분</label>
  						</div>
  						<div class="form-group">
    						<label for="title" class="col-sm-2 control-label">하루 종일</label>
    						<div class="col-sm-1">
    							<input type="checkbox" class="form-control" id="event-all-day" name="allDay">
    						</div>
  						</div>
					</form>
      			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        			<button type="button" class="btn btn-primary" id="add-event-btn">등록</button>
      			</div>
    		</div>
  		</div>
	</div>
</div>
</body>
</html>