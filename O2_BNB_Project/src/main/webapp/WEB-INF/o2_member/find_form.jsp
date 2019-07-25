<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head> 
<body>
	<form action="find_action" method="post">
	<input type="hidden" name="ch" value="${ch}">
		<c:if test="${ch==1}">
			아이디 찾기 <br>
		</c:if>
		<c:if test="${ch==2}">
			비밀번호 찾기 <br>
		</c:if>
		계정 이메일 입력 : <input type="text" name="email"><br>
		<input type="submit" value="submit">
	</form>
	<script type="text/javascript">
		if(${result}=="2") {
			alert("죄송합니다. 입력하신 이메일에 해당하는 계정이 없습니다.\n"
				+ "이메일을 다시 입력해주시길 바랍니다.");
		}
	</script>
</body>
</html>