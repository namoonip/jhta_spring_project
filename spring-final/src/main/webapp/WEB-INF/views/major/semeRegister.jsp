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
       <h4><span class="glyphicon glyphicon-th-list"></span> 학기등록</h4>
       <hr style="border:solid 0.5px #2C7BB5;">
    </div>
	<div class="row well">
		<div class="col-md-6">
			
			<table class="table table-condensed">
			   	<colgroup>
			   		<col width="20%">
			   		<col width="32%">
			   		<col width="8%">
			   		<col width="32%">
			   		<col width="8%">
			   	</colgroup>
			   	<form action="addSemester" method="post" >
	      		
	      			
	      			<tr>
	      				<td>학기명</td>
	      				<td>
	      					<input name="select" class="form-control"  style="text-align: right";/>
	      				</td>
	      				<td>년도</td>
	      				<td><input name="select" class="form-control" /></td>
	      				<td>학기</td>
	      			</tr>
	      			<tr>
	      				<td>학기기간</td>
	      				<td>
	      					<input name="termStart" type="date" class="form-control" />
	      				</td>
	      				<td style="text-align: center;"> ~ </td>
	      				<td>
	      					<input name="termEnd" type="date" class="form-control" />
	      				</td>
	      				<td></td>
	      			</tr>
	      			<tr>
	      				<td>수강신청기간</td>
	      				<td>
	      					<input name="enrollTermStart" type="date" class="form-control" />
	      				</td>
	      				<td style="text-align: center;"> ~ </td>
	      				<td	 >
	      					<input name="enrollTermEnd" type="date" class="form-control" />
	      				</td>
	      				<td></td>
	      			</tr>
	      			<tr>
	      				<td>수강정정기간</td>
	      				<td>
	      					<input name="enrollEditTermStart" type="date" class="form-control" />
	      				</td>
	      				<td style="text-align: center;"> ~ </td>
	      				<td	 >
	      					<input name="enrollEditTermEnd" type="date" class="form-control" />
	      				</td>
	      				<td></td>
	      			</tr>
	      			<tr>
	      				<td>성적등록기간</td>
	      				<td>
	      					<input name="applyTermStart" type="date" class="form-control" />
	      				</td>
	      				<td style="text-align: center;"> ~ </td>
	      				<td	 >
	      					<input name="applyTermEnd" type="date" class="form-control" />
	      				</td>
	      				<td></td>
	      			</tr>
	      			<tr>
	      				<td>강의평가기간</td>
	      				<td>
	      					<input name="evalTermStart" type="date" class="form-control" />
	      				</td>
	      				<td style="text-align: center;"> ~ </td>
	      				<td	 >
	      					<input name="evalTermEnd" type="date" class="form-control" />
	      				</td>
	      				<td></td>
	      			</tr>
	      			<tr>
	      				<td>성적열람기간</td>
	      				<td>
	      					<input name="gradeTermStart" type="date" class="form-control" />
	      				</td>
	      				<td style="text-align: center;"> ~ </td>
	      				<td	 >
	      					<input name="gradeTermEnd" type="date" class="form-control" />
	      				</td>
	      				<td></td>
	      			</tr>
	      			<tr>
	      				<td>성적이의기간</td>
	      				<td>
	      					<input name="appealTermStart" type="date" class="form-control" />
	      				</td>
	      				<td style="text-align: center;"> ~ </td>
	      				<td	 >
	      					<input name="appealTermEnd" type="date" class="form-control" />
	      				</td>
	      				<td></td>
	      			</tr>
	      			<tr>
	      				<td>성적정정기간</td>
	      				<td>
	      					<input name="gradeEditTermStart" type="date" class="form-control" />
	      				</td>
	      				<td style="text-align: center;"> ~ </td>
	      				<td	 >
	      					<input name="gradeEditTermEnd" type="date" class="form-control" />
	      				</td>
	      				<td></td>
	      			</tr>
	      			<tr>
	      				<td>수강기간</td>
	      				<td>
	      					<input name="courseTermStart" type="date" class="form-control" />
	      				</td>
	      				<td style="text-align: center;"> ~ </td>
	      				<td	 >
	      					<input name="courseTermEnd" type="date" class="form-control" />
	      				</td>
	      				<td></td>
	      			</tr>
		      	</form>
	    	</table>
    	</div>
    </div>
      
      
   </div>
<%-- <%@ include file="/WEB-INF/views/footer/footer.jsp" %>--%>
</body>
</html>
      