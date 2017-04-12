<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
 <style type="text/css">
 
@import url('//maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css');

.navbar-default .navbar-nav #user-profile {
    height: 50px;
    padding-top: 15px;
    padding-left: 58px;
}

.navbar-default .navbar-nav #user-profile img {
    height: 45px;
    width: 45px;
    position: absolute;
    top: 2px;
    left: 8px;
    padding: 1px;
}

#wrapper {
    padding-top: 50px;
    padding-left: 0;
    -webkit-transition: all .5s ease;
    -moz-transition: all .5s ease;
    -o-transition: all .5s ease;
    transition: all .5s ease;
}

@media (min-width: 992px) {
    #wrapper {
        padding-left: 225px;
    }
}

@media (min-width: 992px) {
    #wrapper #sidebar-wrapper {
        width: 225px;
    }
}

#sidebar-wrapper {
    border-right: 1px solid #e7e7e7;
}

#sidebar-wrapper {
    z-index: 1000;
    position: fixed;
    left: 225px;
    width: 0;
    height: 100%;
    margin-left: -225px;
    overflow-y: auto;
    background: #f8f8f8;
    -webkit-transition: all .5s ease;
    -moz-transition: all .5s ease;
    -o-transition: all .5s ease;
    transition: all .5s ease;
}

#sidebar-wrapper .sidebar-nav {
    position: absolute;
    top: 0;
    width: 225px;
    font-size: 14px;
    margin: 0;
    padding: 0;
    list-style: none;
}

#sidebar-wrapper .sidebar-nav li {
    text-indent: 0;
    line-height: 45px;
}

#sidebar-wrapper .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #428bca;
}

#sidebar-wrapper .sidebar-nav li a .sidebar-icon {
    width: 45px;
    height: 45px;
    font-size: 14px;
    padding: 0 2px;
    display: inline-block;
    text-indent: 7px;
    margin-right: 10px;
    color: #fff;
    float: left;
}

#sidebar-wrapper .sidebar-nav li a .caret {
  position: absolute;
  right: 23px;
  top: auto;
  margin-top: 20px;
}

#sidebar-wrapper .sidebar-nav li ul.panel-collapse {
    list-style: none;
    -moz-padding-start: 0;
    -webkit-padding-start: 0;
    -khtml-padding-start: 0;
    -o-padding-start: 0;
    padding-start: 0;
    padding: 0;
}

#sidebar-wrapper .sidebar-nav li ul.panel-collapse li i {
    margin-right: 10px;
}

#sidebar-wrapper .sidebar-nav li ul.panel-collapse li {
    text-indent: 15px;
}

@media (max-width: 992px) {
    #wrapper #sidebar-wrapper {
        width: 45px;
    }
    #wrapper #sidebar-wrapper #sidebar #sidemenu li ul {
        position: fixed;
        left: 45px;
        margin-top: -45px;
        z-index: 1000;
        width: 200px;
        height: 0;
    }
}

.sidebar-nav li a {
    color: #fff !important;
}
.sidebar-nav li ul li a {
	background-color: #62aee7 !important;
	color: #fff !important;	
}
</style>
  
