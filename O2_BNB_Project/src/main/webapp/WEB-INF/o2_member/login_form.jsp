<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet" href="../css/find.css">
</head> 
<body>
<form action="login_action.do" method="post">
<div style="width:200px;">id : <input type="text" name="id"><br></div>
<div style="width:200px;">pw : <input type="password" name="pw"><br></div>
		<input type="submit" value="submit">
	</form>

<a href="id_find">아이디</a>·<a href="pw_find">비밀번호 찾기</a>
</body>
</html>