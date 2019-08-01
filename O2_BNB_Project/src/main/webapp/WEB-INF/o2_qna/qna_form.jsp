<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/qna_sy.js"></script>
<link rel="stylesheet" href="../css/qna.css">
</head>
<body>
<c:import url="/header_black2.do"/>

<div id="qna_form_div" class="container" style="width: 550px;">
	<h1 class="my-5 font main_font" style="color:#ff5a5f; margin-bottom: 0;">
		QnA
	</h1>
	<form action="qna_action.do" method="post" onsubmit="return qnaInsertCheckform()" style="width: 500px;">
	<input type="hidden" name="id" value="${sessionScope.login_id}">
		<div class="form-group" style="display: inline-block;">
			Writer : ${sessionScope.login_id}
		</div>
		<br>
		<div class="form-group" style="display: inline-block;">
			Inquiry : 
			<select class="form-control" name="q_type" id="q_select" style="width: 500px;">
				<option value="0"> ----문의주제 선택---- </option>
				<c:if test="${sessionScope.user_type == '3'}">
					<option value="1"> 공지사항 </option>
				</c:if>
				<option value="2"> 환불 관련 문의 </option>
				<option value="3"> 사용자 관련 문의 </option>
				<option value="4"> 기타 문의 </option>
			</select>
		</div>
		<br>
		<div class="form-group" style="display: inline-block;">
			Subject :
			<input type="text" class="form-control" name="subject"  
			 placeholder="Subject" required="required" style="width: 500px;">
		</div>
		<br>
		<div class="form-group" style="display: inline-block;">
			Content : 
			 <textarea class="form-control" style="width: 500px; height: 100px; resize: none;" name="content"
			  placeholder="Content"></textarea>
		</div>
		<br>
		<div class="form-group" style="display: inline-block;">
			<input type="password" class="form-control" name="pw"  
			 required="required" placeholder="Password" style="width: 110px;">
		</div>
		<div class="form-group" style="display: inline-block; float:right;">
			<input type="submit" value="Write" id="qna_save">
		</div>
	</form>
</div>
</body>
</html>