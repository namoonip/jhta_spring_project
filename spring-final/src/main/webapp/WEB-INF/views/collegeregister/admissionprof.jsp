<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script type="text/javascript">
  function execDaumPostcode() {
      new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

              // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
              var extraRoadAddr = ''; // 도로명 조합형 주소 변수

              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                  extraRoadAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if(data.buildingName !== '' && data.apartment === 'Y'){
                 extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }
              // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if(extraRoadAddr !== ''){
                  extraRoadAddr = ' (' + extraRoadAddr + ')';
              }
              // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
              if(fullRoadAddr !== ''){
                  fullRoadAddr += extraRoadAddr;
              }

              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById('roadAddress').value = fullRoadAddr;
              document.getElementById('jibunAddress').value = data.jibunAddress;

              // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
              if(data.autoRoadAddress) {
                  //예상되는 도로명 주소에 조합형 주소를 추가한다.
                  var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                  document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

              } else if(data.autoJibunAddress) {
                  var expJibunAddr = data.autoJibunAddress;
                  document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

              } else {
                  document.getElementById('guide').innerHTML = '';
              }
          }
      }).open();
  }
  
  	$(function () {
  		
		$("#college").change(function (event) {
			var dept = $(this).find("option:selected").val();
			$.ajax({
				url: "searchmajor?dept=" + dept,
				dataType: "json",
				type: "POST",
				success: function(data) {
					$("#major").empty();
					$("#professor").empty();

					for (var i=0; i<data.sitemapList.length; i++) {
						$("#major").append("<option value="+data.sitemapList[i].code+">"+data.sitemapList[i].name+"</option>");	
					}
					for (var i=0; i<data.profList.length; i++) {
						$("#professor").append("<option value="+data.profList[i].id+">"+data.profList[i].name+"</option>");	
					}
				}
			});
		});
		$("#major").change(function (event) {
			var dept = $(this).find("option:selected").val();
			$.ajax({
				url: "searchprof?code=" + dept,
				dataType: "json",
				type: "POST",
				success: function(data) {
					console.log(data);
					$("#professor").empty();
					for (var i=0; i<data.length; i++) {						
						$("#professor").append("<option value="+data[i].id+">"+data[i].name+"</option>");	
					}
				}
			});
		});
		$("#emailAddr").change(function (event) {
			if($(this).val() != 'edit'){
				$("[name='studemailaddr']").val($(this).val());
				$("[name='studemailaddr']").attr('readonly',true);
			}else{
				$("[name='studemailaddr']").attr('readonly',false);
				$("[name='studemailaddr']").val('');
			}
		});
	})
  </script>
</head>
<body>
<%@ include file="/WEB-INF/views/navi/adminnavi.jsp" %>
<%@ include file="sidebar-hakjuk.jsp" %>
	<div class="container" style="margin-left: 250px; padding-top:25px; ">
		<div class="row text-right">
			홈 > 학적관리 > 입학관리 > <strong>교수 임용</strong> 
		</div>
		<div class="row" style="margin: 0px; padding: 0px;">
			<h4><span class="glyphicon glyphicon-list-alt"></span> 교수 정보 등록</h4>
			<hr style="border:solid 0.5px #2C7BB5;">
		</div>
		<div class="row">
			<div class="panel panel-default">
				<div class="panel panel-body" style="margin: 10px; ">
					<form action="addprof" method="post">
						<div class="row">
							<div class="col-xs-2">
								<img src="/jhta/resources/images/student/PeoPleDefault.png" alt="person" style="width: 150px; height: 180px;" />
							</div>
							<div class="col-xs-10">
								<p>[기본 정보]</p>
								<table class="table table-bordered table-striped">
									<colgroup>
										<col width="20%" />
										<col width="30%" />
										<col width="20%" />
										<col width="30%" />
									</colgroup>
									<tbody>
										<tr>
											<th>교수 성명 : </th>
											<td><input type="text" name="name" class="form-control"/></td>
											<th>재직 상태 : </th>
											<td>
												<select class="form-control" name="register">
													<option value="PF1000">재직</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>주민등록번호 : </th>
											<td>
												<input type="text" name="ssn" class="form-control" placeholder="'-'을 입력하세요.">
											</td>
											<th>성별 구분: </th>
											<td>
												<label>남 : </label><input type="radio" name="gender" value="M" checked="checked"/> / 
												<label>여 : </label><input type="radio" name="gender" value="F"/>
											</td>
										</tr>
										<tr>
											<th>대학 구분 : </th>
											<td>
												<select class="form-control" id="college">
													<c:forEach var = "sitemap" items="${sitemapList }" >
														<option value="${sitemap.code }">${sitemap.name }</option>
													</c:forEach>
												</select>
											</td>
											<th>학과 구분: </th>
											<td>
												<select class="form-control" name="division" id="major">
													<c:if test="${not empty majors}">
														<c:forEach var="major" items="${majors }">
															<option value="${major.code }">${major.name }</option> 
														</c:forEach>
													</c:if>
												</select>
											</td>
										</tr>
										<tr>
											<th>직위</th>
											<td>
												<select class="form-control" name="grade">
													<option value="조교수">조교수</option>
													<option value="부교수">부교수</option>
													<option value="정교수">정교수</option>
												</select>
											</td>
											<th>외국인 여부 : </th>
											<td>
												내국인 :<input type="radio" name="forei" id="forei" value="N" checked="checked" />
												외국인 :<input type="radio" name="forei" id="forei" value="Y" />
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<p>[추가 정보]</p>
							<table class="table table-bordered">
								<colgroup>
									<col width="10%" />
									<col width="10%" />
									<col width="*" />
								</colgroup>
								<tbody>
									<tr>
										<th>개인</th>
										<th>휴대폰</th>
										<td><input type="text" name="phone" class="form-control" placeholder="'-'을 입력하세요."/></td>
										<th>이메일</th>
										<td>
											<div class=row>
												<div class="col-xs-4">
													<input type="text" name="studemail" class="form-control" />
												</div>
												<div class="col-xs-1">
													<p>@</p>
												</div>
												<div class="col-xs-4">
													<input type="text" name="studemailaddr" class="form-control" />
												</div>
												<div class="col-xs-3">
													<select class="form-control" id="emailAddr">
														<option value="edit">직접입력</option>
														<option value="naver.com">naver.com</option>
														<option value="gmail.com">gmail.com</option>
														<option value="nate.com">nate.com</option>
														<option value="hanmail.net">hanmail.net</option>
														<option value="yahoo.co.kr">yahoo.co.kr</option>
													</select> 
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th rowspan="4">자택</th>
										<th rowspan="2">주소</th>
										<td colspan="3">
											<div class="row">
												<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"> 
												<div class="col-md-10">
													<input type="text" name="addr1" id="roadAddress" class="form-control" /> 
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3"><input type="text" name="addr2" id="jibunAddress" class="form-control" />
											<span id="guide" style="color:#999"></span>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="text-right">
								<button class="btn btn-primary btn-sm" type="submit"><span class="glyphicon glyphicon-pencil"></span> 등록</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>