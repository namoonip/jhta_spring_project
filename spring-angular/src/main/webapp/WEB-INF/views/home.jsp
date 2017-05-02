<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="todoApp">
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script type="text/javascript">
	var todoApp = angular.module('todoApp', []);
	
	// 컨트롤러가 사용하는 공통기능이 정의되어 있는 서비스
	// 주로 서버와의 ajax 통신을 통한 데이터교환이 정의되어 있다.
	// 서비스는 싱글턴이다.
	todoApp.factory('TodoService', function($http) {
		return {
			// 서버에서 모든 todo를 가져오는 기능
			getAllTodos:function() {
				// Promise p = $.http.get() 			<- Promise 객체가 얻어진다.
				// Promise p2 = p.then(약속을 지키는 경우, 약속을 안지키는 경우) 	<- 리턴 값도 Promise 객체다.
				return $http.get("todos/")
					.then(function(response) {
					// 서버로 부터 받은 json 데이터
					return response.data;
				});
				
			}/* ,
			removeTodo:function(id) {
				
			},
			getTodo:function(id) {
				
			},
			saveTodo:function(todo) {
				
			},
			updateTodo:function(todo) {
				
			} */		
		}
		
	});
	

	// 디렉티브 정의하기
	todoApp.directive("navi", function() {
		return {
			scope:{
				rows:"@records",
				size:"@size",
				page:"=page"
			},
			restrict:"EA",	// <navi /> <div navi></div>와 같다.
			template:"<ul class='pagination'><li ng-click='changePage(page+1)' ng-repeat='page in pages'><a>{{page+1}}</a></li></ul>",
			controller:function($scope, $element, $attrs) {
				$scope.changePage = function(pageNo) {
					$scope.page = pageNo;
				}
			},
			link:function(scope, element, attrs) {
				var watchFn = function(watchScope) {
					return watchScope.rows + watchScope.size;
				}
				scope.$watch(watchFn, function(newValue, oldValue) {
					var result = [];
					for(var i=0; i<Math.ceil(scope.rows/scope.size); i++) {
						result.push(i);
					}
					scope.pages = result;
				})
			}
		}
		
	});
	
	/* 
		scope.$watch(감시하는 값을 반환하는 함수, 값이 변할 때마다 실행할 함수)
	*/
	
/* 	todoApp.directive("navi", function() {
		return function(scope, element, attrs) {
			element.append("<ul class='pagination'><li><a>33333</a></li></ul>")
		}
		
	}); */
	
	// 필터 만들기
	// <tr ng-repeat="todo in todoList | range:  1  :  5">
	//									  data, page, size
	todoApp.filter("range", function() {
		return function(data, page, size ) {
			var start_index = (page-1) * size;
			var end_index = page * size;
			
			return data.slice(start_index, end_index);
		}
	});
	
	todoApp.filter("navi", function() {
		return function(data, size) {
			var result = [];
			for (var i=0; i<Math.ceil(data.length/size); i++) {
				result.push(i);
			}
			return result;
		}		
	});

	// todo 제와와 관련된 속성, 기능을 정의해놓은 컨트롤러
	// 화면 및 사용자와 상호작용한다.
	// 컨트롤러는 사용할 때마다 매번 새로 만들어진다.
	todoApp.controller("todoCtrl", function($scope, TodoService) {
		// 화면에 표시할 todo 목록
		$scope.todoList = [];
		$scope.rows= [5, 10, 20];
		
		$scope.currentPage = 1;		
		$scope.pageSize = 5;
		
		$scope.$watch(function() {	// $watch는 $scope의 변화를 추적하는 함수다.
			return $scope.pageSize;
		}, function(newValue, oldValue) {
			$scope.currentPage = 1;
		});
		
		$scope.setCurrentPage = function(pageNo) {
			$scope.currentPage = pageNo;
		}
		
		$scope.getActiveClass = function(pageNo) {
			return $scope.currentPage == pageNo ? "btn-primary" : "";
			
		}
		
		$scope.getTodoList = function() {
			TodoService.getAllTodos() 		// 먼저 실행된다.
				.then(function(data) { 		// 그 다음 실행 된다.
					$scope.todoList = data;
				});
		}
		
		$scope.getTodoList();
		
	}) 
</script>
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
	<!-- 	
	<div class="row text-right">
		<div class="btn-group">
			<a ng-repeat="page in todoList | navi:pageSize" 
				ng-click="setCurrentPage(page+1)"
				ng-class="getActiveClass(page+1)"
				class="btn btn-default">{{page+1}}</a>
		</div>
	</div>
	 -->
</div>
</body>
</html>