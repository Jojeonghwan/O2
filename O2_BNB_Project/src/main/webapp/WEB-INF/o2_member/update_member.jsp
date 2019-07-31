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
<link rel="stylesheet" href="../css/member.css">
</head>
<body>
<c:import url="/all_header.do"/>
<div id="user_modify_div" class="container">
	<h1 class="my-5 font main_font" style="color:#ff5a5f; padding-bottom: 20px;">
		Modify
	</h1>
	<form action="m_update_action.do" name="m_update_action" id="m_update_action" method="post" enctype="multipart/form-data" 
	 onsubmit="if(!update_checkform(this.form)){return false;}">
			<div class="form-group" style="display: inline-block;">
					<input type="text" name="id" id="myid" size="20" style='width: 223px;'
					 class="form-control" value="${m_dto.id}" disabled="disabled">
					<span id="span2" style="color: gray; font-size: 7pt;"></span>
			</div>
			<br>
			<div class="form-group" style="display: inline-block;">
				<input type="password" id="mypass1" name="password" size="20" 
				 class="form-control" style="width: 223px;" value="${m_dto.password}">
			</div>
			<div class="form-group" style="display: inline-block;">
				<input type="password" id="mypass2" size="20" style="width: 223px;" 
				 required="required" class="form-control">
				<!-- hidden -->
				<input type="hidden" id="passright" name="passright" value="2"><!-- mypass1과 mypass2 일치하면 1 -->
				<input type="hidden" id="passChange" name="passChange" value="0"><!-- 비번 바꾸면 1, 안바꾸면 0 -->
				<!-- <input type="hidden" id="samepass" name="samepass" value="2">db랑 비번 일치 -->
				<span id="span1" style="color: gray; font-size: 7pt;"></span>
			</div>		
			<br>
			<div class="form-group" style="display: inline-block;">
				<input type="text" id="myname" name="name" size="20" value="${m_dto.name}" 
				 style="width: 223px;" class="form-control">
			</div>
			<div class="form-group" style="display: inline-block;">
				<input type="text" name="tel" size="20" value="${m_dto.tel}" class="form-control"
				 style="width: 223px;">
			</div>
			<br>
			<div class="form-group" style="display: inline-block;">
				<input type="text" name="email" size="20" id="mail1" value="${m_dto.email}" class="form-control"
				 style="width: 223px;">
				<input type="hidden" size="20" id="mail2">
			</div>
			<div class="form-group" style="display: inline-block;">
				<select id="mailurl" class="form-control" style="width:110px;">
					<option value="1" selected="selected">직접입력</option>
					<option value="@daum.net" >daum.net</option>
					<option value="@gmail.com">gamil.com</option>
					<option value="@hanmail.net">hanmail.net</option>
					<option value="@hotmail.com">hotmail.com</option>
					<option value="@naver.com">naver.com</option>
				</select>
			</div>
			<div class="form-group" style="display: inline-block;">	
				<input type="hidden" id="mailright" value="2"><!-- 인증완료하면 1 -->
				<input type="hidden" id="mailsend_con" name="mailsend_con" value="2"><!-- 이메일 변경하면 1 -->
				<button type="button" id="ismail" style="width: 110px; height: 35px;">메일주소 확인</button>
			</div>
			<br>
			<div class="form-group" style="display: inline-block;" id="span3">
			</div>
			<div class="form-group" style="display: inline-block;" id="span4">
			</div>
			<br>
			<div class="form-group" style="display: inline-block;">	
				<span id="span4" style="color:gray; font-size:8pt;">${m_dto.thumb_nail}</span>
					<input type="file" name="thumb_nail_img" size="20" id="ex_file">
			</div>
			<br>
			<div class="form-group" style="display: inline-block;">
				<input type="radio" name="user_type" value="1" ${m_dto.user_type =='1'?"checked":""}>Traveler
				&nbsp;&nbsp;
				<input type="radio" name="user_type" value="2" ${m_dto.user_type =='2'?"checked":""}>Host
			</div>	
			&nbsp;&nbsp;	
			<div class="form-group" style="display: inline-block;">
				<input type="hidden" name="num" value="${m_dto.num}">
				<input type="submit" value="Save" id="save" style="width: 80px; height: 35px;">
			</div>
	</form>
</div>
</body>
</html>