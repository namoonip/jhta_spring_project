var other = angular.module("otherModule", []);

// 디렉티브 정의하기
other.directive("aB", function() {
	/* 
	 * <div a-b="x" items="y">   
	 * 사용될 때는 위의 호따옴표 안의 선언된 글자의 대문자 앞의 소문자까지 가져와 쓴다  
	 * scope 	: 이 디렉티브가 사용된 곳의 $scope를 가리킨다.
	 * element	: 이 디렉티브가 사용된 태그를 가리킨다.
	 * 			  $('div')를 사용해서 선택했을 때와 똑같은 상태의 객체다.
	 * 			  element.css('color', 'red')
	 * 			  element.append("<p></p>") 
	 * attrs	: 이 디렉티브가 사용된 태그의 attribute정보를 담고 있다.
	 * 			  attrs = {"a-b":"x", "items": "y"} 
	*/
	return function(scope, element, attrs) {
		var cval = attrs["c"];
		var dval = attrs["d"];
		var data = scope[cval];
		
		if(angular.isArray(data)) {
			var html = "<ul>";
			
			data.forEach(function(item, index) {
				var value = item[dval];
				html += "<li class='list-group-item'>" + value + "</li>"
			})
			html += "</ul>";
			
			element.append(html);
		}
	}
	
});