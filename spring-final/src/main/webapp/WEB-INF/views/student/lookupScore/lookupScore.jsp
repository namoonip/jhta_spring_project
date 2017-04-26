<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta http-equiv="viewport" content="width=device-width, initial-scale=1">
            <link type="text/css" rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
            <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" />
            <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
            <link rel="stylesheet" href="resources/material/material.min.css">
            <script src="resources/material/material.min.js"></script>
            <script type="text/javascript" src="resources/jquery/jquery-3.2.0.min.js"></script>
            <script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
	th { text-align: center !important;
		vertical-align: middle !important;}
</style>
<script type="text/javascript">
$(function() {
	
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
         <h4><span class="glyphicon glyphicon-th-list"></span> 과목 성적 정보</h4>
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
				<input type="text" name="searchInput" style="width: 30%; height: 37px;"/>
				<button type="submit" class="" style="background-color: gray; height:30px; width:70px;">검색</button>	
			</form>
		</div>
      </div>
      <hr />
      <div class="row">
      	과목 성적 목록
      	<table class="table table-bordered">
      		<colgroup>
      			<col width="10%" />
      			<col width="10%" />
      			<col width="10%" />
      			<col width="10%" />
      			<col width="*" />
      			<col width="10%" />
      			<col width="10%" />
      			<col width="10%" />
      		</colgroup>
      		<thead>
      			<tr>
      				<th>번호</th>
      				<th>이수구분</th>
      				<th>학기</th>
      				<th>학년</th>
      				<th>과목명</th>
      				<th>담당교수</th>
      				<th>학점</th>
      				<th>성적</th>
      				<th>강의평가</th>
      			</tr>
      		</thead>
      		<tbody id="searchBody">
      			<c:forEach var="regilist" items="${regilist }">
      				<tr>
      					<td align="center">${regilist.no}</td>
						<td align="center">${regilist.subject.passed.passedName}</td>
						<td align="center">${regilist.subject.selectNo.semeSelect}</td>
						<td align="center">${regilist.subject.grade}</td>
						<td align="center">${regilist.subject.subjectName}</td>
						<td align="center">${regilist.subject.professor.name}</td>
						<td align="center">${regilist.score.credit}</td>
						<c:choose>
							<c:when test="${regilist.score.test eq 'N'}">
								<td align="center">미평가</td>
								<td align="center">${regilist.score.test } <a href="../lecturerating.do"><i class="material-icons">rate_review</i></a></td>
							</c:when>
							<c:otherwise>
								<td align="center">${regilist.score.grade}</td>
								<td align="center">완료</td>
							</c:otherwise>
						</c:choose>
      				</tr>
      			</c:forEach>
      		</tbody>
      	</table>
      </div>
      <div>
     	 <hr />
      	<div class="row">
      
      	</div>
      </div>
   </div>
</body>
</html>