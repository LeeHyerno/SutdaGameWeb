<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>메인 헤더</title>
    <jsp:include page="../include/rel.jsp" flush="false" />

<style type="text/css">
body{
	background-color: #363636;
}
.home{
    margin-left: 50px;
    margin-right: 50px;
}
.container{
	padding: 0px;
}
.nav{
    display: flex;
    padding-top: 30px;
    border-bottom: 2px solid #DB3A00;
    height: 200px;
	list-style: none;
}
.dept01{
    display: flex;
    list-style-type: none;
    text-align: center;
}
.top-menu{
	margin-right: 150px;
}
.dept01 li span{
	margin-right: 70px;
}
.dept01 li span a{
	font-size: 30px;
	color: #DB3A00;
	font-weight: bold;
}
.dept02{
 	visibility: hidden;
 	opacity: 0;
 	transition: visibility 0s, opacity 0.5s ease-out;
	list-style-type: none;
	padding-left: 0px;
	font-size: 20px;
}
.dept02 a{
	color: #DB3A00;
	text-decoration: none;
}
.dept02 li{
	align-items: center;
	padding-left: 0px;
}
.login{
    width: 100px;
    height: 40px;
    padding-top: 10px;
    border-radius: 10%;
    background-color: #DB3A00;
    margin-right: 50px;
    text-align: center;
    float: right;
}
.login a{
    text-decoration: none;
    color: #363636;
    font-size: 20px;
    font-weight: bold;
}
.join{
    width: 120px;
    height: 40px;
    padding-top: 10px;
    border-radius: 10%;
    background-color: #DB3A00;
    margin-right: 50px;
    text-align: center;
    float: right;
}
.join a{
    text-decoration: none;
    color: #363636;
    font-size: 20px;
    font-weight: bold;
}
.mypage{
	margin-right: 50px;
}
.mypage a{
	text-decoration: none;
    color: white;
    font-size: 20px;
    font-weight: bold;
}
.dept01:hover .dept02{
	visibility: visible;
	opacity: 1;
}
</style>
</head>
<body>
	<header>
    <div class="nav">
        <div class="home"><a href="/main"><img src="../img/logo.png"></a></div>
        <div class="top-menu">
        	<ul class="dept01">
        		<li>
        			<span><a href="/news">새 소식</a></span>
        			<ul class="dept02">
        				<li id="notice"><a href="boardList?kind=1">공지사항</a></li>
        				<li id="patch"><a href="boardList?kind=2">패치노트</a></li>
        				<li id="event"><a href="boardList?kind=3">이벤트</a></li>
        			</ul>
        		</li>
        		<li>
        			<span><a href="/reference">자료실</a></span>
        			<ul class="dept02">
        				<li id="download"><a href="boardList?kind=4">다운로드</a></li>
        				<li id="guide"><a href="boardList?kind=5">게임 가이드</a></li>
        			</ul>
        		</li>
        		<li>
        			<span><a href="/community">커뮤니티</a></span>
        			<ul class="dept02">
        				<li id="community"><a href="boardList?kind=6">커뮤니티 게시판</a></li>
        			</ul>
        		</li>
        		<li>
        			<span><a href="/shop">상점</a></span>
        			<ul class="dept02">
        				<li id="shop"><a href="boardList?kind=7">웹 샵</a></li>
        			</ul>
        		</li>
        		<li>
        			<span><a href="/rank">명예의 전당</a></span>
        			<ul class="dept02">
        				<li id="rank">랭킹</li>
        			</ul>
        		</li>
        		<li>
        			<span><a href="/customer">고객센터</a></span>
        			<ul class="dept02">
        				<li id="QA"><a href="boardList?kind=8">1:1 문의</a></li>
        				<li id="FQ"><a href="boardList?kind=9	">자주하는 질문</a></li>
        			</ul>
        		</li>
        	</ul>
       	</div>
        <% if(session.getAttribute("loginInfo")==null){ %>
        
	        <div class="login"><a href="/login">로그인</a></div>
	        <div class="join"><a href="/join">회원가입</a></div>
        <% } else{ %>
        	<div class="mypage"><a href="/mypage"><img id="slide-menu" src="/img/samsun.png"></a></div>
        <% } %>
    </div>
    </header>
</body>
</html>