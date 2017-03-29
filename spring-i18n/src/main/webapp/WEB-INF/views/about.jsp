<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><spring:message code="welcome.title"/></title>
</head>
<body>
	<h1><spring:message code="about.message" arguments="${username},${userid}"/></h1>
</body>
</html>

