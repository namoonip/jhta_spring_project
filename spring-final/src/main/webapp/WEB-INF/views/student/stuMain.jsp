<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <link href="../resources/fullcalendar/fullcalendar.min.css" rel="stylesheet" />
  <link href="../resources/fullcalendar/fullcalendar.print.min.css" rel="stylesheet" media="print" />
  <script src="../resources/fullcalendar/lib/moment.min.js"></script>
  <script src="../resources/fullcalendar/lib/jquery.min.js"></script>
  <script src="../resources/fullcalendar/fullcalendar.min.js"></script>
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
$(function() {
	
	// 제목과 내용을 전달받아서 작은 모달창을 표시하기
	function showSmallModal(title, message) {
		$('#small-modal-title').text(title);
		$("#small-modal-body").html("<small>" + message + "</small>");
		$('#small-modal').modal('show');
	}
	
	// 모달창이 켜질 때 모달창의 값을 초기화한다.
	function initializeForm(date) {
		var yyyymmdd = date.format();
		var now = new Date();
		var hour = now.getHours();
		
		$("#event-form-modal #event-title").val("");
		$("#event-form-modal #event-location").val("");
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
		eventData["location"] = $("#event-location").val();
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
		var startDateBefore = new Date($('#event-start-date').val());
		var endDateBefore = new Date($('#event-end-date').val());
		var startDateAfter = startDateBefore.getTime() + $('#event-start-hour').val() + $('#event-start-minute').val() ;
		var endDateAfter = endDateBefore.getTime() + $('#event-end-hour').val() + $('#event-end-minute').val();
		if($("#event-title").val()== "") {
			alert("제목을 입력하세요");
			$("#event-title").focus();
			return false;
		}

		if($("#event-location").val()== "") {
			alert("장소를 입력하세요");
			$("#event-location").focus();
			return false;
		}

		
		if(startDateAfter >= endDateAfter) {
			alert("종료 날짜가 시작 날짜 보다 먼저 일 수 없습니다.");
			return false;
		} else {
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
		
		}
	});
	
	$("#delete-event-btn").click(function() {
		var schNo = $("#event-no-detail").val();
		$.ajax({
			url:'deleteEvent.do',
			dataType:'json',
			data:'schNo=' + schNo,
			success:function(data) {
				$("#event-form-modal-detail").modal("hide");
				// 캘린더를 갱신한다.
				$("#calendar-box").fullCalendar( 'refetchEvents' );
			}
		});
	
	});
	
/* 	$("#edit-event-btn").click(function() {
		
	}); */
	
	
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
					// data -> [{"id":1,"title":"테스트","start":1490857200000,"end":1490860800000,"location":"테스트"}]
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
		// [eventClick : 캘린더에 표시된 일정 중 하나를 클릭했을 때 실행되는 콜백함수다.]
		eventClick: function(event, jsEvent, view) {
			var schNo = event["no"]; 
			$.ajax({
				url:"eventDetail.do",
				data:'schNo=' + schNo,
				dataType:"json",
				success:function(data) {
					$("#event-title-detail").val(data.title);
					$("#event-location-detail").val(data.location);
					$("#event-no-detail").val(data.no);
					$("#event-start-date-detail").val(timeToString(data.start).substring(0, 10));
					$("#event-start-hour-detail").val(timeToString(data.start).substring(11, 13));
					$("#event-start-minute-detail").val(timeToString(data.start).substring(14, 16));
					$("#event-end-date-detail").val(timeToString(data.end).substring(0, 10));
					$("#event-end-hour-detail").val(timeToString(data.end).substring(11, 13));
					$("#event-end-minute-detail").val(timeToString(data.end).substring(14, 16));
					$("#event-form-modal-detail").modal("show");
				}
				
			});
		},	
		// [dayClick : 캘린더의 날짜를 클릭했을 때 실행되는 콜백함수다.]
		dayClick: function(date, jsEvent, view) {
			// 일정정보를 입력하는 모달창의 입력값을 초기화한다.
			initializeForm(date);
			// 모달창을 표시한다.
			$("#event-form-modal").modal("show");
		}
	});

	/* $("#completed-btn").click(function() {
		
		$.ajax({
			url:"",
			dataType:"json",
			success:function(data) {
				console.log(data);
			}
			
		});
		
	}); */
	
})
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/navi/stunavi.jsp" %>
<%@ include file="/WEB-INF/views/navi/sidebarstud.jsp" %>
	<div class="container" style="margin-left: 250px; padding-top:25px; ">
    <div class="row text-right">
         홈
      </div>
      <div class="row">
         <h4><span class="glyphicon glyphicon-th-list"></span> HOME</h4>
         <hr style="border:solid 0.5px #2C7BB5;">
      </div>
      <div class="row">
	      <div class="col-xs-5">
	      	<div class="panel panel-default">
		      	<div class="panel-heading">
					<strong>최근 공지사항</strong>
		        </div> 
		       	<div class="panel-body">
					<table class="table table-default">
						<colgroup>
							<col width="13%">
							<col width="*">
							<col width="14%">
							<col width="18%">
							<col width="14%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${boardList }">
								<tr>
									<td>${board.no }</td>
									<td><a href="stuNoticeBoarddetail?bno=${board.no }">${board.title }</a></td>
									<td>${board.writer }</td>
									<td><fmt:formatDate value="${board.regdate }"/></td>
									<td>${board.countView }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
		        </div>
	      	</div>
	      	<div class="panel panel-default">
		      	<div class="panel-heading">
					<strong>학과 게시판</strong><div class="pull-right"><span style="padding-left: 5px;"><a href="studeptboard" class="btn-default btn-xs">more</a></span></div>
		        </div> 
		       	<div class="panel-body">
					<table class="table table-default">
						<colgroup>
							<col width="13%">
							<col width="*">
							<col width="14%">
							<col width="18%">
							<col width="14%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${deptList }">
								<tr>
									<td>${board.no }</td>
									<td><a href="stuDeptBoarddetail?bno=${board.no }">${board.title }</a></td>
									<td>${board.writer }</td>
									<td><fmt:formatDate value="${board.regdate }"/> </td>
									<td>${board.countView }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
		        </div>
	      	</div>
	      </div>
	      
	      <div class="col-xs-7">
	      	<div class="panel panel-default">
		      	<div class="panel-heading">
					<strong>일정</strong>
		        </div> 
		       	<div class="panel-body">
					<div id="calendar-box"></div>
		        </div>
      		</div>
	      </div>
	      <div class="row text-center">
	      	<div class="col-xs-1"></div>
	      	<hr />
	      	<div class="col-xs-10">
		      	<table class="table table-bordered">
		      		<colgroup>
		      			<col width="15%" />
		      			<col width="15%" />
		      			<col width="*" />
		      			<col width="15%" />
		      			<col width="15%" />
		      			<col width="15%" />
		      			<col width="10%" />
		      		</colgroup>
		      		<thead>
		      			<tr>
		      				<th>학과</th>
		      				<th>이수구분</th>
		      				<th>과목명</th>
		      				<th>담당교수</th>
		      				<th>강의시간</th>
		      				<th>강의요일</th>
		      				<th>학점</th>
		      			</tr>
		      		</thead>
		      		<tbody>
		      			<c:forEach var="regisub" items="${regisubList }">
			      			<tr>
			      				<th>${regisub.subject.siteCode.name}</th>
			      				<th>${regisub.subject.passed.passedName }</th>
			      				<th>${regisub.subject.subjectName }</th>
			      				<th>${regisub.subject.professor.name }</th>
			      				<th>${regisub.enroll.enrollTime }</th>
			      				<th>${regisub.enroll.enrollDay }</th>
			      				<th>${regisub.subject.score }</th>
			      			</tr>
		      			</c:forEach>
		      		</tbody>
		      	</table>
	      	</div>
	      </div>
      </div>
   </div>
   
   <!-- 모달 -->
   <div class="modal fade" id="event-form-modal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        			<h4 class="modal-title" id="gridSystemModalLabel">새 일정 등록</h4>
      			</div>
      			<div class="modal-body">
      				<form class="form-horizontal well">
  						<div class="form-group">
    						<label for="title" class="col-sm-2 control-label">내용</label>
    						<div class="col-sm-10">
      							<textarea rows="3" class="form-control" id="event-title" name="title" placeholder="내용을 입력하세요" ></textarea>
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="location" class="col-sm-2 control-label">장소</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" id="event-location" name="location" placeholder="장소을 입력하세요">
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
					</form>
      			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        			<button type="button" class="btn btn-primary" id="add-event-btn">등록</button>
      			</div>
    		</div>
  		</div>
	</div>
	
	
   <div class="modal fade" id="event-form-modal-detail" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        			<h4 class="modal-title" id="gridSystemModalLabel">일정 조회</h4>
        			<input type="hidden" id="event-no-detail" value=""/>
      			</div>
      			<div class="modal-body">
      				<form class="form-horizontal well">
  						<div class="form-group">
    						<label for="title" class="col-sm-2 control-label">내용</label>
    						<div class="col-sm-10">
      							<textarea rows="3" class="form-control" id="event-title-detail" name="title" placeholder="내용을 입력하세요" ></textarea>
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="location" class="col-sm-2 control-label">장소</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" id="event-location-detail" name="location" placeholder="장소를 입력하세요">
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="start-date" class="col-sm-2 control-label">시작 일시</label>
    						<div class="col-sm-4">
      							<input type="date" class="form-control" id="event-start-date-detail" name="startDate" >
    						</div>
    						<div class="col-sm-2">
      							<input type="number" class="form-control" id="event-start-hour-detail" name="startHour"  min="0" max="23" step="1">
    						</div>
    						<label for="start-hour" class="col-sm-1 control-label">시</label>
    						<div class="col-sm-2">
      							<input type="number" class="form-control" id="event-start-minute-detail" name="startMinute"  min="00" max="50" step="10">
    						</div>
    						<label for="start-minute" class="col-sm-1 control-label">분</label>
  						</div>
  						<div class="form-group">
    						<label for="end-date" class="col-sm-2 control-label">종료 일시</label>
    						<div class="col-sm-4">
      							<input type="date" class="form-control" id="event-end-date-detail" name="endDate" >
    						</div>
    						<div class="col-sm-2">
      							<input type="number" class="form-control" id="event-end-hour-detail" name="endHour" min="0" max="23" step="1">
    						</div>
    						<label for="end-hour" class="col-sm-1 control-label">시</label>
    						<div class="col-sm-2">
      							<input type="number" class="form-control" id="event-end-minute-detail" name="endMinute" min="00" max="50" step="10" >
    						</div>
    						<label for="end-minute" class="col-sm-1 control-label">분</label>
  						</div>
  						<div class="form-group">
    						<label for="title" class="col-sm-2 control-label">하루 종일</label>
    						<div class="col-sm-1">
    							<input type="checkbox" class="form-control" id="event-all-day-detail" name="allDay">
    						</div>
  						</div>
					</form>
      			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-primary" id="edit-event-btn">수정</button>
        			<button type="button" class="btn btn-danger" id="delete-event-btn">삭제</button>
        			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      			</div>
    		</div>
  		</div>
	</div>
</body>
</html>