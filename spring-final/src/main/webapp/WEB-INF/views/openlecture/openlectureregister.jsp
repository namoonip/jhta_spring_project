<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 설정 경로 지정  href에 부트스트랩이 저장되어있는 경로를 적는다.-->
<link type="text/css" rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="resources/table/css/ingrid.css" type="text/css" media="screen" />
<script type="text/javascript" src="resources/jquery/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
<title>openlecture register</title>
<script>
	$(function(){
		// 추가하기
		$("#content-area").empty();
		
		$("#add-text").on("click",function(){
			$("#content-area").append("<br><p>조사항목 : <input type='text' style='width: 500px' /></p>");
			
			
		});
		
		//삭제하기
		$("#delete-text").on("click", function(){
			$("#content-area").empty();
		});
	})
	
</script>
<style>
hr.one{
	width : 100%;
	border: thin solid blue;
	color: blue;
}	
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/navi/adminnavi.jsp" %>
	<div class="container">
		<h1>강의 평가 등록</h1>
		<hr class="one">
		<form class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">교수 번호 :</label>
				<div class="col-sm-10">
					<div class="col-sm-10">
						<input class="form-control" type="text" style="width: 40%"/>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="" class="col-sm-2 control-label">교수 이름 :</label>
				<div class="col-sm-10">
					<div class="col-sm-10">
						<input class="form-control" type="text" style="width: 40%"/>
					</div>
				</div>
			</div>		
			<div class="form-group">
				<label for="" class="col-sm-2 control-label">교수 과목 :</label>
				<div class="col-sm-10">
					<div class="col-sm-5">
						<input class="form-control" type="text" style="width: 40%"/>
					</div>
					<div>
						<button >조회</button>
					</div>
				</div>
			</div>				
		</form>
		
		<button id="add-text">추가 하기</button>
		<button id="delete-text">삭제 하기</button>
		<form action="" id="content-area">
		</form>
	</div>
	<%@ include file="/WEB-INF/views/footer/footer.jsp" %>
</body>
</html>