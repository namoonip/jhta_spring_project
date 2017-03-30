<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
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
<div class="container">
<div class="row">
  <div class="col-sm-8">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img src="resources/images/event/2017_recycle_jy_pic2.jpg" alt="Image">
          <div class="carousel-caption">
            <h3>분리수거 Paper Pack</h3>
            <p>상품 증정</p>
          </div>      
        </div>

        <div class="item">
          <img src="resources/images/event/2017_recycle_jy_pic5.jpg" alt="Image">
          <div class="carousel-caption">
            <h3>분리수거 Paper Pack2</h3>
            <p>상품 증정2</p>
          </div>      
        </div>
      </div>

      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="well">
      <p>Some text..</p>
    </div>
    <div class="well">
       <p>Upcoming Events..</p>
    </div>
    <div class="well">
       <p>Visit Our Blog</p>
    </div>
  </div>
</div>
<hr>
</div>

<div class="container text-center">    
  <h3>Best Book List</h3>  <br/>
  <div class="row">
  	<c:forEach var="book" items="${bestBookList}">
	    <div class="col-sm-3">
	      <a href="bookDetail.do?no=${book.no}">
          <c:if test="${not empty book.img }">
	      	<img src="resources/images/map/${book.img}" class="img-responsive" style="width:100%; height: 250px;" alt="${book.no}.Image"><br />
	      </c:if>
		      ${book.title} <br />
	      </a>
	      	<br />
			<a href="bookEditForm.do?no=${book.no }&img=${book.img}" class="w3-button w3-light-blue w3-tiny">Edit</a>
			<a href="deleteBook.do?no=${book.no }" class="w3-button w3-red w3-tiny">Delete</a>
	    </div>
    </c:forEach>
  </div>
</div><br/>

<hr />
<div class="container text-center">    
  <h3>Book List</h3> <br />
  <div class="row">
  	<c:forEach var="book" items="${bookList}">
	    <div class="col-sm-2">
	      <a href="bookDetail.do?no=${book.no}">
          <c:if test="${not empty book.img }">
	      	<img src="resources/images/map/${book.img}" class="img-responsive" style="width:100%; height: 150px;" alt="${book.no}.Image"><br />
	      </c:if>
		      ${book.title} <br />
	      </a>
	      	<br />
			<a href="bookEditForm.do?no=${book.no }&img=${book.img}" class="w3-button w3-light-blue w3-tiny">Edit</a>
			<a href="deleteBook.do?no=${book.no }" class="w3-button w3-red w3-tiny">Delete</a>
	    </div>
    </c:forEach>
  </div>
  <hr>
</div>

<footer class="container-fluid text-center">

</footer>
</body>
</html>
