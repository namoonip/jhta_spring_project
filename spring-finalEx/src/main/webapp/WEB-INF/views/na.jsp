<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-dark navbar bg-inverse navbar-fixed-top">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button class="navbar-toggler hidden-sm-up pull-sm-right" type="button" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    &#9776;
                </button>
                <a class="navbar-brand" href="index.html"><span class="glyphicon glyphicon-education"></span> 중앙 HTA 대학교</a>
            </div>
            <!-- 메뉴 라인 -->
            <ul class="nav navbar-nav top-nav navbar-left pull-xs-left">
		        <li class="active"><a href="#">학적 관리 <span class="sr-only">(current)</span></a></li>
		        <li><a href="#">교과 관리 <span class="sr-only">(current)</span></a></li>
		        <li><a href="#">수업 관리 <span class="sr-only">(current)</span></a></li>
		        <li><a href="#">수강 관리 <span class="sr-only">(current)</span></a></li>
		       	<li><a href="#">성적 관리 <span class="sr-only">(current)</span></a></li>
            </ul>
            <!-- Top Menu Items -->
            <ul class="nav navbar-nav top-nav navbar-right pull-xs-right">
                <li class="dropdown nav-item active">
                    <!-- <div class="dropdown"> -->
                        <a class="nav-link dropdown-toggle" href="javascript:;" id="dropdownMenu4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-envelope"></i><span class="sr-only">(current)</span></a>
                        <ul class="dropdown-menu message-dropdown">
                            <li class="dropdown-item message-preview">
                                <a href="javascript:;">
                                    <div class="media">
                                        <span class="media-left">
                                            <img class="media-object" src="http://placehold.it/50x50" alt=""/>
                                        </span>
                                        <div class="media-body">
                                            <h5 class="media-heading"><strong>John Smith</strong>
                                            </h5>
                                            <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                            <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="dropdown-item message-preview">
                                <a href="javascript:;">
                                    <div class="media">
                                        <span class="media-left">
                                            <img class="media-object" src="http://placehold.it/50x50" alt="">
                                        </span>
                                        <div class="media-body">
                                            <h5 class="media-heading"><strong>John Smith</strong>
                                            </h5>
                                            <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                            <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="dropdown-item message-preview">
                                <a href="javascript:;">
                                    <div class="media">
                                        <span class="media-left">
                                            <img class="media-object" src="http://placehold.it/50x50" alt="">
                                        </span>
                                        <div class="media-body">
                                            <h5 class="media-heading"><strong>John Smith</strong>
                                            </h5>
                                            <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                            <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="dropdown-item message-footer">
                                <a href="javascript:;">Read All New Messages</a>
                            </li>
                        </ul>
                    <!-- </div> -->
                </li>
                <li class="dropdown nav-item">
                    <!-- <div class="dropdown"> -->
                        <a href="javascript:;" class="nav-link dropdown-toggle" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false"><i class="fa fa-bell"></i><span class="sr-only">(current)</span></a>
                        <ul class="dropdown-menu alert-dropdown">
                            <li class="dropdown-item">
                                <a href="javascript:;">Alert Name <span class="label label-default"> Alert Badge</span></a>
                            </li>
                            <li class="dropdown-item">
                                <a href="javascript:;">Alert Name <span class="label label-primary"> Alert Badge</span></a>
                            </li>
                            <li class="dropdown-item">
                                <a href="javascript:;">Alert Name <span class="label label-success">Alert Badge</span></a>
                            </li>
                            <li class="dropdown-item">
                                <a href="javascript:;">Alert Name <span class="label label-info"> Alert Badge</span></a>
                            </li>
                            <li class="dropdown-item">
                                <a href="javascript:;">Alert Name <span class="label label-warning"> Alert Badge</span></a>
                            </li>
                            <li class="dropdown-item">
                                <a href="javascript:;">Alert Name <span class="label label-danger"> Alert Badge</span></a>
                            </li>
                            <li class="dropdown-divider"></li>
                            <li class="dropdown-item">
                                <a href="javascript:;">View All</a>
                            </li>
                        </ul>
                    <!-- </div> -->
                </li>
                <li class="dropdown nav-item">
                    <a href="javascript:;" class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>관리자님 어서오세요.</b></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-item">
                            <a href="javascript:;"><i class="fa fa-fw fa-user"></i> 내정보 조회</a>
                        </li>
                        <li class="dropdown-item">
                            <a href="javascript:;"><i class="fa fa-fw fa-envelope"></i> 쪽지</a>
                        </li>
                        <li class="dropdown-item">
                            <a href="javascript:;"><i class="fa fa-fw fa-gear"></i> 내 정보 수정</a>
                        </li>
                        <li class="divider"></li>
                        <li class="dropdown-item">
                            <a href="javascript:;"><i class="fa fa-fw fa-power-off"></i> 로그아웃</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-toggleable-sm navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav list-group">
                	<li class="list-group-item">
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo1"> 사용자 정보 조회<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo1" class="list-group collapse">
                            <li class="list-group-item">
                                <a href="">학생 정보 조회</a>
                            </li>
                            <li class="list-group-item">
                                <a href="">교수 정보 조회</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo2"> 입학 관리<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo2" class="list-group collapse">
                            <li class="list-group-item">
                                <a href="">신입학 등록</a>
                            </li>
                            <li class="list-group-item">
                                <a href="">신입학 조회</a>
                            </li>
                            <li class="list-group-item">
                                <a href="">재입학 등록</a>
                            </li>
                            <li class="list-group-item">
                                <a href="">재입학 조회</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo3"> 휴학 관리<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo3" class="list-group collapse">
                            <li class="list-group-item">
                                <a href="">휴학 신청 목록</a>
                            </li>
                            <li class="list-group-item">
                                <a href="">휴학 승인 목록</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo4"> 복학 관리<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo4" class="list-group collapse">
                            <li class="list-group-item">
                                <a href="">복학 신청 목록</a>
                            </li>
                            <li class="list-group-item">
                                <a href="">복학 승인 목록</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo5"> 전과 관리<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo5" class="list-group collapse">
                            <li class="list-group-item">
                                <a href="">전체 전과 내역 조회</a>
                            </li>
                            <li class="list-group-item">
                                <a href="">전과 신청 목록</a>
                            </li>
                            <li class="list-group-item">
                                <a href="">전과 승인 목록</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo6"> 제적 관리<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo6" class="list-group collapse">
                            <li class="list-group-item">
                                <a href="">제적 처리</a>
                            </li>
                            <li class="list-group-item">
                                <a href="">제적예정자 목록</a>
                            </li>
                            <li class="list-group-item">
                                <a href="">제적자 목록</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo7"> 자퇴 관리<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo7" class="list-group collapse">
                            <li class="list-group-item">
                                <a href="">자퇴 신청 목록</a>
                            </li>
                            <li class="list-group-item">
                                <a href="">자퇴자 목록</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <a href="">입학관리</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper" style="height: 1000px; width: 100%;">
        	
        	
        
        
        
        
        
        	
		</div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>


</body>
</html>