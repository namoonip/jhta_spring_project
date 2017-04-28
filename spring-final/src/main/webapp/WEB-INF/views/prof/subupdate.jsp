<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/navi/profnavi.jsp" %>
<%@ include file="/WEB-INF/views/navi/sidebarprof.jsp" %>
	<div class="container">
		<h1>강의수정하기</h1>
		<hr class="one">
		<div class="row well">
			<form:form method="post" action="/jhta/prof/subupdate?no=${enroll.no }" modelAttribute="enrollform">
				<div class="form-group">
					<label>과목 선택</label>
					<form:select path="subjectNo" id="subjectNo" cssClass="form-control" >
						<c:forEach var="sublist" items="${subList }" varStatus="status">
							<c:if test="${sublist.no eq sele }">
								<form:option id="semester-${status.count }" value="${sublist.no }" selected="selected" >${sublist.subjectName }</form:option>	
							</c:if>
							<form:option id="semester-${status.count }" value="${sublist.no }">${sublist.subjectName }</form:option>
						</c:forEach>
					</form:select>			
				</div>
				<div class="form-group">
					<label>강의요일</label>
					<form:input path="enrollDay" cssClass="form-control" value="${enroll.enrollDay }"/>
					<form:errors path="enrollDay" cssClass="text-danger"></form:errors>
				</div>
				<div class="form-group">
					<label>강의시간</label>
					<form:input path="enrollTime"  cssClass="form-control" value="${enroll.enrollTime }"/>
					<form:errors path="enrollTime" cssClass="text-danger"></form:errors>
				</div>
				
				<div class="form-group text-right">
					<button type="submit" class="btn btn-primary">등록</button>
					<a href="/jhta/prof/main" class="btn btn-warning">취소</a>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>