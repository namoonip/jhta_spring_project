<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>연습</h1>
	</div>
	<!-- Large modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target=".bs-example-modal-lg">Large modal</button>

	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">휴강 신청</h4>
				</div>
				<div class="modal-body">
					<div class="container">
						<form class="form-horizontal">
							<div class="col-sm-5">
								<div class="form-group">
									<div class="col-sm-2">
										<label class="pull-right" style="color: black">교수 ID:</label>
									</div>
									<div class="col-sm-6">
										<input id="code" class="mdl-textfield__input" type="text"
											style="width: 200px" name="information" value=""
											disabled="disabled" />
									</div>
									<div class="col-sm-4"></div>
								</div>
								<div class="form-group">
									<div class="col-sm-2">
										<label class="pull-right" style="color: black">교수 번호:</label>
									</div>
									<div class="col-sm-6">
										<input id="code" class="mdl-textfield__input" type="text"
											style="width: 200px" name="information" value=""
											disabled="disabled" />
									</div>
									<div class="col-sm-4"></div>
								</div>
								<div class="form-group">
									<div class="col-sm-2">
										<label class="pull-right" style="color: black">학과 번호:</label>
									</div>
									<div class="col-sm-6">
										<input id="code" class="mdl-textfield__input" type="text"
											style="width: 200px" name="information" value=""
											disabled="disabled" />
									</div>
									<div class="col-sm-4"></div>
								</div>
								<div class="form-group">
									<div class="col-sm-2">
										<label class="pull-right" style="color: black">과목 번호:</label>
									</div>
									<div class="col-sm-6">
										<input id="code" class="mdl-textfield__input" type="text"
											style="width: 200px" name="information" value=""
											disabled="disabled" />
									</div>
									<div class="col-sm-4"></div>
								</div>
								<div class="form-group">
									<div class="col-sm-2">
										<label class="pull-right" style="color: black">과목 이름:</label>
									</div>
									<div class="col-sm-6">
										<input id="code" class="mdl-textfield__input" type="text"
											style="width: 200px" name="information" value=""
											disabled="disabled" />
									</div>
									<div class="col-sm-4"></div>
								</div>
							</div>
							<div class="col-sm-7">
								<div class="form-group">
									<div class="col-sm-2">
										<label class="pull-right" style="color: black">과목 학점:</label>
									</div>
									<div class="col-sm-6">
										<input id="code" class="mdl-textfield__input" type="text"
											style="width: 200px" name="information" value=""
											disabled="disabled" />
									</div>
									<div class="col-sm-4"></div>
								</div>
								<div class="form-group">
									<div class="col-sm-2">
										<label class="pull-right" style="color: black">교수 이름:</label>
									</div>
									<div class="col-sm-6">
										<input id="code" class="mdl-textfield__input" type="text"
											style="width: 200px" name="information" value=""
											disabled="disabled" />
									</div>
									<div class="col-sm-4"></div>
								</div>
								<div class="form-group">
									<div class="col-sm-2">
										<label class="pull-right" style="color: black">전공 옵션:</label>
									</div>
									<div class="col-sm-6">
										<input id="code" class="mdl-textfield__input" type="text"
											style="width: 200px" name="information" value=""
											disabled="disabled" />
									</div>
									<div class="col-sm-4"></div>
								</div>
								<div class="form-group">
									<div class="col-sm-2">
										<label class="pull-right" style="color: black">휴강 신청일:</label>
									</div>
									<div class="col-sm-6">
										<input id="code" class="mdl-textfield__input" type="date"
											style="width: 200px" name="information" value="" />
									</div>
									<div class="col-sm-4"></div>
								</div>
								<div class="form-group">
									<div class="col-sm-2">
										<label class="pull-right" style="color: black">휴강 종료일:</label>
									</div>
									<div class="col-sm-6">
										<input id="code" class="mdl-textfield__input" type="date"
											style="width: 200px" name="information" value="" />
									</div>
									<div class="col-sm-4"></div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>