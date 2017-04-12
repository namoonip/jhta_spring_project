<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/navi/adminnavi.jsp" %>
<%@ include file="/WEB-INF/views/navi/sidebar-major.jsp" %>
   <div class="container" style="margin-left: 250px; padding-top:25px; ">
    <div class="row text-right">
         홈
      </div>
      <div class="row">
         <h4><span class="glyphicon glyphicon-th-list"></span> 학기관리</h4>
         <hr style="border:solid 0.5px #2C7BB5;">
      </div>
      <div class="row" style="margin-bottom: 20px">
      	<a href="addSemester" class="btn btn-primary btn-sm pull-right">등록</a>
      </div>
      <div class="row">
         <div class="panel panel-default panel-body">
            <table class="table table-condensed">
				<thead>
					<tr style="font-size: 10pt">
						<th>년도/학기</th>
						<th>학기기간</th>
						<th>수강신청기간</th>
						<th>수강정정기간</th>
						<th>성적열람기간</th>
						<th>성적이의기간</th>
						<th>성적정정기간</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
         </div>
      </div>
   </div>
<%--<%@ include file="/WEB-INF/views/footer/footer.jsp" %> --%>
</body>
</html>