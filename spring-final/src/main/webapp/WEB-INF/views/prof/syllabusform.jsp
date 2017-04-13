<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
	hr.one{
   width : 100%;
   border: thin solid #1c86ee;
   color: #1c86ee;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(function(){
		$(".second").hide();
		$(".third").hide();
		$("#second").click(function(){
			$(this).next().slideToggle();
		})
		$("#third").click(function(){
			$(this).next().slideToggle();
		})
		$("[name='sub_name']").change(function (event) {
			$("[name='sub_no']").val($(this).text());
		})
	})
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/navi/adminnavi.jsp" %>
<%@ include file="/WEB-INF/views/navi/sidebarprof.jsp" %>
	<div class="container">
		<h1>새 강의계획서 등록하기</h1>
		<hr class="one">
		<div class="row well">
			<form:form method="post" action="/jhta/syllform" modelAttribute="syllabusform" enctype="multipart/form-data">
				<div class="form-group">
					<label>과목명</label>
					<form:select path="sub_no" cssClass="form-control">
						<c:forEach var="subject" items="${subList }">
							<form:option value="${subject.no }">${subject.subjectName }</form:option>							
						</c:forEach>
					</form:select>
					<input type="hidden" name="sub_name" value="">
				</div>
				<div class="form-group">
					<label>중간점수퍼센트</label>
					<form:input path="midtrum" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>기말점수퍼센트</label>
					<form:input path="final1" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>출석점수퍼센트</label>
					<form:input path="atlen" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>과제점수퍼센트</label>
					<form:input path="project" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>성적분포</label>
					<form:input path="distri" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>과목개요</label>
					<form:textarea path="outline" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>수업목표</label>
					<form:textarea path="goals" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>강의방법</label>
					<form:textarea path="method" cssClass="form-control"/>
				</div>
				<h1 id="second">교수</h1>
				<div class="second">
				<div class="form-group">
					<label>담당 교수</label>
					<form:select path="prof_name" cssClass="form-control">
						<c:forEach var="professor" items="${proList }">
							<form:option value="${professor.no }">${professor.name }</form:option>	
						</c:forEach>
					</form:select>
				</div>
				<div class="form-group">
					<label>이메일주소</label>
					<form:input path="prof_email" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>전화번호</label>
					<form:input path="prof_phone" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>주교재</label>
					<form:input path="book" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>중간고사시작날짜</label>
					<form:input path="midturm_st" type="date" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>중간고사종료날짜</label>
					<form:input path="midturm_end" type="date" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>기말고사시작날짜</label>
					<form:input path="final_st" type="date" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>기말고사종료날짜</label>
					<form:input path="final_end" type="date" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>과제제출시작날짜</label>
					<form:input path="project_st" type="date" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>과제제출종료날짜</label>
					<form:input path="project_end" type="date" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>과제물</label>
					<form:textarea path="project_content" cssClass="form-control"/>
				</div>
				</div>
				<h1 id="third">강의계획</h1>
				<div class="third">
				<div class="form-group">
					<label>1주차강의계획</label>
					<form:textarea path="week1" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>2주차강의계획</label>
					<form:textarea path="week2" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>3주차강의계획</label>
					<form:textarea path="week3" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>4주차강의계획</label>
					<form:textarea path="week4" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>5주차강의계획</label>
					<form:textarea path="week5" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>6주차강의계획</label>
					<form:textarea path="week6" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>7주차강의계획</label>
					<form:textarea path="week7" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>8주차강의계획</label>
					<form:textarea path="week8" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>9주차강의계획</label>
					<form:textarea path="week9" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>10주차강의계획</label>
					<form:textarea path="week10" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>11주차강의계획</label>
					<form:textarea path="week11" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>12주차강의계획</label>
					<form:textarea path="week12" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>13주차강의계획</label>
					<form:textarea path="week13" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>14주차강의계획</label>
					<form:textarea path="week14" cssClass="form-control"/>
				</div>
				<div class="form-group">
					<label>15주차강의계획</label>
					<form:textarea path="week15" cssClass="form-control"/>
				</div>
				</div>
				
				<div class="form-group text-right">
					<button type="submit" class="btn btn-primary">등록</button>
					<a href="/jhta/profMain" class="btn btn-warning">취소</a>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>