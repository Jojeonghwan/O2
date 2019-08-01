<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/main.css">
</head> 
<body>
	<div id="main_top_black">
		<div id="subject" onclick="location.href='../index.jsp'" 
		 style="display: inline-block; padding-top: 10px; margin-right: 59%;">
			<img src="../image/wind.png" id="all_header_img">&nbsp;&nbsp;
			<b id="title" style="color:whtie;">B&B</b>
		</div>
		<c:if test="${sessionScope.login_id != null }">
			<div class="login_black" style="float: right;">
				<c:if test="${sessionScope.thumb_nail=='noimg.png'}">
					<img src="../image/user.png" id="noimg">
				</c:if>
				<c:if test="${sessionScope.thumb_nail!='noimg.png'}">
					<img src="../save/${sessionScope.thumb_nail}" id="thumb_nail">
				</c:if>
				${sessionScope.login_id} 님&nbsp;&nbsp;&nbsp;
				<a href="logout.do">Log out</a>&nbsp;&nbsp;&nbsp;
				<c:if test="${sessionScope.user_type!='3'}">
					<a href="mypage.do">My Page</a>&nbsp;&nbsp;&nbsp;
				</c:if>
				<c:if test="${sessionScope.user_type=='3'}">
					&nbsp;&nbsp;&nbsp;<a href="adminPage.do">Admin Page</a>
				</c:if>
			</div>
		</c:if>
	</div>	
<hr id="header_black_hr">
</body>
</html>