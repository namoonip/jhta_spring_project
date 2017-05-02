angular.module("customDirective", [])
.directive("navi", function() {
	// 새로운 모듈이다.
	return {
		scope:{
			rows:"@records",
			size:"@size",
			page:"=page"
		},
		restrict:"EA",	// <navi /> <div navi></div>와 같다.
		template:"<ul class='pagination'>" +
					"<li ng-class='getActiveClass(page+1)' ng-click='changePage(page+1)' ng-repeat='page in pages'>" +
						"<a>{{page+1}}</a>" +
					"</li>" +
				 "</ul>",
		controller:function($scope, $element, $attrs) {
			$scope.changePage = function(pageNo) {
				$scope.page = pageNo;
			}
			
			$scope.getActiveClass = function(pageNo) {
				return $scope.page == pageNo ? "active" : "";
			};
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
