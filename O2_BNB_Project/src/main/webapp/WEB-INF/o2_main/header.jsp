<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet" href="../css/main.css">
</head> 
<body>
	<div id="main_top">
		<c:if test="${sessionScope.login_id == null }">
			<div class="not_login">
				<a href="member/login.do">Login</a> 
				&nbsp;&nbsp;&nbsp;
				<a href="member/signform.do">sign</a>
			</div>
		</c:if>
		<c:if test="${sessionScope.login_id != null }">
			<div class="login">
				<c:if test="${sessionScope.thumb_nail=='noimg.png'}">
					<img src="image/user.png" id="noimg">
				</c:if>
				<c:if test="${sessionScope.thumb_nail!='noimg.png'}">
					<img src="save/${sessionScope.thumb_nail}" id="thumb_nail">
				</c:if>
				${sessionScope.login_id} 님&nbsp;&nbsp;&nbsp;
				<a href="member/logout.do">Log out</a>&nbsp;&nbsp;&nbsp;
				<a href="member/mypage.do">My Page</a>&nbsp;&nbsp;&nbsp;
				<a href="host/roomform.do">Room Form</a>
				<c:if test="${sessionScope.user_type=='3'}">
					&nbsp;&nbsp;&nbsp;<a href="member/adminPage.do">Admin Page</a>
			</c:if>
			</div>
		</c:if>
	</div>	
<hr id="header_hr">
</body>
</html>