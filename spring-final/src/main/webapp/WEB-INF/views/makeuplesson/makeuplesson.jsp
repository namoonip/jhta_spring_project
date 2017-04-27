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
<script type="text/javascript">
$(function(){
	
	//전체 보강 신청 값 가져오기
	
	

    //쪽지관련 자바스크립트

    $("#receiver-box").on("click", "span", function() {
        var spanNo = $(this).attr("id").replace("name-", "");

        $("input:hidden[name='receiver']").each(function(index, item) {
            var hiddenNo = $(item).attr("id").replace("message-", "");

            if (spanNo == hiddenNo) {
                $("span[id='name-" + spanNo + "']").remove();
                $("input:hidden[id='message-" + hiddenNo + "']").remove();
            }
        })
    }).css("cursor", "pointer");

    // 추가를 눌렀을 때 받는사람의 아이디값을 추가하는 코드
    $("#add-list").click(function(event) {
        event.preventDefault();
        var id = $("tr[class='active'] td:eq(0)").text();
        var name = $("tr[class='active'] td:eq(1)").text();

        // 같은 사람을 두 번 등록하는 것을 체크하는 코드
        $("span[class='badge']").each(function(index, item) {
            var spanNo = $(item).attr("id").replace("name-", "");

            if (id == spanNo) {
                alert("이미 추가되어 있는 유저입니다.");
                id = false;
                return false;
            }
        });

        if (name && id) {
            $("#receiver-box").append("<span class='badge' id='name-" + id + "'>" + name + "</span> ");
            $("#message-form").append("<input type='hidden' name='receiver' value='" + id + "' id='message-" + id + "'>");
        }

        $(".modal-body tbody").empty();
        $("#search-word").val("");

        $(this).attr("data-dismiss", "modal");
    });

    $("#search-list").click(function(event) {
        event.preventDefault();

        checkedRadio = $(":radio:checked").val();
        searchWord = $("#search-word").val();
        searchOption = $("#option").val();

        // 학생, 교수 분류와 이름을 검색했을 때 검색결과를 표시하는 ajax 코드
        $.get("adminsearch", {
            checkedRadio: checkedRadio,
            searchWord: searchWord,
            searchOption: searchOption
        }, function(data) {
            $(".modal-body thead").empty();
            $(".modal-body tbody").empty();

            if (searchOption == "name") {
                $(".modal-body thead").append("<tr><th>학번</th><th>이름</th><th>전화번호</th><th>메일주소</th></tr>");
            } else if (searchOption == "division") {
                $(".modal-body thead").append("<tr><th>학과코드</th><th>학과명</th></tr>");
            } else if (searchOption == "subject") {
                $(".modal-body thead").append("<tr><th style='display: none;'>번호</th><th>과목명</th><th>교수명</th><th>학점</th></tr>");
            }
            console.log(data);

            for (var i = 0; i < data.length; i++) {
                var tr = "<tr></tr>";

                if (searchOption == "name") {
                    tr = $(tr).append("<td>" + data[i].id + "</td><td>" + data[i].name + "</td><td>" + data[i].phone + "</td><td>" + data[i].email + "</td>");
                    $(".modal-body tbody").append(tr);
                } else if (searchOption == "division") {
                    tr = $(tr).append("<td>" + data[i].code + "</td><td>" + data[i].name + "</td>");
                    $(".modal-body tbody").append(tr);
                } else if (searchOption == "subject") {
                    tr = $(tr).append("<td style='display: none;'>" + data[i].no + "</td><td>" + data[i].subjectName + "</td><td>" + data[i].professor.name + "</td><td>" + data[i].score + "</td>");
                    $(".modal-body tbody").append(tr);
                }
            }
        }, "json");
    });

    // 검색된 행을 클릭했을 때 활성화 시키는 코드
    $(".modal-body tbody").on("click", "tr", function() {
        if ($(this).attr("class")) {
            $(this).removeClass("active");
        } else {
            $(this).addClass("active").siblings().removeClass("active");
        }
    })

    // 모달을 닫을 때 입력 데이터를 없애는 코드
    $("#close-modal").click(function() {
        $(".modal-body thead").empty();
        $(".modal-body tbody").empty();
        $("#search-word").val("");
    });

    $("#send-button").click(function() {
        if (!$("#receiver-box").text().trim()) {
            alert("받는사람을 추가해주세요.");
            return false;
        }
    });

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

.wrap_table table thead,
.wrap_table table tfoot {
    position: absolute;
    display: table;
    width: 1151px;
    ;
    border-bottom: 1px solid #ccc;
}

.wrap_table table thead {
    top: 0;
}

.wrap_table table tfoot {
    bottom: 0;
}

.wrap_table table th,
.wrap_table table td {
    text-align: center;
    border-right: 1px solid #ccc;
    border-top: 1px solid #ccc;
    height: 30px;
    vertical-align: middle;
}

.wrap_table table tr th:first-child,
.wrap_table table tr td:first-child {
    border-left: 1px solid #ccc;
}

.wrap_table table tbody tr:first-child td {
    border-top: 0;
}
</style>	
<title>보강 관리</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/navi/adminnavi.jsp"%>
	<%@ include file="/WEB-INF/views/navi/sidebarsubject.jsp"%>
	<!-- 보강신청, 취소 모달 -->
	<div class="container">
		<div class="modal fade bs-example-modal-lg" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content" id="modalApplecation"></div>
			</div>
		</div>
		<h3>보강 관리</h3>
		<hr />
		<div class="row">
			<h4>&nbsp;&nbsp;&nbsp;보강 신청</h4>
			<div class="col-sm-1">
				<a href="makeuplecturereset.do"><i class="material-icons">restore_page</i></a>
			</div>
			<div class="col-sm-4"></div>
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
						<tbody id="subjectList">
						<!-- 
							<c:forEach var="totalDataList" items="${totalDataList }">
								<tr id="supplementLectureTr-${totalDataList.subjectNo}">
									<td style="width: 10%" id="id-' + professorId + '"><label>${totalDataList.professorId}</label></td>
									<td style="width: 10%" id="code-' + majorCode + '"><label>${totalDataList.majorCode}</label></td>
									<td style="width: 15%" id="subjectNo-' + subjectNo + '"><label>${totalDataList.subjectNo}</label></td>
									<td style="width: 15%" id="majorOption' + majorOption + '"><label>${totalDataList.majorOption}</label></td>
									<td style="width: 15%" id="professorName-' + professorName + '"><label>${totalDataList.professorName}</label></td>
									<td style="width: 25%" id="subjectName-' + subjectName + '"><label>${totalDataList.subjectName}</label></td>
									<c:choose>
										<c:when test="${totalDataList.supplementLectureCheck eq 'y'}">
											<td style="width: 20%" id="cancleButton">
												<button id="lectureCancle-${totalDataList.subjectNo}"
													class="mdl-button mdl-js-button mdl-button--accent"
													data-toggle="modal" data-target=".bs-example-modal-lg">
													<i class="glyphicon glyphicon-remove-circle">취소</i>
												</button>
											</td>
										</c:when>
										<c:otherwise>
							
											<td style="width: 15%"
												id="applicationButton-${totalDataList.subjectNo}">
												<button id="lectureApplication-${totalDataList.subjectNo}"
													class="mdl-button mdl-js-button mdl-button--primary"
													data-toggle="modal" data-target=".bs-example-modal-lg">
													<i class="glyphicon glyphicon-ok-circle">신청</i>
												</button>
											</td>
										</c:otherwise>
									</c:choose>

						 -->
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td></td>
							</tr>
						</tfoot>
					</table>
				</div>
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
		<hr />
		<div class="row" style="height: 30px"></div>
		<div class="row">
			<h4>&nbsp;&nbsp;&nbsp;최근 신청한 강의</h4>
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
						<tbody id="subjectListaddList"></tbody>
						<tfoot>
							<tr>
								<td></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
		<hr />
		<h4>보강 신청 메세지 보내기</h4>
		<div class="row" style="margin-bottom: 15px;">
			<div class="col-sm-12">
				<div class="btn-group">
					<a href="adminrecmessagebox" class="btn btn-info">받은쪽지</a> <a
						href="adminsendmessagebox" class="btn btn-info">보낸쪽지</a> <a
						href="adminmessageform" class="btn btn-info">쪽지쓰기</a>
				</div>
			</div>
		</div>
		<div class="row">
			<form method="post" action="sendmessage" id="message-form"
				enctype="multipart/form-data">
				<div class="row">
					<div class="col-sm-12">
						<table class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<td>수신대상</td>
									<td><label class="radio-inline"><input
											type="radio" name="menu" value="stu" checked>
											학생&nbsp;</label> <label class="radio-inline"><input
											type="radio" name="menu" value="pro"> 교수</label></td>
								</tr>
								<tr class="form-inline">
									<td>받는사람</td>
									<td><span id="receiver-box"></span>
										<button type="button" class="btn btn-xs btn-default"
											data-toggle="modal" data-target="#searchModal">사용자
											검색</button>

										<div id="searchModal" class="modal fade" role="dialog">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header text-center">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<div class="form-inline input-group">
															<select class="form-control" name="option" id="option">
																<option value="name">이름</option>
																<option value="division">학과</option>
																<option value="subject">과목</option>
															</select> <span class="input-group-addon"><i
																class="glyphicon glyphicon-search"></i></span> <input
																type="text" class="form-control" id="search-word">
															<div class="input-group-btn">
																<button type="button" class="btn btn-success"
																	id="search-list">검색</button>
															</div>
														</div>
													</div>
													<div class="modal-body" id="search-result">
														<div style="height: 400px; overflow: auto;">
															<table class="table table-bordered">
																<colgroup>
																	<col width="20%">
																	<col width="20%">
																	<col width="30%">
																	<col width="30%">
																</colgroup>
																<thead>

																</thead>
																<tbody>

																</tbody>
															</table>
														</div>
													</div>
													<div class="modal-footer text-right">
														<button class="btn btn-info" id="add-list">추가</button>
														<button type="button" class="btn btn-default"
															data-dismiss="modal" id="close-modal">닫기</button>
													</div>
												</div>
											</div>
										</div></td>
								</tr>
								<tr>
									<td>제목</td>
									<td><input type="text" class="form-control" name="title">
									</td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea rows="10" class="form-control"
											name="contents"></textarea></td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td><input type="file" class="form-control" name="file">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 text-center">
						<button type="submit" class="btn btn-default" id="send-button">발송</button>
						<button type="button" class="btn btn-default"
							onclick="history.back()">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>