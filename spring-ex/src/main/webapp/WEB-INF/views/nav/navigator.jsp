<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Saladin Book</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="book.do">Saladin</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="boardBook.do">Board</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="addBook.do">Add Book</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="form-group text-center">
	<div class="row">
		<form action="bookSearch.do" method="POST">
		<div class="col-xs-2"></div>
		<div class="col-xs-2">
			<select name="opt" class="form-control" style="width:150px;">		
				<option value="title">제목</option>
				<option value="authoer">저자</option>
				<option value="publisher">출판사</option>
			</select>
		</div>
		<div class="col-xs-4">
			<input name="keyword" type="text" placeholder="검색어를 입력하세요." class="form-control"/>
		</div>
  		<div class="col-xs-2 text-left">
  			<button type="submit" class="w3-btn w3-black">Search</button>
  		</div>
  		<div class="col-xs-1"></div>
	  	</form>
  	</div>
</div> <hr />
</body>
</html>