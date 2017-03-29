<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Book Add Page</title>
</head>
<body>
<div class="container">
<div class="row">
	<h1>Add Book</h1>
	<form action="addBook.do" method="POST">
		<div class="form-group">
			<label for="">Title</label>
			<input name="title" type="text" class="form-control"/>
		</div>	
		<div class="form-group">
			<label for="">Author</label>
			<input name="author" type="text" class="form-control"/>
		</div>	
		<div class="form-group">
			<label for="">description</label>
			<textarea name="description" class="form-control" name="" id="" cols="auto" rows="5" style="width : 100%;"></textarea>
		</div>	
		<div class="form-group">
			<label for="">publisher</label>
			<input name="publisher" type="text" class="form-control"/>
		</div>	
		<div class="form-group">
			<label for="">price</label>
			<input name="price" type="number" class="form-control"/>
		</div>	
		<div class="form-group">
			<label for="">Img</label>
			<input name="img" type="text" class="form-control"/>
		</div>
		<label for="">Category</label>
		<select class="w3-select" name="category">
			<option value="" disabled selected>Choose your option</option>
			<option value="1">종이책</option>
			<option value="2">EBook</option>
			<option value="3">Sample</option>
		</select>
		<div class="text-right" style="padding: 10px;">
			<button type="submit" class="w3-button w3-light-blue">등록</button>
		</div>
	</form>
</div>
</div>
</body>
</html>