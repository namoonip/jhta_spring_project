<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(function() {
   $('#book-add-form').submit(function(){
     if(!$(":input[name='title']").val().trim()) {
      alert("제목은 필수 입력값입니다.");
      $(":input[name='title']").focus();
      return false;
   }
     if(!$(":input[name='author']").val().trim()) {
      alert("저자는 필수 입력값입니다.");
      $(":input[name='author']").focus();
      return false;
   }
     if(!$(":input[name='publisher']").val().trim()) {
      alert("출판사는 필수 입력값입니다.");
      $(":input[name='publisher']").focus();
      return false;
   }
     if(!$(":input[name='price']").val().trim()) {
      alert("가격은 필수 입력값입니다.");
      $(":input[name='price']").focus();
      return false;
   }
     if(!$(":input[name='description']").val().trim()) {
      alert("소개은 필수 입력값입니다.");
      $(":input[name='description']").focus();
      return false;
   }
      
   	return true;      
   });
});
  </script>
</head>
<body>
	<div class="container">
		<h1>새 책 등록폼</h1>
		<div class="row well">
			<form id="book-add-form" action="add.hta" method="post">
				<div class="form-group">
					<label for="">제목</label>
					<!-- maxlength를 설정한다. -->
					<input type="text" maxlength="100" class="form-control" name="title" placeholder="제목을 입력하세요."/>
				</div>
				<div class="form-group">
					<label for="">저자</label>
					<input type="text" maxlength="30" class="form-control" name="author" placeholder="저자를 입력하세요."/>
				</div>
				<div class="form-group">
					<label for="">출판사</label>
					<input type="text" class="form-control" name="publisher" placeholder="출판사를 입력하세요."/>
				</div>				
				<div class="form-group">
					<label for="">가격</label>
					<input type="number" class="form-control" name="price" placeholder="가격을 입력하세요."/>
				</div>
				<div class="form-group">
					<label for="">소개</label>
					<textarea name="description" class="form-control" rows="5" placeholder="책에 대한 간단한 소개를 입력하세요."></textarea>
				</div>
				<div class="form-group text-right">
					<button type="submit" class="btn btn-primary">등록</button>
					<a href="list.hta" class="btn btn-default">취소</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>