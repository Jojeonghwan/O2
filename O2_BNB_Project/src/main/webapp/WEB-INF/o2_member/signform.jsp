<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/member_sy.js"></script>
<link rel="stylesheet" href="../css/member.css">
</head>
<body>
<c:import url="/all_header.do"/>

<div id="signform_div" class="container">
<h1 class="my-5 font main_font" style="color:#ff5a5f; padding-bottom: 20px;">
	Join
</h1>
	<form action="signup.do" method="post" enctype="multipart/form-data" 
	 onsubmit="if(!member_sign_checkform(this.form)){return false;}">
		<div class="form-group" style="display: inline-block;">
			<input type="text" class="form-control" name="id"  
			 id="id" placeholder="ID" required="required" style="width: 110px;">
		</div>
		<div class="form-group" style="display: inline-block;">
		<input type="button" id="ismyid" value="중복ID확인" style="width: 110px; height: 35px;">
			<!-- hidden -->
			<input type="hidden" id="idright" value="2"><!-- id 중복확인하면  -->
			<span id="span2" style="color: gray; font-size: 7pt;"></span>
		</div>
		<br>
		<div class="form-group" style="display: inline-block;">
			<input type="password" class="form-control" id="mypass1" name="password" 
			 style="width: 110px;" placeholder="PW" required="required">
		</div>
		<div class="form-group" style="display: inline-block;">
		<input type="password" id="mypass2" size="20" class="form-control"
		 style="width: 110px;"	placeholder="PW Check" required="required">
			<!-- hidden -->
			<input type="hidden" id="passright" value="2">
		</div>
		<span id="span1" style="color: gray; font-size: 7pt;"></span>
		<br>
		<div class="form-group" style="display: inline-block;">
			<input type="text" id="myname" name="name" class="form-control"
			 style="width: 223px;" placeholder="Name" required="required">
		</div>
		<div class="form-group" style="display: inline-block;">			
			<input type="text" class="form-control" placeholder="HP" 
			 name="tel" required="required">
		</div>
		<br>
		<div class="form-group" style="display: inline-block;">
			<input type="text" name="email" class="form-control" size="20" id="mail1" required="required"
			 style="width: 223px;">
			<input type="hidden" size="20" id="mail2">
		</div>
		<div class="form-group" style="display: inline-block;">
			<select id="mailurl" class="form-control" style="width: 110px;">
				<option value="1" selected="selected">직접입력</option>
				<option value="@daum.net">daum.net</option>
				<option value="@gmail.com">gamil.com</option>
				<option value="@hanmail.net">hanmail.net</option>
				<option value="@hotmail.com">hotmail.com</option>
				<option value="@naver.com">naver.com</option>
			</select>
		</div>
		<div class="form-group" style="display: inline-block;">
			<!-- hidden -->
			<input type="hidden" id="mailright" value="2">
			<input type="hidden" id="mailsend_con" name="mailsend_con" value="1">
			<button type="button" id="ismail" style="width: 100px; height: 35px;">메일주소 확인</button>
			
		</div>
		<br>
		<div class="form-group" style="display: inline-block;" id="span3">
		</div>
		<div class="form-group" style="display: inline-block;" id="span4">
		</div>
		<br>
		<div class="form-group" style="display: inline-block;">
				<input type="file" name="thumb_nail_img" size="20">
		</div>
		<br>
		<div class="form-group" style="display: inline-block;">
			<input type="radio" name="user_type" value="1" checked="checked">Traveler
			&nbsp;&nbsp;
			<input type="radio" name="user_type" value="2">Host
		</div>
		&nbsp;&nbsp;
		<div class="form-group" style="display: inline-block;">
			<input type="submit" class="btn btn-primary" id="join" style="width: 110px; height: 35px;" value="가입하기">
		</div>

	</form>
</div>

</body>
</html>