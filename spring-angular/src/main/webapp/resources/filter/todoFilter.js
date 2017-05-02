angular.module("todoApp")
.filter("range", function() {
// 필터 만들기
// <tr ng-repeat="todo in todoList | range:  1  :  5">
//									  data, page, size
	return function(data, page, size ) {
		var start_index = (page-1) * size;
		var end_index = page * size;
		
		return data.slice(start_index, end_index);
	}
});
