<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style type="text/css">
	th { text-align: center !important;
		vertical-align: middle !important;}
</style>
<script type="text/javascript">
$(function() {
	
	$("button").click(function() {
		var enrollNo = $(this).attr('id').replace("enroll_", "");
		console.log($(this).parents());
		/* $.ajax({
			type:"GET",
			url:"enrollMain/" + enrollNo,
			dataType:"json",
			success:function(data) {
				var $tablebody = $("#enrolled");
				var $tr1 = $("<tr></tr>");
				$tr1.append("<th>"+data.subject.siteCode.no+"</th>");
				$tr1.append("<th>"+data.subject.isPassed+"</th>");
				$tr1.append("<th>"+data.subject.grade+"</th>");
				$tr1.append("<th>"+data.subject.subjectName+"</th>");
				$tr1.append("<th>"+data.division.divisionProfessor+"</th>");
				$tr1.append("<th>"+data.enrollTime+"</th>");
				$tr1.append("<th>"+data.enrollDay+"</th>");
				$tr1.append("<th>"+data.subject.score+"</th>");
				$tr1.append("<th>"+data.division.divisionNo+"</th>");
				$tr1.append("<th>"+data.enrollNum+" / " +data.division.limitNumber+"</th>");
				$tr1.append("<th><a href='' class='btn btn-danger'>취소<a/></th>");
				
				$tablebody.append($tr1);
			}
			
		}) */
		
	});
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
         <h4><span class="glyphicon glyphicon-th-list"></span> 수강신청</h4>
         <hr style="border:solid 0.5px #2C7BB5;">
      </div>
      <div class="row">
		<table class="table table-bordered" style="margin: auto;">
			
		</table>
		<div style="padding-top: 20px;" class="text-center form-group">
			<form action="">
			<input type="hidden" name="" value=""/>
			<input type="hidden" name="" value=""/>
				<select class="w3-select w3-border" name="option1" style="width: 8%; height: 37px;">
					<option value="gradeAll">전체</option>
					<option value="grade1">1 학년</option>
					<option value="grade2">2 학년</option>
					<option value="grade3">3 학년</option>
					<option value="grade4">4 학년</option>
				</select>
				<select class="w3-select w3-border" name="option1" style="width: 14%; height: 37px;">
					<option value="siteAll">학부</option>
					<c:forEach var="sitemap" items="${sitemapPreList}">
						<option value="${sitemap.code}">${sitemap.name }</option>
					</c:forEach>
				</select>
				<select class="w3-select w3-border" name="option1" style="width: 14%; height: 37px;">
					<option value="siteAll">전공</option>
				</select>
				<input type="text" name="searchInput" style="width: 30%; height: 37px;"/>
				<button type="submit" class="" style="background-color: gray; height:30px; width:70px;">검색</button>	
			</form>
		</div>
      </div>
      <hr />
      <div class="row">
      	신청 목록
      	<table class="table table-bordered">
      		<colgroup>
      			<col width="10%" />
      			<col width="8%" />
      			<col width="8%" />
      			<col width="*" />
      			<col width="8%" />
      			<col width="10%" />
      			<col width="10%" />
      			<col width="5%" />
      			<col width="6%" />
      			<col width="10%" />
      			<col width="8%" />
      		</colgroup>
      		<thead>
      			<tr>
      				<th>번호</th>
      				<th>이수구분</th>
      				<th>학년</th>
      				<th>과목명</th>
      				<th>담당교수</th>
      				<th>강의시간</th>
      				<th>강의요일</th>
      				<th>학점</th>
      				<th>분반</th>
      				<th>신청인원</th>
      				<th>신청</th>
      			</tr>
      		</thead>
      		<tbody>
      			<c:forEach var="enroll" items="${enrollList}">
      				<tr>
      					<th>${enroll.subject.siteCode.code}</th>
      					<th>${enroll.subject.isPassed }</th>
      					<th>${enroll.subject.grade }</th>	<!-- 학년 -->
      					<th>${enroll.subject.subjectName }</th>	<!-- 과목명 -->
      					<th>${enroll.division.divisionProfessor }</th>	<!-- 담당교수 -->
      					<%-- ${enroll.subject.professor } --%>
      					<th>${enroll.enrollTime }</th>	<!-- 강의 시간 -->
      					<th>${enroll.enrollDay }</th>	<!-- 강의 요일-->
      					<th>${enroll.subject.score }</th>	<!-- 학점 -->
      					<th>${enroll.division.divisionNo }</th>	<!-- 분반 -->
      					<th> <span id="now_${enroll.no}">${enroll.enrollNum }</span> / ${enroll.division.limitNumber}</th>	<!-- 신청 인원 -->
      					<th><button class="btn btn-default" id="enroll_${enroll.no}">신청</button>
      					</th>
      				</tr>
      			</c:forEach>
      		</tbody>
      	</table>
      </div>
      <div>
      <hr />
      <div class="row">
      	신청 현황
      	<table class="table table-bordered">
      		<colgroup>
      			<col width="10%" />
      			<col width="8%" />
      			<col width="8%" />
      			<col width="*" />
      			<col width="8%" />
      			<col width="10%" />
      			<col width="10%" />
      			<col width="5%" />
      			<col width="6%" />
      			<col width="10%" />
      			<col width="8%" />
      		</colgroup>
      		<thead>
      			<tr>
      				<th>번호</th>
      				<th>이수구분</th>
      				<th>학년</th>
      				<th>과목명</th>
      				<th>담당교수</th>
      				<th>강의시간</th>
      				<th>강의요일</th>
      				<th>학점</th>
      				<th>분반</th>
      				<th>신청인원</th>
      				<th>취소</th>
      			</tr>
      		</thead>
      		<tbody id="enrolled"></tbody>
      	</table>
      	<div class="row text-center">
      		신청 학점 / 최대 신청학점
      	</div>
      </div>
    </div>
   </div>
</body>
</html>