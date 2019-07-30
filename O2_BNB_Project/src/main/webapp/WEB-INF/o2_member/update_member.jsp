<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/member_sy.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="page-container">
	<form action="m_update_action.do" name="m_update_action" id="m_update_action" method="post" enctype="multipart/form-data" ><!-- onsubmit="update_checkform(this.form);" -->
		<table style="width: 600px;" class="table table-bordered">
			<caption>회원정보 수정</caption>
			<tr>
				<th width="150">아이디</th>
				<td>
					<input type="text" name="id" id="myid" size="20" value="${m_dto.id}" disabled="disabled" required="required">
					<span id="span2" style="color: gray; font-size: 7pt;"></span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" id="mypass1" name="password" size="20" placeholder="비밀번호입력" value="${m_dto.password}">
					<br>
					<input type="password" id="mypass2" size="20" placeholder="비밀번호확인">
					<!-- hidden -->
					<input type="hidden" id="passright" name="passright" value="2"><!-- mypass1과 mypass2 일치하면 1 -->
					<input type="hidden" id="passChange" name="passChange" value="0"><!-- 비번 바꾸면 1, 안바꾸면 0 -->
					<!-- <input type="hidden" id="samepass" name="samepass" value="2">db랑 비번 일치 -->
					<span id="span1" style="color: gray; font-size: 7pt;"></span>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" id="myname" name="name" size="20" value="${m_dto.name}" required="required">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="tel" size="20" value="${m_dto.tel}" required="required">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email" size="20" id="mail1" value="${m_dto.email}" required="required">
					<input type="hidden" size="20" id="mail2">
					<select id="mailurl">
						<option value="1" selected="selected">직접입력</option>
						<option value="@daum.net">daum.net</option>
						<option value="@gmail.com">gamil.com</option>
						<option value="@hanmail.net">hanmail.net</option>
						<option value="@hotmail.com">hotmail.com</option>
						<option value="@naver.com">naver.com</option>
					</select>
					<!-- hidden -->
					<input type="hidden" id="mailright" value="2"><!-- 인증완료하면 1 -->
					<input type="hidden" id="mailsend_con" name="mailsend_con" value="2"><!-- 이메일 변경하면 1 -->
					<button type="button" size="10" id="ismail">메일주소 확인</button>
					<span id="span3"></span>
				</td>
			</tr>
			<tr>
				<th>프로필사진</th>
				<td>
					<span id="span4" style="color:gray; font-size:8pt;">${m_dto.thumb_nail}</span>
					<input type="file" name="thumb_nail_img" size="20" id="ex_file">
				</td>
			</tr>
			<tr>
				<th>사용자등록</th>
				<td>
					<input type="radio" name="user_type" value="1" ${m_dto.user_type =='1'?"checked":""}>Traveler
					&nbsp;&nbsp;&nbsp;
					<input type="radio" name="user_type" value="2" ${m_dto.user_type =='2'?"checked":""}>Host
				</td>
			</tr>
		</table>
		<!-- hidden -->
		<input type="hidden" name="num" value="${m_dto.num}">
		<input type="submit" value="회원정보 수정" onclick="if(!update_checkform(this.form)){return false;}"> <!-- onclick="if(!update_checkform(this.form)){return false;}" -->
	</form> <!--  -->
</div>
</body>
</html>