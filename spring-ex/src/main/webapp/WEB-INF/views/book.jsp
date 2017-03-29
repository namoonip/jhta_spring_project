<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	.hidden {display: none;}
</style>
<script type="text/javascript">
$(function() {
	$("td#book-title").click(function() {
		$(this).parents("tr").next().toggleClass("hidden");
	});
})
</script>
<title>Book Home Page</title>
</head>
<body>
<div class="container">
		<h1>도서 정보 페이지</h1>
		<table class="table table-condensed">
			<colgroup>
				<col width="10%" />
				<col width="15%" />
				<col width="*" />
				<col width="15%" />
				<col width="15%" />
				<col width="10%" />
				<col width="15%" />
			</colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th>Category</th>
					<th>Title</th>
					<th>Author</th>
					<th>Publisher</th>
					<th>Price</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${bookList}">
					<tr>
						<td><c:out value="${book.no }" /></td>
						<td><c:out value="${book.category}" /></td>
						<td id="book-title"><c:out value="${book.title}" /></td>
						<td><c:out value="${book.author}" /></td>
						<td><c:out value="${book.publisher}" /></td>
						<td><c:out value="${book.price}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${book.regDate}" /></td>
					</tr>
					<tr class="hidden">
						<td colspan="2"></td>
						<td colspan="3"><c:out value="${book.description }" /></td>
						<td colspan="2">
							<a href="" class="w3-btn w3-button w3-tiny w3-blue">수정</a>
							<a href="" class="w3-btn w3-button w3-tiny w3-red">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<div class="text-right">
		<a href="addBook.do" class="w3-button w3-black">책 등록</a>
	</div>		
	<form action="">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-1">
				<select name="" id="" style="height:27px;width:70px;">
					<option value="">제목</option>
					<option value="">저자</option>
					<option value="">카테고리</option>
				</select>
			</div>
			<div class="col-md-3"> 
				<input type="text" placeholder="검색어를 입력하세요."/>
			</div>
			<div class="col-md-5">
				<button type="submit" class="w3-btn w3-gray">검색</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>