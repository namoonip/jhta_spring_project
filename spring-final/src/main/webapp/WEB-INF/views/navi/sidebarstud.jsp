<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
</script>
	<div id="wrapper">
        <div id="sidebar-wrapper">
            <aside id="sidebar">
                <ul id="sidemenu" class="sidebar-nav" style="background-color: #4296dc;">
                    <li>
                        <a class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" data-target="#submenu-2">
                            <span class="sidebar-icon"></span><span class="sidebar-title">학생 정보</span>
                            <b class="caret"></b>
                        </a>
                        <ul id="submenu-2" class="panel-collapse collapse panel-switch" role="menu">
                            <li><a href="stuInfo"><i class="fa fa-caret-right"></i>정보 조회</a></li>
                            <li><a href="stuPwdCheck"><i class="fa fa-caret-right"></i>비밀번호 변경</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-3">
                            <span class="sidebar-icon"></span><span class="sidebar-title">성적 조회</span>
                            <b class="caret"></b>
                        </a>
                        <ul id="submenu-3" class="panel-collapse collapse panel-switch" role="menu">
                            <li><a href="lookupScore"><i class="fa fa-caret-right"></i>현학기 성적 조회</a></li>
                            <li><a href="lookupAllScore"><i class="fa fa-caret-right"></i>전체학기 성적 조회</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-6">
                            <span class="sidebar-icon"></span><span class="sidebar-title">수강 신청</span>
                            <b class="caret"></b>
                        </a>
                        <ul id="submenu-6" class="panel-collapse collapse panel-switch" role="menu">
                            <li><a href="enrollMain"><i class="fa fa-caret-right"></i>수강 신청</a></li>
                            <li><a href="nowEnrollList"><i class="fa fa-caret-right"></i>수강 목록</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-5">
                            <span class="sidebar-icon"></span><span class="sidebar-title">재학 관리</span>                            <b class="caret"></b>
                        </a>
                        <ul id="submenu-5" class="panel-collapse collapse panel-switch" role="menu">
                            <li><a href="stuReport"><i class="fa fa-caret-right"></i>과제 관리</a></li>
                            <li><a href="stuAttendance"><i class="fa fa-caret-right"></i>출결 관리</a></li>
                            <li><a href="studenttime"><i class="fa fa-caret-right"></i>시간표</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-4">
                            <span class="sidebar-icon"></span><span class="sidebar-title">학적 관리</span>
                            <b class="caret"></b>
                        </a>
                        <ul id="submenu-4" class="panel-collapse collapse panel-switch" role="menu">
                            <li><a href="leave"><i class="fa fa-caret-right"></i>휴학 신청</a></li>
                            <li><a href="reinstate"><i class="fa fa-caret-right"></i>복학 신청</a></li>
                            <li><a href="dropoff"><i class="fa fa-caret-right"></i>자퇴 신청</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-7">
                            <span class="sidebar-icon"></span><span class="sidebar-title">게시판</span>
                            <b class="caret"></b>
                        </a>
                        <ul id="submenu-7" class="panel-collapse collapse panel-switch" role="menu">
                            <li><a href="studeptboard"><i class="fa fa-caret-right"></i>학과 게시판</a></li>
                            <li><a href="stufreeboard"><i class="fa fa-caret-right"></i>자유 게시판</a></li>
                            <li><a href="stuqnaboard"><i class="fa fa-caret-right"></i>Q&amp;A 게시판</a></li>
                        </ul>
                    </li>
                    <li>
					     <a class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-9">
					         <span class="sidebar-icon"></span><span class="sidebar-title">커뮤니티 관리</span>
					         <b class="caret"></b>
					     </a>
					     <ul id="submenu-9" class="panel-collapse collapse panel-switch" role="menu">
					         <li><a href="sturecmessagebox"><i class="fa fa-caret-right"></i>쪽지 관리</a></li>
					     </ul>
					 </li>
                </ul>
            </aside>            
        </div>
    </div>