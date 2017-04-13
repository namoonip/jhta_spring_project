<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 설정 경로 지정  href에 부트스트랩이 저장되어있는 경로를 적는다.-->
<link type="text/css" rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="resources/material/material.min.css">
<script src="resources/material/material.min.js"></script>
<script type="text/javascript" src="resources/jquery/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
<title>openlecture register</title>
<script>
	$(function(){
		// 추가하기
		$("#add-text").on("click",function(){
			
			var html = "<div class='form-group'>";
				html +="<div class='col-sm-1'></div>";
				html +="<div class='col-sm-9'>";
				html +="<div class='mdl-textfield mdl-js-textfield mdl-textfield--full-width'>";
				html +="<textarea class='mdl-textfield__input' style='resize: none'></textarea>";
				html +="<label class='mdl-textfield__label' style='color:gray'>조사 항목 :</label>";
				html +="</div>";
				html +="</div>";
				html +="<div class='col-sm-2'>";
				html +="<button class='mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab' class='btn-xs' style='color:black' ><i class='material-icons md-48'>delete_forever</i></button>";
				html +="</div>";
				html +="</div>";
			
			$("#content").append(html);
		
		});
		
		// 미래에 일어날 버튼을 위한 처리
		$("#content").on("click", 'button',function() {
			
			$(this).parents('.form-group').remove();
			
		});
	
	
	  
	});

	
</script>
<style>
hr.one{
   width : 100%;
   border: thin solid #1c86ee;
   color: #1c86ee;
}

button.delete{
	border: 0;
	outline:0;
	background-color: white; 
}
button.add{
	border: 0;
	outline:0;
	background-color: white;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/navi/adminnavi.jsp" %>
	<%@ include file="/WEB-INF/views/navi/sidebarsubject.jsp" %>
	<div class="container">
		<h1>강의 평가 등록</h1>
		<hr class="one">
		<div class="row">
			<h3>&nbsp;&nbsp;상세 정보 등록</h3>
			<div class="col-sm-10"></div>
			<div class="col-sm-2">
				<!-- Button trigger modal -->
				<button type="button" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab" style="color:black" data-toggle="modal" data-target="#myModal"><i class="material-icons md-48">search</i></button>
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">상세 조회</h4>
				      </div>
				      <div class="modal-body">
				      	<div class="row">
				      		<div class="col-sm-12">
								<div class="mdl-layout__header-row">
							      <div class="mdl-layout-spacer"></div>
							      <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable mdl-textfield--floating-label mdl-textfield--align-right">
							        <label class="mdl-button mdl-js-button mdl-button--icon" for="fixed-header-drawer-exp">
							          <i class="material-icons">search</i>
							        </label>
							        <div class="mdl-textfield__expandable-holder">
							          <input class="mdl-textfield__input" type="text" name="sample" id="fixed-header-drawer-exp">
							        </div>
							      </div>
							    </div>
				      		</div>
						</div>
						<div class="row">
					      	<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp" style="width: 100%">
					      		<thead>
					      			<tr>
					      				<th></th>
					      				<th>소       속</th>
					      				<th>교수 번호</th>
					      				<th>교수 이름</th>
					      				<th>교수 과목</th>
					      			</tr>
					      		</thead>
					      		<tbody>
					      			<c:forEach var="professorList" items="${openlecturelist }">
					      				<tr>
					      					<td>
						      					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect">
	  												<input name="box" type="checkbox" id="checkbox-1" class="mdl-checkbox__input">
	  											<span class="mdl-checkbox__label"></span>
												</label>
											</td>
					      					<td>${professorList.code }</td>
					      					<td>${professorList.no }</td>
					      					<td>${professorList.name }</td>
					      					<td>${professorList.division }</td>
					      				</tr>
					      			</c:forEach>
					      		</tbody>
							</table>
						</div>	
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="mdl-button mdl-js-button mdl-button--primary">추가</button>
				        <button type="button" class="mdl-button mdl-js-button mdl-button--accent" data-dismiss="modal">취소</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
			<form class="form-horizontal">
				<div class="form-group">
				<div class="col-sm-1"></div>
					<div class="col-sm-9">
						<div class="col-sm-5 mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
							<input class="mdl-textfield__input" type="text" style="width: 100%"/>
							<label class="mdl-textfield__label" style="color:black">소     속 :</label>
						</div>
						<div class="col-sm-7">
						
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-1"></div>
					<div class="col-sm-9">
						<div class="col-sm-5 mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
							<input class="mdl-textfield__input" type="text" style="width: 100%"/>
							<label class="mdl-textfield__label" style="color:black">교수 번호 :</label>
						</div>
						<div class="col-sm-7">
						
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-1"></div>
					<div class="col-sm-9">
						<div class="col-sm-5 mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
							<input class="mdl-textfield__input" type="text" style="width: 100%"/>
							<label class="mdl-textfield__label" style="color:black">교수 이름 :</label>
						</div>
						<div class="col-sm-7">
							
						</div>
					</div>
				</div>		
				<div class="form-group">
					<div class="col-sm-1"></div>
					<div class="col-sm-9">
						<div class="col-sm-5 mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
							<input class="mdl-textfield__input" type="text" style="width: 100%"/>
							<label for="" class="mdl-textfield__label" style="color:black">교수 과목 :</label>
						</div>
						<div class="col-sm-7">
				
						</div>
					</div>
				</div>				
			</form>
		</div>
		<hr class="one">
		<div class="row">
			<h3>&nbsp;&nbsp;조사 항목 등록</h3>
			
			<div class="col-sm-10"></div>
			<div class="col-sm-2">
				<form >
					<button id="add-text" type="button" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab" style="color:black"><i class="material-icons md-48">note_add</i></button>
				</form>
			</div>
		</div>
		<div class="row">
			<form class="form-horizontal" id="content">
					<div class="form-group">
						<div class="col-sm-1"></div>
						<div class="col-sm-9">
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--full-width">
								<textarea class="mdl-textfield__input" style="resize: none"></textarea>
								<label class="mdl-textfield__label" style="color:gray">조사 항목 :</label>
							</div>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="form-group">
						<div class="col-sm-1"></div>
						<div class="col-sm-9">
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--full-width">
								<textarea class="mdl-textfield__input" style="resize: none"></textarea>
								<label class="mdl-textfield__label" style="color:gray">조사 항목 :</label>
							</div>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="form-group">
						<div class="col-sm-1"></div>
						<div class="col-sm-9">
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--full-width">
								<textarea class="mdl-textfield__input" style="resize: none"></textarea>
								<label class="mdl-textfield__label" style="color:gray">조사 항목 :</label>
							</div>
						</div>
						<div class="col-sm-2"></div>
					</div>
			</form>			
		</div>
		<div class="row">
			<div class="col-sm-10"></div>
			<div class="col-sm-2">
				<button class="mdl-button mdl-js-button mdl-button--primary">추가</button>
				<button class="mdl-button mdl-js-button mdl-button--accent">취소</button>
			</div>
		</div>
	</div>
</body>
</html>