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
         <h4><span class="glyphicon glyphicon-th-list"></span> 학기 성적 목록</h4>
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
      	학기 성적 목록
      	<table class="table table-bordered">
      		<colgroup>
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
      				<th>학기</th>
					<th>신청학점</th>
					<th>취득학점</th>
					<th>평균점수</th>
					<th>백분율점수</th>
					<th>학사경고</th>
					<th>전.필</th>
					<th>전.선</th>
					<th>교.필</th>
					<th>교.선</th>
					<th>일.선</th>
					<th>구분</th>
					<th>학.기</th>
      			</tr>
      		</thead>
      		<tbody id="searchBody">
      			<c:forEach var="savg" items="${savg }">
					<tr style="text-align: left;">
						<td>${savg.semename }</td>
						<td>${savg.credit1 }</td>
						<td>${savg.credit2 }</td>
						<td>${savg.credit3 }</td>
						<td>${savg.credit4 }</td>
						<c:choose>
							<c:when test="${savg.grade gt 2}">
								<td>Y</td>
							</c:when>
							<c:otherwise>
								<td>N</td>
							</c:otherwise>
						</c:choose>
						<td>${savg.pass1 }</td>
						<td>${savg.pass2 }</td>
						<td>${savg.pass3 }</td>
						<td>${savg.pass4 }</td>
						<td>${savg.pass5 }</td>
						<td>${savg.pass6 }</td>
						<td>${savg.pass7 }</td>
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