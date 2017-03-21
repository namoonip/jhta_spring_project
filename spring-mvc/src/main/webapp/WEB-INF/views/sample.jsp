<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Sample Page</title>
<script type="text/javascript">
$(function() {
	$("div.form-group").has("span").addClass("has-error");
})
</script>
</head>
<body>
<div class="container">
	<div class="well">
		<h1>Sample Page</h1>
		<ul>
			<li><a href="list.do?pno=5">23</a></li>
		</ul>
		
		<form:form action="add.do" method="get" modelAttribute="scoreForm">
			<div class="form-group">
				<label>번호</label>
				<form:input type="number" path="no" class="form-control"/>
				<form:errors path="no" cssClass="text-danger"></form:errors>
			</div>
			<div class="form-group">
				<label for="">이름</label> 
				<form:input type="text" path="name" class="form-control"/>
				<form:errors path="name" cssClass="text-danger"></form:errors>
			</div>
			<div class="form-group">
				<label for="">국어</label>  
				<form:input type="number" path="kor" class="form-control"/>
				<form:errors path="kor" cssClass="text-danger"></form:errors>
			</div>
			<div class="form-group">
				<label for="">영어</label>  
				<form:input type="number" path="eng" class="form-control"/>
				<form:errors path="eng" cssClass="text-danger"></form:errors>
			</div>
			<div class="form-group">
				<label for="">수학 </label>  
				<form:input type="number" path="math" class="form-control"/>
				<form:errors path="math" cssClass="text-danger"></form:errors>
			</div>
			<div class="form-group">
				<label for="">물리</label>  
				<form:input type="number" path="phy" class="form-control"/>
				<form:errors path="phy" cssClass="text-danger"></form:errors>
			</div>
			<div class="form-group">
				<label for="">화학 </label>  
				<form:input type="number" path="che" class="form-control"/>
				<form:errors path="che" cssClass="text-danger"></form:errors>
			</div>
			<div class="form-group">
				<label for="">생물 </label> 
				<form:input type="number" path="bio" class="form-control"/>
				<form:errors path="bio" cssClass="text-danger"></form:errors>
			</div>
			<div class="form-group">
				<label for="">음악 </label> 
				<form:input type="number" path="mus" class="form-control"/>
				<form:errors path="mus" cssClass="text-danger"></form:errors>
			</div>
			<button type="submit">등록</button>
		</form:form>
	</div>
</div>
</body>
</html>
