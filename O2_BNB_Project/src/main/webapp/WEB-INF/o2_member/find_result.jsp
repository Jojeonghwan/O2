<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="../css/find.css">
</head> 
<body>
	<c:if test="${result==1}">
		<a href="../index.jsp">메인화면</a><br>
		<div id="id_pw_find_result" class="container">
			<br><br><br>
			<img src="../image/email.png" class="id_pw_find_img"><br>
			<hr>
			귀하의 메일로 계정 정보가 발송되었습니다.<br>
			<c:if test="${fn:startsWith(email,'naver') || fn:startsWith(email,'daum') || fn:startsWith(email,'hanmail')}">
				<a href="http://www.${email}" target="_blank" class="id_pw_result_a">메일 확인하기</a>
			</c:if>
			<c:if test="${fn:startsWith(email,'gmail')}">
				<a href="http://www.google.com" target="_blank" class="id_pw_result_a">메일 확인하기</a>
			</c:if>
		</div>
	</c:if>

</body>
</html>