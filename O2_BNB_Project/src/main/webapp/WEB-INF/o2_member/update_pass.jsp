<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
</head>
<body>
<form action="update_member.do" method="post" onsubmit="return update_pass_checkform();">
	비밀번호 확인<br>
	<input type="text" size="20" id="pass1" name="pass1" required="required">
	<span style="color: gray; font-size:8pt">회원가입 시 입력한 비밀번호를 입력해주세요</span>
	<br>
	<!-- hidden -->
	<input type="hidden" id="samepass" value="0">
	<input type="submit" value="확인">
</form>
</body>
</html>