<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="todoApp">
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script type="text/javascript" src="resources/directive/myDirective.js"></script>
<script type="text/javascript">
	var todoApp = angular.module('todoApp', ["customDirective"]);
</script>
<script type="text/javascript" src="resources/service/todoService.js"></script>
<script type="text/javascript" src="resources/filter/todoFilter.js"></script>
<script type="text/javascript" src="resources/controller/todoController.js"></script>
<title>Todo Application</title>
</head>
<body>
<div class="container" ng-controller="todoCtrl" >
	<h1>Todo Application</h1>
	
	<div class="row">
		<label for="">출력 개수</label>
		<select ng-model="pageSize" ng-options="row for row in rows"></select>
	</div>
	
	<table class="table">
		<thead>
			<tr>
				<td>id</td>
				<td>title</td>
				<td>data</td>
				<td>completed</td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="todo in todoList | range:currentPage:pageSize">
				<td>{{todo.id}}</td>
				<td>{{todo.title}}</td>
				<td>{{todo.eventDate}}</td>
				<td>{{todo.completed}}</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	
	<!-- 페이지네비게이션 -->
	<div navi records="{{todoList.length}}" size="{{pageSize}}" page="currentPage"></div>
</div>
</body>
</html>
