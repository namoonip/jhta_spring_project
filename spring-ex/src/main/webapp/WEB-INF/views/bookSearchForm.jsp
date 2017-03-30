<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <style>
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }

    .carousel-inner img {
      width: 100%; /* Set width to 100% */
      min-height: 200px;
    }

    /* Hide the carousel text when the screen is less than 600 pixels wide */
    @media (max-width: 600px) {
      .carousel-caption {
        display: none; 
      }
    }
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/nav/navigator.jsp" />
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav">
      <h4>John's Blog</h4>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section1">Home</a></li>
        <li><a href="#section2">Friends</a></li>
        <li><a href="#section3">Family</a></li>
        <li><a href="#section3">Photos</a></li>
      </ul><br>
      <div class="input-group">
        <span class="input-group-btn">
        </span>
      </div>
    </div>

    <div class="col-sm-9">
      <h4><small>검색 결과</small><span class="badge"></span></h4>
      <hr>
      <c:choose>
	      <c:when test="${not empty bookList}">
	   		<c:forEach var="book" items="${bookList}">
			      <div class="row">
			        <div class="col-sm-2 text-center">
	  	      		  <a href="bookDetail.do?no=${book.no}">
			          	<img src="resources/images/map/${book.img}" height="100" width="100" alt="${book.img }">
			          </a>
			        </div>
			        <div class="col-sm-1"></div>
			        <div class="col-sm-6">
			          <h4><a id="titleA" href="bookDetail.do?no=${book.no}">${book.title } </a><small>[${book.category }]</small></h4>
			          <c:set var="beforeKeyword" value="${beforeKeyword}" scope="request"/>
			          <p>
			          	<fmt:formatNumber value="${book.price }" type="number" />원 → 
			          	<fmt:formatNumber value="${book.price - book.price/3 }" pattern="#,###"/>원
			          </p>
			          <p>
			          	저자 : ${book.author}
			          </p>
			          <br>
			        </div>
			        <div class="col-sm-2">
			        </div>
			        <div class="col-sm-1"></div>
			      </div>
		      </c:forEach>
	      </c:when>
	      <c:otherwise>
	      	<h4>검색 결과가 없습니다.</h4>
	      </c:otherwise>
      </c:choose>
    </div>
  </div>
</div>
<footer class="container-fluid text-center">
</footer>
</body>
<script type="text/javascript">
$(function() {
 	$(':input[name="keyword"]').val('${beforeKeyword}');
})
</script>
</html>
