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
<script type="text/javascript">
$(function () {
	$("#search-btn").click(function () {
		
	});
});
</script>


</head>
<body>
<%@ include file="/WEB-INF/views/navi/adminnavi.jsp" %>
<%@ include file="/WEB-INF/views/collegeregister/sidebar-hakjuk.jsp" %>
	<div class="container" style="margin-left: 250px; padding-top:25px; ">
    	<div class="row text-right">
			홈 > 과목관리 > <strong>과목검색</strong>
    	</div>
    	<div class="row">
    	<h4><span class="glyphicon glyphicon-th-list"></span> 과목검색</h4>
        <hr style="border:solid 0.5px #2C7BB5;">
    	</div>
    	<div class="panel panel-default panel-body">
    		<form method="post" action="studentjejuk" name="subjectsearchform" id="student-search-form" class="form-inline">
    			<table class="table table-condensed">
      				<tr>
      					<td><label>검색옵션</label></td>
      					<td>
      						<div class="form-group">
      							<select name="opt">
      								<option value="studentid">학번</option>
      								<option value="studentname">이름</option>
      							</select>
      						</div>
      						<div class="form-group">
      							<label>검색어</label>
      							<input type="text" name="keyword" value="keyword" required="required">
      						</div>
      						<button type="submit" class="btn btn-default" id="search-btn">검색</button>
      					</td>
      				</tr>
      			</table>
    		
    		</form>
    	</div>
    </div>
</body>
</html>