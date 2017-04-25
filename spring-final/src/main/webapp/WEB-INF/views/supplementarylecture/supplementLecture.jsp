<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="viewport"
	content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet"
	href="resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="resources/material/material.min.css">
<script src="resources/material/material.min.js"></script>
<script type="text/javascript"
	src="resources/jquery/jquery-3.2.0.min.js"></script>
<script type="text/javascript"
	src="resources/bootstrap/js/bootstrap.min.js"></script>
<head>
<script type="text/javascript">

	$(function() {

		//college 조회
		$("#collegeCode").on("change", function() {

			var collegeCode = $(this).val();
			console.log(collegeCode);

			$.ajax({
				type : "GET",
				url : "searchmajor/" + collegeCode,
				dataType : "json",
				success : function(data) {

					if (collegeCode == 0) {

						var $selectCollege = $("#majorList").empty();

						var html = '<option>--선택하세요--</option>';

						$selectCollege.append(html);

					} else {

						var $selectCollege = $("#majorList").empty();

						var option = '<option>--선택하세요--</option>';
						$selectCollege.append(option);

						for (i = 0; i < data.length; i++) {

							var collegeName = data[i].collegeName;
							var collegeCode = data[i].collegeCode;

							var html = '<option value="' + collegeCode + '">' + collegeName + '</option>';

							$selectCollege.append(html);
						}
					}
					//테이블 조회
					$("#majorList").on("change", function() {

						var majorCode = $(this).val();

						$.ajax({
							type : "GET",
							url : "searchSubjectTable/" + majorCode,
							datatype : "json",
							success : function(data) {


								if (!data.length == 0) {

									var $tbody = $("#subjectList").empty();

									for (i = 0; i < data.length; i++) {

										var professorId = data[i].professorId;
										var subjectNo = data[i].subjectNo;
										var majorCode = data[i].majorCode;
										var subjectName = data[i].subjectName;
										var professorName = data[i].professorName;
										var supplementLectureCheck = data[i].supplementLectureCheck;
										var professorNumber = data[i].professorNumber;
										var majorOption = data[i].majorOption;
										var majorScore = data[i].majorScore;
										var subjectLectureNumber = data[i].subjectLectureNumber;

										var html = '<tr>';
										html += '<td style="width: 10%" id="id-'+professorId+'"><label>'+ professorId +'</label></td>'
										html += '<td style="width: 10%" id="code-'+majorCode+'"><label>' + majorCode + '</label></td>';
										html += '<td style="width: 15%" id="subjectNo-'+subjectNo+'"><label>' + subjectNo + '</label></td>';
										html += '<td style="width: 15%" id="majorOption'+majorOption+'"><label>' + majorOption + '</label></td>';
										html += '<td style="width: 15%" id="professorName-'+professorName+'"><label>' + professorName + '</label></td>';
										html += '<td style="width: 25%" id="subjectName-'+subjectName+'"><label>' + subjectName + '</label></td>';

										if (supplementLectureCheck == 'n') {

											html += '<td style="width: 15%">';
											html += '<button id="lectureApplication-' + subjectNo + '"class="mdl-button mdl-js-button mdl-button--primary" data-toggle="modal" data-target=".bs-example-modal-lg">';
											html += '<i class="glyphicon glyphicon-ok-circle">신청</i>';
											html += '</button>';
											html += '</td>';

										}

										if (supplementLectureCheck == 'y') {

											html += '<td style="width: 20%">';
											html += '<button id="lectureCancle-' + subjectNo + '" class="mdl-button mdl-js-button mdl-button--accent" data-toggle="modal" data-target=".bs-example-modal-lg">';
											html += '<i class="glyphicon glyphicon-remove-circle">취소</i>';
											html += '</button>';
											html += '</td>';
										}

										html += '</tr>';

										$tbody.append(html);

									}

								} else {

									var $tbody = $("#subjectList").empty();

									var html = '<tr>';
									html += '<td colspan="5">요청하신 정보가 존재 하지 않습니다.</td>';
									html += '</tr>';

									$tbody.append(html);
								}

								//휴강 신청
								$("button[id^='lectureApplication']").on("click", function() {
									
									var $modalApplecation = $("#modalApplecation").empty();
									
									var subjectNo = $(this).attr("id").replace("lectureApplication-","");
									
									
									$.ajax({
										type:"GET",
										url:"searchModal/"+subjectNo,
										dataType:"json",
										success: function(data){
											
											var professorId = data.professorId;
											var subjectNo = data.subjectNo;
											var majorCode = data.majorCode;
											var subjectName = data.subjectName;
											var professorName = data.professorName;
											var supplementLectureCheck = data.supplementLectureCheck;
											var professorNumber = data.professorNumber;
											var majorOption = data.majorOption;
											var majorScore = data.majorScore;
											var subjectLectureNumber = data.subjectLectureNumber;
											var subjectTime = data.subjectTime;
											var subjectDate = data.subjectDate;
											
											var $modalApplecation = $("#modalApplecation").empty();
		
											var html = '<div class="modal-header">';
											html += '<h4 class="modal-title" id="gridSystemModalLabel">휴강 신청</h4>';
											html += '</div>';
											html += '<div class="modal-body">';
											html +='<div class="container">';
											html +='<form class="form-horizontal">';
											html +=	'<div class="col-sm-5">';
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">교수 ID:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+professorId+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">교수 번호:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+professorNumber+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">학과 번호:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+majorCode+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">과목 번호:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+subjectNo+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">과목 이름:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+subjectName+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											html += '</div>';
											
											html += '<div class="col-sm-7">';
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">과목 학점:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+majorScore+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">교수 이름:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+professorName+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">전공 옵션:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+majorOption+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">과목 시간:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+subjectTime+'" disabled="disabled"/>';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
										
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">과목 날짜:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+subjectDate+'" disabled="disabled"/>';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											
											html +=	'</div>';
											html +=	'</div>';
											html +=	'</div>';
											html += '</div>';
											html += '<div class="modal-footer">';
											html += '<button type="button" class="btn btn-primary">Save changes</button>';
											html += '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
											html += '</div>';
		
											$modalApplecation.append(html);
										}
									});
									
								});

								//휴강 취소	
								$("button[id^='lectureCancle']").on("click", function() {

									var $modalApplecation = $("#modalApplecation").empty();
									
									var subjectNo = $(this).attr("id").replace("lectureCancle-","");
									
									
									$.ajax({
										type:"GET",
										url:"searchModalCancle/"+subjectNo,
										dataType:"json",
										success: function(data){
											
											var professorId = data.professorId;
											var subjectNo = data.subjectNo;
											var majorCode = data.majorCode;
											var subjectName = data.subjectName;
											var professorName = data.professorName;
											var supplementLectureCheck = data.supplementLectureCheck;
											var professorNumber = data.professorNumber;
											var majorOption = data.majorOption;
											var majorScore = data.majorScore;
											var subjectLectureNumber = data.subjectLectureNumber;
											var applicationStartDate = data.applicationDate;
											console.log(applicationStartDate);
											var applicationEndDate = data.applicationDateEnd;
											console.log(applicationEndDate);
											
											var $modalApplecation = $("#modalApplecation").empty();
		
											var html = '<div class="modal-header">';
											html += '<h4 class="modal-title" id="gridSystemModalLabel">휴강 취소</h4>';
											html += '</div>';
											html += '<div class="modal-body">';
											html +='<div class="container">';
											html +='<form class="form-horizontal">';
											html +=	'<div class="col-sm-5">';
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">교수 ID:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+professorId+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">교수 번호:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+professorNumber+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">학과 번호:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+majorCode+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">과목 번호:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+subjectNo+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">과목 이름:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+subjectName+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											html += '</div>';
											
											html += '<div class="col-sm-7">';
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">과목 학점:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+majorScore+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">교수 이름:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+professorName+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">전공 옵션:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="text"style="width: 200px" name="information" value="'+majorOption+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">휴강 신청일:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="date"style="width: 200px" name="information" value="'+applicationStartDate+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
											
											html +=	'<div class="form-group">';
											html +=	'<div class="col-sm-3">';
											html +=	'<label class="pull-right" style="color: black">휴강 종료일:</label>';
											html +=	'</div>';
											html +=	'<div class="col-sm-6">';
											html +=	'<input id="code" class="mdl-textfield__input" type="date"style="width: 200px" name="information" value="'+applicationEndDate+'" disabled="disabled" />';
											html +=	'</div>';
											html +=	'<div class="col-sm-3"></div>';
											html +=	'</div>';
										
											
											html +=	'</div>';
											html +=	'</div>';
											html +=	'</div>';
											html += '</div>';
											html += '<div class="modal-footer">';
											html += '<button type="button" class="btn btn-primary">Save changes</button>';
											html += '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
											html += '</div>';
		
											$modalApplecation.append(html);
										}
									});	

								});

							}
						});

					});
				}
			});
		});
		
		//상세 검색
		$("input[id^=searchdatil-]").on("click", function() {


			var searchType = $("input[name='searchdatil']:checked").attr("id").replace("searchdatil-", "");


			var searchButton = $("#search-button-type").attr("value", searchType);


		});


		//상세 정보 조회
		$("#search-button-type").on("click", function(event) {

			event.preventDefault();
			$("#subjectList tr").hide();

			var searchText = $("#searchText").val();
			var searchValue = $("#search-button-type").val();
			console.log("검색:"+searchText);
			console.log("타입:"+searchValue);
			
			
			
			if(searchValue == 'id'){
				$("td:contains("+searchText+")").parents("tr").show();
				if ($("td:contains("+searchText+")").length == 0) {
					
				}
				
			}else if(searchValue == 'name'){
				$("td:contains("+searchText+")").parents("tr").show();
				
			}else if(searchValue == 'subjectNo'){
				$("td:contains("+searchText+")").parents("tr").show();
				
			}
		});

	});
