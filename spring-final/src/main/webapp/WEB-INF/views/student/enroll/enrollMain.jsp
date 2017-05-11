<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style type="text/css">
	th { text-align: center !important;
		vertical-align: middle !important;
		height: 51px !important;}
		
	.wrap_table {
        padding: 10px 0;
        position: relative;
        width: 1250px;
    }

    .wrap_table>div {
        overflow: auto;
        height: 300px;
    }

    .wrap_table table {
        width: 1250px;
    }

    .wrap_table table caption {
        height: 0;
        overflow: hidden;
    }

    .wrap_table table tfoot {
        position: absolute;
        display: table;
        width: 577px;
        border-bottom: 1px solid #ccc;
    }

    .wrap_table table thead {
        top: 0;
    }

    .wrap_table table tfoot {
        bottom: 0;
    }

    .wrap_table table th,
    .wrap_table table td {
        text-align: center;
        border-right: 1px solid #ccc;
        border-top: 1px solid #ccc;
        height: 30px;
        vertical-align: middle;
    }

    .wrap_table table tr th:first-child,
    .wrap_table table tr td:first-child {
        border-left: 1px solid #ccc;
    }

    .wrap_table table tbody tr:first-child td {
        border-top: 0;
    }
</style>
<script type="text/javascript">
$(function() {
	
	$("#select-dept").change(function() {
		var dept = $(this).val();
		
		if(dept=="") {
			$("#select-major").empty();
			return false;
		}
		
		$.ajax({
			type: "POST",
			url: "stuSubjectmenu/" + dept,
			dataType: "json",
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
	
	var isApplicantCheck = $("#isApplicantCheck").val();
	
	var isApplicant = false;
	
	var webSocket = new WebSocket("ws://jhta.sc/jhta/stud/notice");
		
	webSocket.onmessage = function(event) {
		if(!isApplicant) {
			var regiEnrollNo = $("#regi-EnrollNumber").val();
			
			var data = event.data.split(":");
			if(data[1] === isApplicantCheck) {
				isApplicant = true;
			} else {
				isApplicant = false;
			}
			
			// 수강 신청 잇때
			if(data[0] == "up") {
		
				$("#applicant-box-" + data[2]).empty();
				$("#enroll-box-" + data[2]).empty();
				if(data[3] == data[4]) {
					var applicantContent = "<strong><font color='red'>마감</font></strong>"
					$("#applicant-box-" + data[2]).text(data[3] + " / " + data[4]);
					if($("#RegiSubname-"+data[2]).val() == $("#Subname-"+data[2]).val()) {
						applicantContent = "<strong><font color='blue'>신청완료</font></strong>";
					}
					$("#enroll-box-" + data[2]).append(applicantContent);
					return;
				} else {
					var apllicantEnrollContent = "<a href='enrollSend?enrollNo="+data[2]+"&plusScore="+data[5]+"' class='btn btn-default'>신청</a>";
					$("#applicant-box-" + data[2]).text(data[3] + " / " + data[4]);
					$("#enroll-box-" + data[2]).append(apllicantEnrollContent);
					return;
				}
				
			}
			
			// 수강 취소 일때
			if(data[0] == "down") {
				$("#applicant-box-" + data[2]).empty();
				$("#enroll-box-" + data[2]).empty();
				var data3 = parseInt(data[3]);
				var data4 = parseInt(data[4]);
				 var apllicantEnrollContent2 = "<a href='enrollSend?enrollNo="+data[2]+"&plusScore=+"+data[5]+"' class='btn btn-default'>신청</a>";
				// 값 비교후 신청 버튼 활성화
				
				if(data3 < (data4) ) {
					$("#applicant-box-" + data[2]).text(data[3] + " / " + data[4]);
					if($("#RegiSubname-"+data[2]).val() == $("#Subname-"+data[2]).val()) {
						var applicantContent = "<strong><font color='blue'>신청완료</font></strong>";
						$("#enroll-box-" + data[2]).append(applicantContent); 
						return;
					}
 					$("#enroll-box-" + data[2]).append(apllicantEnrollContent2);
					return;
				} else {
					$("#applicant-box-" + data[2]).text(data[3] + " / " + data[4]);
					$("#enroll-box-" + data[2]).append(apllicantEnrollContent2);
					return;
				}
			}
		}
		isApplicant = false;
	}
	
	if($("#add-False").val() == "true" ) {
		alert("최대 학점이상 신청할 수 없습니다.");
		return;
	}
	
	if($("#regi-False").val() == "true" ) {
		alert("다른 과목과 시간이 겹칩니다.");
		return;
	}
	
	$("#enrollSend").click(function(event) {
		event.defaultView();
		if($("#applyScore").text() == $("#maxOneScore").text()) {
			alert("최대 수강학점을 초과하여 신청할 수 없습니다.");
			return;
		}
	});
	
	if( $("#applyScore").text() == $("#maxOneScore").text()) {
		$("#enrollSend").css("disabled", "disabled");
	}
	
})
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/navi/stunavi.jsp" %>
<%@ include file="/WEB-INF/views/navi/sidebarstud.jsp" %>
   <div class="container" style="margin-left: 250px; padding-top:25px; ">
   <c:if test="${param.addFalse != '' }">
		<input type="hidden" value="${param.addFalse}" id="add-False">   
   </c:if>
   <c:if test="${param.regiDayPass != '' }">
   		<input type="hidden" value="${param.regiDayPass }" id="regi-False">
   </c:if>
    <div class="row text-right">
         	홈 > 수강 신청
      </div>
      <div class="row">
         <h4><span class="glyphicon glyphicon-th-list"></span> 수강신청</h4>
         <hr style="border:solid 0.5px #2C7BB5;">
      </div>
      <div class="row">
		<div style="padding-top: 20px;" class="text-center form-group">
			<form method="post" action="enrollMain" >
				<select class="w3-select w3-border" name="option1" style="width: 8%; height: 37px;">
					<option value="gradeAll">전체</option>
					<option value="1">1 학년</option>
					<option value="2">2 학년</option>
					<option value="3">3 학년</option>
					<option value="4">4 학년</option>
				</select>
				<select class="w3-select w3-border" name="dept" id="select-dept" style="width: 16%; height: 37px;">
					<option value="">학부</option>
					<c:forEach items="${deptList }" var="dept">
						<option value="${dept.code }">${dept.name }</option>
					</c:forEach>
				</select>
				<select class="w3-select w3-border" name="selectMajor" id="select-major" style="width: 16%; height: 37px;">
					<option value="siteAll">전공</option>
				</select>
				<input type="text" name="searchInput" style="width: 30%; height: 37px;"/>
				<button type="submit" class="" style="background-color: gray; height:30px; width:70px;">검색</button>	
			</form>
		</div>
      </div>
      <hr />
      <div class="row" style="margin: 15px;">
      	신청 목록
      	<div class="wrap_table">
      		<div align="center">
		      	<table class="table table-bordered" style="width: 100%">
		      		<colgroup>
		      			<col width="13%"/>
		      			<col width="8%" />
		      			<col width="8%" />
		      			<col width="*" />
		      			<col width="8%" />
		      			<col width="10%" />
		      			<col width="10%" />
		      			<col width="5%" />
		      			<col width="10%" />
		      			<col width="8%" />
		      		</colgroup>
		      		<thead style="background-color: #F0FFFF;">
		      			<tr>
		      				<th>학과</th>
		      				<th>이수구분</th>
		      				<th>학년</th>
		      				<th>과목명</th>
		      				<th>담당교수</th>
		      				<th>강의요일</th>
		      				<th>강의시간</th>
		      				<th>학점</th>
		      				<th>신청인원</th>
		      				<th>신청</th>
		      			</tr>
		      		</thead>
		      		<tbody>
		      			<c:forEach var="subject" items="${subList}" >
		      			<c:if test="${empty subList }">
	      					<tr>
	      						<th colspan="10">해당 학년의 해당 신청가능 전공과목이 없습니다.</th>
	      					</tr>
	      				</c:if>
	      					<input type="hidden" id="Subname-${subject.enroll.no}" value="${subject.enroll.no }" />
		      				<tr>
		      					<th>${subject.siteCode.name}</th>
		      					<th>${subject.passed.passedName }</th>
		      					<th>${subject.grade }</th>	<!-- 학년 -->
		      					<th>${subject.subjectName }</th>	<!-- 과목명 -->
		      					<th>${subject.professor.name }</th>	<!-- 담당교수 -->
		      					<th>${subject.enroll.enrollDay }</th>	<!-- 강의 요일-->
		      					<th>${subject.enroll.enrollTime }</th>	<!-- 강의 시간 -->
		      					<th>${subject.score }</th>	<!-- 학점 -->
		      					<th id="applicant-box-${subject.enroll.no }">
						      		${subject.enroll.enrollNum } / ${subject.limitStu}	<!-- 신청 인원 -->
		      					</th>    					
		      					<th id="enroll-box-${subject.enroll.no }">
		      						<c:set var="isExist" value="false" /> 
	      							<c:forEach var="regisub" items="${regisubList }">
	    								<c:if test="${regisub.subject.no eq subject.no }">
	    									<c:set var="isExist" value="true" />  
	    								</c:if>						 
	      							</c:forEach>
	      							<c:choose>
										<c:when test="${subject.enroll.enrollNum eq subject.limitStu}">
	   										<strong><font color="red">마감</font></strong>
	   									</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${isExist eq 'true'}">
													<strong><font color="blue">신청 완료</font></strong>
												</c:when>
												<c:otherwise>
													<a href="enrollSend?enrollNo=${subject.enroll.no }&plusScore=${subject.score}" class="btn btn-default" id="">신청</a>
												</c:otherwise>											 
											</c:choose>									
										</c:otherwise>      							
	      							</c:choose>   							
		      					</th>
		      				</tr>
		      			</c:forEach>
		      		</tbody>
		      	</table>
		      	</div>
		      </div>
	      </div>
	      <div>
	      <hr />
	      <div class="row" style="margin: 15px;">
	    	<div class="wrap_table">
	      	신청 현황
      		<div align="center">
	      	<table class="table table-bordered" style="width: 100%">
	      		<colgroup>
	      			<col width="13%" />
	      			<col width="8%" />
	      			<col width="8%" />
	      			<col width="*" />
	      			<col width="8%" />
	      			<col width="10%" />
	      			<col width="10%" />
	      			<col width="5%" />
	      			<col width="10%" />
	      			<col width="5%" />
	      		</colgroup>
	      		<thead style="background-color: #D3D3D3;">
	      			<tr>
	      				<th>학과</th>
	      				<th>이수구분</th>
	      				<th>학년</th>
	      				<th>과목명</th>
	      				<th>담당교수</th>
	      				<th>강의요일</th>
	      				<th>강의시간</th>
	      				<th>학점</th>
	      				<th>신청인원</th>
	      				<th>취소</th>
	      			</tr>
	      		</thead>
	      		<tbody id="enrolled">
	      			<c:forEach var="regisub" items="${regisubList }">
	      			<input type="hidden" id="RegiSubname-${regisub.enroll.no }" value="${regisub.enroll.no }" />
	      				<c:if test="${empty regisubList }">
	      					<tr>
	      						<th colspan="10">수강 신청 내역이 없습니다.</th>
	      					</tr>
	      				</c:if>
	      				<tr>
	      					<th>${regisub.subject.siteCode.name}</th>
	      					<th>${regisub.subject.passed.passedName }</th>
	      					<th>${regisub.subject.grade }</th>	<!-- 학년 -->
	      					<th>${regisub.subject.subjectName }</th>	<!-- 과목명 -->
	      					<th>${regisub.subject.professor.name }</th>	<!-- 담당교수 -->
	      					<th>${regisub.enroll.enrollDay }</th>	<!-- 강의 요일-->
	      					<th>${regisub.enroll.enrollTime }</th>	<!-- 강의 시간 -->
	      					<th>${regisub.subject.score }</th>	<!-- 학점 -->
							<th>								
								<input type="hidden" id="regi-EnrollNumber" value="${regisub.enroll.no }"/>
	      						<c:choose>
	      							<c:when test="${regisub.enroll.enrollNum eq regisub.subject.limitStu}">
	      								<strong><font color="red">마감</font></strong>
	      							</c:when>
	      							<c:otherwise>
					      				${regisub.enroll.enrollNum } / ${regisub.subject.limitStu}	<!-- 신청 인원 -->
	      							</c:otherwise>
	      						</c:choose>	  
	      					</th>
	      					<th>
	      						<a href="enrollCancle?cancleNo=${regisub.enroll.no }&minusScore=${regisub.subject.score}&eno=${regisub.enroll.no}" class="btn btn-default">취소</a>
	      					</th>
	      				</tr>
	      			</c:forEach>
	      		</tbody>
	      	</table>
	      	<input type="hidden" id="isApplicantCheck" value="${student.no }" />
      	</div>
      	</div>
      	<div class="row text-center" style="padding: 20px;">
	      	<hr />
      		<p><font size="4;">현재 신청 학점 <span id="applyScore">${applyScore}</span> / 최대 신청 학점 <span id="maxOneScore">${student.maxOneScore}</span></font></p>
      	</div>
      </div>
    </div>
   </div>
</body>
</html>