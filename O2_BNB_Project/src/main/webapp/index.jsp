<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css" />
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
	</head> 
	<body> 
		<div id="main_top">
			<c:if test="${sessionScope.login_id == null }">
				<a href="member/login.do">Login</a> &nbsp;&nbsp;
				<a href="member/signform.do">sign</a>
			</c:if>
			<c:if test="${sessionScope.login_id != null }">
				${sessionScope.login_id} 님이 로그인 중입니다
				<%-- (${sessionScope.user_type})타입 회원 --%>
				<a href="member/logout.do">Log out</a>&nbsp;&nbsp;
				<a href="member/mypage.do">My Page</a>&nbsp;&nbsp;
				<a href="host/roomform.do">room form</a>
				<c:if test="${sessionScope.user_type=='3'}">
					<a href="member/adminPage.do">관리자</a>
				</c:if>
			</c:if>
		</div>
		
		<div id="main1">
			<c:import url="main/main1.do"/>
		</div>
		<div id="main2">
			<c:import url="/main2.do"/>
		</div>
		<br>
		<c:if test="${sessionScope.login_id != null }">
		<div>
			<a href="qna/qna_list.do?id=${sessionScope.login_id}">QnA</a>
		</div>
		</c:if>
		
	</body>
</head>
</html>