</head>
<body>
    <div id="navbar-wrapper">
        <header>
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color: #4296dc;">            
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#" style="color: white;">JHTA 학사 관리 시스템</a>
                            <ul class="nav navbar-nav">
						      <li><a href="#" style="color: white;">학적 관리</a></li>
						      <li><a href="#" style="color: white;">교과 관리</a></li>
						      <li><a href="#" style="color: white;">수업 관리</a></li>
						      <li><a href="#" style="color: white;">수강 관리</a></li>
						      <li><a href="#" style="color: white;">성적 관리</a></li>
    						</ul>
                    </div>
                    
                    <div id="navbar-collapse" class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                        	<li><a id="user-profile" href="#"style="color: white;"><img src="resources/images/2.jpg" class="img-responsive img-thumbnail img-circle"> 관리자님 환영합니다.</a></li>
                            <li><a href="#" style="color: white;">내 정보 수정</a></li>
                            <li><a href="#" style="color: white;">로그아웃</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
    </div>
    <%@ include file="sidebar.jsp" %>
    <div class="container">
		<div class="row">
			<h3>사용자 관리</h3><hr>
			<div class="row">
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#student" aria-controls="student" role="tab" data-toggle="tab">학부생</a></li>
					<li role="presentation"><a href="#professor" aria-controls="professor" role="tab" data-toggle="tab">교수</a></li>
					<li role="presentation"><a href="#employee" aria-controls="employee" role="tab" data-toggle="tab">교직원</a></li>
				</ul>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="student">
						<form action="">
					<table class="table table-striped form-group">
					 	<thead>
							<tr>
								<th class="info text-center" rowspan="2" style="vertical-align: middle;"><strong>검색</strong></th>
								<th class="form-group">
									소속 : 
									<select name="college">
										<option value="">대학 선택</option>
										<option value="">인문대학</option>
										<option value="">사회대학</option>
										<option value="">상경대학</option>
										<option value="">자연대학</option>
										<option value="">공과대학</option>
									</select>
									<select name="major">
										<option value="">학과 선택</option>
										<option value="">국어국문학과</option>
										<option value="">일어일문학과</option>
										<option value="">영어과</option>
										<option value="">사회복지학과</option>
										<option value="">노인복지학과</option>
										<option value="">유아복지학과</option>
										<option value="">경영학과</option>
										<option value="">경제학과</option>
										<option value="">물리학과</option>
										<option value="">수학과</option>
										<option value="">화학과</option>
										<option value="">컴퓨터공학과</option>
										<option value="">전자공학과</option>
										<option value="">정보통신공학과</option>
									</select>
									<select name="grade">
										<option value="">학년 선택</option>
										<option value="">전체</option>
										<option value="">1</option>
										<option value="">2</option>
										<option value="">3</option>
										<option value="">4</option>
									</select>
								</th>
							</tr>
							<tr>
								<th class="form-group">
									학생 : 
									<select name="search" >
										<option value="">이름</option>
										<option value="">학번</option>
										<option value="">주민번호</option>
									</select>
									<input type="text" name="q">
									<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span>검색</button>
								</th>
							</tr>
						</thead>
					</table>
				</form>
					</div>
					<div role="tabpanel" class="tab-pane" id="professor">
						<form action="">
					<table class="table table-striped form-group">
					 	<thead>
							<tr>
								<th class="info text-center" rowspan="2" style="vertical-align: middle;"><strong>검색</strong></th>
								<th class="form-group">
									소속 : 
									<select name="college">
										<option value="">대학 선택</option>
										<option value="">인문대학</option>
										<option value="">사회대학</option>
										<option value="">상경대학</option>
										<option value="">자연대학</option>
										<option value="">공과대학</option>
									</select>
									<select name="major">
										<option value="">학과 선택</option>
										<option value="">국어국문학과</option>
										<option value="">일어일문학과</option>
										<option value="">영어과</option>
										<option value="">사회복지학과</option>
										<option value="">노인복지학과</option>
										<option value="">유아복지학과</option>
										<option value="">경영학과</option>
										<option value="">경제학과</option>
										<option value="">물리학과</option>
										<option value="">수학과</option>
										<option value="">화학과</option>
										<option value="">컴퓨터공학과</option>
										<option value="">전자공학과</option>
										<option value="">정보통신공학과</option>
									</select>
								</th>
							</tr>
							<tr>
								<th class="form-group">
									교수 : 
									<select name="search" >
										<option value="">이름</option>
										<option value="">교번</option>
										<option value="">주민번호</option>
									</select>
									<input type="text" name="q">
									<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span>검색</button>
								</th>
							</tr>
						</thead>
					</table>
				</form>
					</div>
					<div role="tabpanel" class="tab-pane" id="employee">
						<form action="">
					<table class="table table-striped form-group">
					 	<thead>
							<tr>
								<th class="info text-center" rowspan="2" style="vertical-align: middle;"><strong>검색</strong></th>
								<th class="form-group">
									소속 : 
									<select name="college">
										<option value="">부 선택</option>
										<option value="">인문대학</option>
										<option value="">사회대학</option>
										<option value="">상경대학</option>
										<option value="">자연대학</option>
										<option value="">공과대학</option>
									</select>
									<select name="major">
										<option value="">부서 선택</option>
										<option value="">국어국문학과</option>
										<option value="">일어일문학과</option>
										<option value="">영어과</option>
										<option value="">사회복지학과</option>
										<option value="">노인복지학과</option>
										<option value="">유아복지학과</option>
										<option value="">경영학과</option>
										<option value="">경제학과</option>
										<option value="">물리학과</option>
										<option value="">수학과</option>
										<option value="">화학과</option>
										<option value="">컴퓨터공학과</option>
										<option value="">전자공학과</option>
										<option value="">정보통신공학과</option>
									</select>
								</th>
							</tr>
							<tr>
								<th class="form-group">
									교직원 : 
									<select name="search" >
										<option value="">이름</option>
										<option value="">교번</option>
										<option value="">주민번호</option>
									</select>
									<input type="text" name="q">
									<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span>검색</button>
								</th>
							</tr>
						</thead>
					</table>
				</form>
					</div>
				</div>
			</div>
			<div class="row">
			</div>
		</div>
	</div> 
</body>
</html>