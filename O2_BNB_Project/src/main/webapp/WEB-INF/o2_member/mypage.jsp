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

<div class="container1">
<div class="outer">
        <div class="inner">
            <div class="centered">
<div class="container margin_60" style="vertical-align: middle;" >
	<div class="row" >
		<div class="col-sm-3 col-sm-3 form-group mt-5" >
				<div id="mypageId my-5 form-group">
					<c:if test="${sessionScope.thumb_nail=='noimg'}">
						<img src="../image/user.png" >
					</c:if>
					<c:if test="${sessionScope.thumb_nail!='noimg'}">
						<img src="../save/${sessionScope.thumb_nail}">
					</c:if>					
				</div>
			<div class="col-sm-3 ml-5 form-group" style="margin-left:3px; " >
				<div style="width:100px;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${sessionScope.login_id} 님<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="member/logout.do" style="color:gray; font-size:8pt;">Log out</a>
				</div>
			</div>
		</div><!-- col-sm-6 -->	
		<div class="col-sm-3 col-sm-3 form-group" style="text-align: center" >
			<div class="my-5">
			<a href="delete_member.do" onclick="return confirm('모든 게시물과 결제내역 등이 사라집니다. 정말 탈퇴하시겠습니까?');">
				회원탈퇴
			</a>
			<a href="update.do">회원정보수정</a>
			<br>
			<a href="scrap_list">스크랩</a>
			<br>
			<a href="../host/home_guest_list.do">home_guest_list</a>
			<br>
			<a href="../host/roomlist.do">room list</a>
			<br>
			<a href="../chat/ch_con.do">Chatting</a>
			<br>
			<a href="../board/pay_list.do">pay_list</a>
			<br>
			<c:if test="${sessionScope.user_type==1}">
				<a href="user_type_change.do">user_type_change</a>
			</c:if>
			</div>
		</div><!-- col-sm-6 -->
	</div><!-- row -->
</div><!-- container -->
</div>
</div>
</div>
</div>
</body>
</html>