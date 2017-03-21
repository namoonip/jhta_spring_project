<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Sample Page</title>
</head>
<body>
	<h1>Sample Page</h1>
	<ul>
		<li><a href="list.do?pno=23&sort=sales">23</a></li>
	</ul>
	
	<form action="add.do" method="get">
		번호 : <input type="number" name="no"/><br />
		이름 : <input type="text" name="name" /><br />
		국어 : <input type="number" name="kor" /><br />
		영어 : <input type="number" name="eng" /><br />
		수학 : <input type="number" name="math" /><br />
		물리 : <input type="number" name="phy" /><br />
		화학 : <input type="number" name="che" /><br />
		생물 : <input type="number" name="bio" /><br />
		음악 : <input type="number" name="mus" /><br />
		<button type="submit">등록</button>
	</form>
</body>
</html>
