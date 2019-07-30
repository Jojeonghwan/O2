<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
</head> 
<body>
<form action="login_action.do" method="post">
<div style="width:200px;">id : <input type="text" name="id" required="required"><br></div>
<div style="width:200px;">pw : <input type="password" name="pw" required="required"><br></div>
	
		<a href="find">아이디/비밀번호 찾기</a>
		<input type="submit" value="submit">
	</form>
</body>
</html>