<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Book Detail</title>
<style>
	#detailTbody1 { font-size: medium; letter-spacing: 4px; line-height: 200%; }
</style>
</head>
<body class="w3-content" style="max-width:1600px;">
<jsp:include page="/WEB-INF/views/nav/navigator.jsp" />
<div class="container">
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-11">
		<table style="width: 90%;">
			<colgroup>
				<col width="30%"/>
				<col width="10%"/>
				<col width="*%"/>
			</colgroup>
			<thead>
				<tr>
					<td colspan="3">
						<h4>${bookDetail.title }
							<a href="bookEditForm.do?no=${bookDetail.no }&img=${bookDetail.img}" class="w3-button w3-tiny w3-light-blue">Edit</a>
						</h4>
					</td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>
						<img src="resources/images/map/${bookDetail.img }" alt="${bookDetail.img }" style="width: 90%; height: 250px;"><br />
						<div class="w3-center">
							<div class="w3-container" style="padding: 20px;">
							  <img src="resources/images/map/${bookDetail.img }" style="width:30%; cursor:zoom-in;"
							  		onclick="document.getElementById('modal01').style.display='block'">
							
							  <div id="modal01" class="w3-modal" onclick="this.style.display='none'">
								  <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
								  <div class="w3-modal-content w3-animate-zoom">
								  	<img src="resources/images/map/${bookDetail.img }" style="width:20%;">
								  </div>
							  </div>
							</div>							
						</div>
					</th>
					<th></th>
					<th>
						<form action="#" method="POST">
							<table>
								<colgroup>
									<col width="130px;"/>
									<col width="*"/>
								</colgroup>
								<tbody id="detailTbody1">
									<tr>
										<th colspan="2" style="color: blue;">[${bookDetail.category}]</th>
									</tr>
									<tr>
										<th>제목</th>
										<td>${bookDetail.title }</td>
									</tr>
									<tr>
										<th>정가</th>
										<td>
											<fmt:formatNumber value="${bookDetail.price }" type="number"/> 원
										</td>
									</tr>
									<tr>
										<th>판매가</th>
										<td>
											<fmt:formatNumber value="${bookDetail.price - bookDetail.price/3}" type="number" pattern="#,###"/> 원 (30% 할인)
										</td>
									</tr>
									<tr>
										<th>배송비</th>
										<td>무료</td>
									</tr>
									<tr>
										<th>주문 수량</th>
										<td>
											<select name="orderCount" id="" style="width: 50px;">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table><br />
							<div class="text-center">
								<a href="" class="w3-btn w3-khaki">장바구니 담기</a>
								<button class="w3-btn w3-green">주문</button>
							</div>
						</form>
					</th>
				</tr>
			</tbody>
		</table>
		</div>
		<div class="row">
			<h5>책 소개</h5>
			<div class="col-md-2"></div>
			<div class="col-md-8">
				${bookDetail.description }
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>
</body>
</html>