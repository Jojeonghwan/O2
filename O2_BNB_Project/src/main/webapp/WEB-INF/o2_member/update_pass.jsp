<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
<link rel="stylesheet" type="text/css" href="../css/member.css" />
</head>
<body>
<c:import url="/all_header.do"/>

<div id="update_pw_div" class="container">
<br><br><br><br><br><br>
	<form action="update_member.do" method="post" onsubmit="return update_pass_checkform();">
	회원가입 시 입력한 비밀번호를 입력해주세요
	<hr>
	<div class="form-group" style="display: inline-block; width: 250px;">
		<input type="password" class="form-control" id="pass1" name="pass1" required="required">
	</div>
	<input type="hidden" id="samepass" value="0">
	&nbsp;&nbsp;
	<div class="form-group" style="display: inline-block; width: 50px;">
		<input type="submit" value="Click" id="update_pw_btn">
	</div>
</form>
</div>

</body>
</html>