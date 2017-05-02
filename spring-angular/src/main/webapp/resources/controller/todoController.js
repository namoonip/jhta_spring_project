angular.module("todoApp")
.controller("todoCtrl", function($scope, TodoService) {
	//todo 제와와 관련된 속성, 기능을 정의해놓은 컨트롤러
	// 화면 및 사용자와 상호작용한다.
	// 컨트롤러는 사용할 때마다 매번 새로 만들어진다.
	// 화면에 표시할 todo 목록
		$scope.todoList = [];
		$scope.rows= [5, 10, 20];
		
		// 초기화 페이지
		$scope.currentPage = 1;
		
		// 화면에 표시할 페이지의 개수
		$scope.pageSize = 10;
		
		$scope.$watch(function() {	// $watch는 $scope의 변화를 추적하는 함수다.
			return $scope.pageSize;
		}, function(newValue, oldValue) {
			$scope.currentPage = 1;
		});
				
		$scope.getTodoList = function() {
			TodoService.getAllTodos() 		// 먼저 실행된다.
				.then(function(data) { 		// 그 다음 실행 된다.
					$scope.todoList = data;
				});
		}	
		$scope.getTodoList();
		
	}) 
	
	