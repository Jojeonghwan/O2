<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<link rel="stylesheet" href="../css/find.css">
</head> 
<body>
<c:import url="/all_header.do"/>
	<div id="id_pw_find_form" class="container">
		<br><br><br>
		<form action="find_action" method="post">
		<input type="hidden" id="result" value="${result}">
		<input type="hidden" name="ch" value="${ch}">
			<c:if test="${ch==1}">
				<img src="../image/id_find.png" class="id_pw_find_img">
			</c:if>
			<c:if test="${ch==2}">
				<img src="../image/pw_find.png" class="id_pw_find_img">
			</c:if>
			<hr>
			계정 이메일을 입력해주세요.<br>
			<div class="form-group">
				<input type="text" name="email" class="form-control" required="required">
				<input type="submit" value="Click" id="id_pw_find_btn">
			</div>
		</form>
	</div>
</body>
</html>