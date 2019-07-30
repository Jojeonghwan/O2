<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/member_sy.js"></script>
</head>
<body>
<div class="page-container">
	<form action="signup.do" method="post" enctype="multipart/form-data" ><!-- onsubmit="return member_sign_checkform();" -->
		<table style="width: 600px;" class="table table-bordered">
			<caption>회원가입 폼</caption>
			<tr>
				<th width="150">아이디</th>
				<td>
					<input type="text" name="id" id="id" size="20" required="required">
					<input type="button" id="ismyid" value="중복ID확인">
					<!-- hidden -->
					<input type="hidden" id="idright" value="2"><!-- id 중복확인하면  -->
					<span id="span2" style="color: gray; font-size: 7pt;"></span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" id="mypass1" name="password" size="20" placeholder="비밀번호입력" required="required">
					<br>
					<input type="password" id="mypass2" size="20" placeholder="비밀번호확인" required="required">
					<!-- hidden -->
					<input type="hidden" id="passright" value="2">
					<span id="span1" style="color: gray; font-size: 7pt;"></span>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" id="myname" name="name" size="20" required="required">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="number" class="form-control" placeholder="-없이 입력하시오" name="tel" required="required"><br><br>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email" size="20" id="mail1" required="required">
					<input type="hidden" size="20" id="mail2">
					<select id="mailurl" >
						<option value="1" selected="selected">직접입력</option>
						<option value="@daum.net">daum.net</option>
						<option value="@gmail.com">gamil.com</option>
						<option value="@hanmail.net">hanmail.net</option>
						<option value="@hotmail.com">hotmail.com</option>
						<option value="@naver.com">naver.com</option>
					</select>
					<!-- hidden -->
					<input type="hidden" id="mailright" value="2">
					<input type="hidden" id="mailsend_con" name="mailsend_con" value="1">
					<button type="button" size="10" id="ismail">메일주소 확인</button>
					<span id="span3"></span>
				</td>
			</tr>
			<tr>
				<th>프로필사진</th>
				<td>
					<input type="file" name="thumb_nail_img" size="20">
				</td>
			</tr>
			<tr>
				<th>사용자등록</th>
				<td>
					<input type="radio" name="user_type" value="1" checked="checked">Traveler
					&nbsp;&nbsp;&nbsp;
					<input type="radio" name="user_type" value="2">Host
				</td>
			</tr>
		</table>
		<input type="button" class="btn btn-primary" id="join"  value="가입하기" onclick="if(!member_sign_checkform(this.form)){return false;}">
	</form>
</div>

</body>
</html>