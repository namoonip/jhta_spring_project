<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="viewport"
	content="width=device-width, initial-scale=1">
<!-- 부트스트랩 설정 경로 지정  href에 부트스트랩이 저장되어있는 경로를 적는다.-->
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
<script type="text/javascript">
$(function(){
	
})
</script>
<title>open lecture</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>&nbsp;&nbsp;&nbsp;강의 평가</h3>
			<br />
			<table
				class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--4dp"
				style="width: 100%;">
				<tr>
					<td>
						<p align="left">◎ 본조사는 중앙 HTA 대학교 재학생을 대상으로 한 교육만족도 증진을 위한 만족도
							조사로 익명으로 실시되오니 솔직하고 정확하게 작성해 주시기 바랍니다.</p>
						<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;여러분이 응답하여 주신 각각의 자료는
							보다 나은 교육서비스 체제 구축을 위한 발전방안을 마련하는 기초자료로 적극 반영될 것입니다.</p>
						<p align="left">◎ 본 조사의 평가척도는 5점으로 구성되어 있으며, (1)은 전혀아니다 (5)는
							매우 그렇다를 의미하며, 번호가 클수록 만족도가 높은것을 의미합니다.</p>
					</td>
				</tr>
			</table>
			<br />
		</div>
		<div class="row">
			<form action="ratingInsert.do">
				<hr />
				<table
					class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--4dp"
					style="width: 100%;">
					<tr>
						<td colspan="7">
							<p>&nbsp;&nbsp;■ 다음은 교육과정(전공, 교양)에 대한 질문입니다. 해당란에 체크표
								해주십시오.&nbsp;&nbsp;</p>

						</td>
					</tr>
					<tr>
						<td style="width: 12%" align="center"><p align="center">구분</p></td>
						<td style="width: 30%"><p align="center">조사 항목</p></td>
						<td style="width: 12%">
							<p>매우그렇다</p>
							<p>(5)</p>
						</td>
						<td style="width: 12%">
							<p>대체로 그렇다</p>
							<p>(4)</p>
						</td>
						<td style="width: 12%">
							<p>그저 그렇다</p>
							<p>(3)</p>
						</td>
						<td style="width: 12%">
							<p>대체로 아니다</p>
							<p>(2)</p>
						</td>
						<td style="width: 12%">
							<p>전혀아니다</p>
							<p>(1)</p>
						</td>
					</tr>
					<tr id="">
						<td style="width: 10%"><p align="center">1</p></td>
						<td style="width: 40%"></td>
						<td style="width: 10%"><input type="radio" checked="checked"
							name="appraise-1" value="5" /></td>
						<td style="width: 10%"><input type="radio" name="appraise-1" value="4"/>
						</td>
						<td style="width: 10%"><input type="radio" name="appraise-1" value="3"/>
						</td>
						<td style="width: 10%"><input type="radio" name="appraise-1" value="2"/>
						</td>
						<td style="width: 10%"><input type="radio" name="appraise-1" value="1"/>
						</td>
					</tr>
					<tr id="">
						<td style="width: 10%"><p align="center">2</p></td>
						<td style="width: 40%"></td>
						<td style="width: 10%"><input type="radio" checked="checked"
							name="appraise-2" value="5" /></td>
						<td style="width: 10%"><input type="radio" name="appraise-2" value="4"/>
						</td>
						<td style="width: 10%"><input type="radio" name="appraise-2" value="3"/>
						</td>
						<td style="width: 10%"><input type="radio" name="appraise-2" value="2"/>
						</td>
						<td style="width: 10%"><input type="radio" name="appraise-2" value="1"/>
						</td>
					</tr>
					<tr id="">
						<td style="width: 10%"><p align="center">3</p></td>
						<td style="width: 40%"></td>
						<td style="width: 10%"><input type="radio" checked="checked"
							name="appraise-3" value="5"/></td>
						<td style="width: 10%"><input type="radio" name="appraise-3" value="4"/>
						</td>
						<td style="width: 10%"><input type="radio" name="appraise-3" value="3"/>
						</td>
						<td style="width: 10%"><input type="radio" name="appraise-3" value="2"/>
						</td>
						<td style="width: 10%"><input type="radio" name="appraise-3" value="1"/>
						</td>
					</tr>
					<tr id="">
						<td style="width: 10%" align="center"><p align="center">4</p></td>
						<td style="width: 40%" align="center"></td>
						<td style="width: 10%" align="center"><input type="radio"
							checked="checked" name="appraise-4" value="5"/></td>
						<td style="width: 10%" align="center" ><input type="radio"
							name="appraise-4" value="4"/></td>
						<td style="width: 10%" align="center"><input type="radio"
							name="appraise-4" value="3"/></td>
						<td style="width: 10%" align="center"><input type="radio"
							name="appraise-4" value="2"/></td>
						<td style="width: 10%" align="center"><input type="radio"
							name="appraise-4" value="1"/></td>
					</tr>
					<tr id="">
						<td style="width: 10%" align="center"><p align="center">5</p></td>
						<td style="width: 40%" align="center"></td>
						<td style="width: 10%" align="center"><input type="radio"
							checked="checked" name="appraise-5" value="5"/></td>
						<td style="width: 10%" align="center"><input type="radio"
							name="appraise-5" value="4"/></td>
						<td style="width: 10%" align="center"><input type="radio"
							name="appraise-5" value="3"/></td>
						<td style="width: 10%" align="center"><input type="radio"
							name="appraise-5" value="2"/></td>
						<td style="width: 10%" align="center"><input type="radio"
							name="appraise-5" value="1"/></td>
					</tr>
					<tr id="">
						<td style="width: 10%" align="center"><p align="center">6</p></td>
						<td style="width: 40%" align="center"></td>
						<td style="width: 10%" align="center"><input type="radio"
							checked="checked" name="appraise-6" value="5"/></td>
						<td style="width: 10%" align="center"><input type="radio"
							name="appraise-6" value="4"/></td>
						<td style="width: 10%" align="center"><input type="radio"
							name="appraise-6" value="3"/></td>
						<td style="width: 10%" align="center"><input type="radio"
							name="appraise-6" value="2"/></td>
						<td style="width: 10%" align="center"><input type="radio"
							name="appraise-6" value="1"/></td>
					</tr>
					<tr id="">
						<td style="width: 10%" align="center"><p align="center">7</p></td>
						<td style="width: 40%" align="center"></td>
						<td style="width: 10%" align="center"><input type="radio"
							checked="checked" name="appraise-7" value="5"/></td>
						<td style="width: 10%" align="center"><input type="radio"
							name="appraise-7" value="4"/></td>
						<td style="width: 10%" align="center"><input type="radio"
							name="appraise-7" value="3"/></td>
						<td style="width: 10%" align="center"><input type="radio"
							name="appraise-7" value="2"/></td>
						<td style="width: 10%" align="center"><input type="radio"
							name="appraise-7" value="1"/></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="row">
			<div class="col-sm-10"></div>
			<div class="col-sm-2">
				<!-- Colored raised button -->
				<button
					class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
					등록</button>
				<!-- Accent-colored raised button -->
				<button
					class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent">
					취소</button>
			</div>
		</div>
		<div class="row" style="height: 30px"></div>
	</div>
</body>
</html>