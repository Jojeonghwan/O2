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
</head>
<body>
<form action="change.do" method="post">
본인의 계정을 게스트에서 호스트로 전환하시겠습니까?

계정을 호스트로 전환시 제약이 있을수 있습니다.

<input type="submit" value="전환">
</form>
</body>
</html>