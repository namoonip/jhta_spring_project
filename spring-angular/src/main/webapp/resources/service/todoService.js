angular.module("todoApp")
.factory('TodoService', function($http) {
	//컨트롤러가 사용하는 공통기능이 정의되어 있는 서비스
	// 주로 서버와의 ajax 통신을 통한 데이터교환이 정의되어 있다.
	// 서비스는 싱글턴이다.
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

