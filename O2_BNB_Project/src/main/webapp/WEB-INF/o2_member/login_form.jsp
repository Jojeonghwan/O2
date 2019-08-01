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
<link rel="stylesheet" href="../css/find.css">

</head> 
<body>
<c:import url="/all_header.do"/>

<div id="login_from_div" style="zoom: 1.2;">
	<div class="container" style="display: inline-block;">
		<form action="login_action.do" method="post">
			<div class="form-group">
				<input type="text" class="form-control font" name="id" required="required" placeholder="ID">
			</div>
			<div class="form-group">
				<input type="password" class="form-control font"  name="pw" required="required" placeholder="PW">
			</div>
			<input type="submit" value="Login" id="login_btn" style="width: 250px;">
		</form>
		<div style="font-size: 0.7em; padding-top: 2px; padding-right: 140px;">
			<a href="id_find">아이디</a>·<a href="pw_find">비밀번호 찾기</a>
		</div>
	</div>
</div>
</body>
</html>