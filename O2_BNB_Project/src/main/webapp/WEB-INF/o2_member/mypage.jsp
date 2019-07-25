<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<title>Insert title here</title>
</head>
<body>
<a href="delete_member.do">회원탈퇴</a><br>
<a href="update_member.do">회원정보수정</a><br>
<a href="../index.jsp">메인페이지</a><br>
<a href="scrap_list">스크랩</a><br>
<!-- <button id="send_ticket">표받기</button> -->
<a href="../host/roomlist.do">room list</a><br>
<input type="button" value="채팅창" id="ch_list">
${sessionScope.login_id}
<c:if test="${sessionScope.login_id=='user1' || sessionScope.login_id=='admin'}">
	<a href="../board/content.do?num=8">room_info</a>
</c:if>
<a href="../board/pay_list.do">pay_list</a><br>
<a href="../host/home_guest_list.do">home_guest_list</a><br>
<a href="../host/host_review.do">host_review</a>
</body>
</html>