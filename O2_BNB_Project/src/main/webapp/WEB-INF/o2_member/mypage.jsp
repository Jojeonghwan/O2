<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<link rel="stylesheet" href="../css/member.css">
</head>
<body>
<c:import url="/all_header.do"/>

<div id="mypage_list_div" class="container">
	<div class="row my-2">
		<div class="col-sm-3" style="margin-left: 20px;">
			<a href="delete_member.do" onclick="return confirm('모든 게시물과 결제내역 등이 사라집니다. 정말 탈퇴하시겠습니까?');">
				회원탈퇴
			</a>
		</div>
		<div class="col-sm-3">
			<a href="update.do">회원정보수정</a>
		</div>
	</div>
	<div class="row my-2">
		<div class="col-sm-3" style="margin-left: 20px;">
			<a href="scrap_list">스크랩</a>
		</div>
		<div class="col-sm-3">
			<a href="../host/home_guest_list.do">home_guest_list</a>
		</div>
	</div>
	<div class="row my-2">
		<div class="col-sm-3" style="margin-left: 20px;">
			<a href="../host/roomlist.do">room list</a>
		</div>
		<div class="col-sm-3">
			<a href="../chat/ch_con.do">Chatting</a>
		</div>
	</div>
	<div class="row my-2">
		<div class="col-sm-3" style="margin-left: 20px;">
			<a href="../board/pay_list.do">pay_list</a>
		</div>
		<div class="col-sm-3">
			<c:if test="${sessionScope.user_type==1}">
				<a href="user_type_change.do">user_type_change</a>
			</c:if>
		</div>
	</div>
</div>
</body>
</html>