<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
<jsp:include page="/WEB-INF/views/nav/navigator.jsp" />
<div class="container">
<div class="row">
	<h1>Add Book</h1>
	<form:form action="bookEditForm.do" method="POST" enctype="multipart/form-data" modelAttribute="bookForm">
		<form:input type="hidden" path="no"/>
		<div class="form-group">
			<label for="">Title</label>
			<form:input path="title" cssClass="form-control" />
			<form:errors path="title" cssClass="text-danger" />
		</div>	
		<div class="form-group">
			<label for="">Author</label>
			<form:input path="author" cssClass="form-control"/>
			<form:errors path="author" cssClass="text-danger" />
		</div>	
		<div class="form-group">
			<label for="">description</label>
			<form:textarea path="description" cssClass="form-control" name="" id="" cols="auto" rows="5" style="width : 100%;"></form:textarea>
			<form:errors path="description" cssClass="text-danger" />
		</div>	
		<div class="form-group">
			<label for="">publisher</label>
			<form:input path="publisher" cssClass="form-control" />
			<form:errors path="publisher" cssClass="text-danger" /> 
		</div>	
		<div class="form-group">
			<label for="">price</label>
			<form:input path="price" type="number" cssClass="form-control"/>
			<form:errors path="price" cssClass="text-danger" />
		</div>	
		<div class="form-group">
			<label for="">RegDate</label>
			<form:input id="datePicker" path="regDate" type="date" cssClass="form-control" />
			<form:errors path="regDate" cssClass="text-danger" />
		</div>
		<label for="">Category</label>
		<form:select cssClass="w3-select" path="category">
			<option value="" disabled selected>Choose your option</option>
			<option value="Paper">종이책</option>
			<option value="EBook">EBook</option>
			<option value="Sample">Sample</option>
		</form:select>
		<form:errors path="category" cssClass="text-danger" />
		<div class="text-right" style="padding: 10px;">
			<button type="submit" class="w3-button w3-light-blue">등록</button>
		</div>
	</form:form>
</div>
</div>
</body>
</html>