</script>
<style>
.wrap_table {
	padding: 30px 0;
	position: relative;
	width: 1170px;
}

.wrap_table>div {
	overflow: auto;
	height: 153px;
}

.wrap_table table {
	width: 1151px;
}

.wrap_table table caption {
	height: 0;
	overflow: hidden;
}

.wrap_table table thead, .wrap_table table tfoot {
	position: absolute;
	display: table;
	width: 1151px;;
	border-bottom: 1px solid #ccc;
}

.wrap_table table thead {
	top: 0;
}

.wrap_table table tfoot {
	bottom: 0;
}

.wrap_table table th, .wrap_table table td {
	text-align: center;
	border-right: 1px solid #ccc;
	border-top: 1px solid #ccc;
	height: 30px;
	vertical-align: middle;
}

.wrap_table table tr th:first-child, .wrap_table table tr td:first-child
	{
	border-left: 1px solid #ccc;
}

.wrap_table table tbody tr:first-child td {
	border-top: 0;
}
</style>
<title>휴강 관리</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/navi/adminnavi.jsp"%>
	<%@ include file="/WEB-INF/views/navi/sidebarsubject.jsp"%>
	<!-- 휴강신청, 취소 모달 -->
	<div class="container">
		<div class="modal fade bs-example-modal-lg" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content" id="modalApplecation"></div>
			</div>
		</div>
		<h1>휴강 관리</h1>
		<hr />
		<div class="row">
			<div class="col-sm-5"></div>
			<div class="col-sm-3">
				<select class="form-control" id="collegeCode">
					<option value="0">--선택하세요.--</option>
					<option value="SO2000">사회대학</option>
					<option value="NS3000">자연과학대학</option>
					<option value="BS4000">생명과학대학</option>
					<option value="ST5000">과학기술대학</option>
					<option value="CA6000">문화예술대학</option>
					<option value="HU1000">인문대학</option>
				</select>
			</div>
			<form action="">
				<div class="col-sm-3">
					<select class="form-control" id="majorList">
						<option>--선택하세요--</option>
					</select>
				</div>
				<div class="col-sm-1"></div>
			</form>
		</div>
		<div class="row" style="height: 10px"></div>
		<div class="row">
			<div class="wrap_table">
				<div align="center">
					<table>
						<caption></caption>
						<thead>
							<tr>
								<th style="width: 10%">교수 ID</th>
								<th style="width: 10%">학과 번호</th>
								<th style="width: 15%">과목 코드</th>
								<th style="width: 15%">전공 옵션</th>
								<th style="width: 15%">담당 교수</th>
								<th style="width: 25%">과목 이름</th>
								<th style="width: 20%">신청</th>
							</tr>
						</thead>
						<tbody id="subjectList"></tbody>
						<tfoot>
							<tr>
								<td></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<div class="row" style="height: 10px"></div>
			<div class="row">
				<form action="">
					<div class="row">
						<div class="col-sm-1"></div>
						<div class="col-sm-1">
							<label>Search :</label>
						</div>
						<div class="col-sm-1">
							<input id="searchdatil-id" type="radio" name="searchdatil"
								value="id" />ID
						</div>
						<div class="col-sm-1">
							<input id="searchdatil-name" type="radio" name="searchdatil"
								value="name" />NAME
						</div>
						<div class="col-sm-3">
							<input id="searchdatil-subjectNo" type="radio" name="searchdatil"
								value="subjectNo" />SUBJECTNO
						</div>
						<div class="col-sm-3">
							<input id="searchText" type="text" class="form-control" />
						</div>
						<div class="col-sm-2">
							<button value="" type="submit" class="mdl-button mdl-js-button"
								id="search-button-type">
								<i class="material-icons">search</i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>