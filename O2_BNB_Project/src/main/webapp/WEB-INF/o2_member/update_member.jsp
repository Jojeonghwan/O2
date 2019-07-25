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
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	// 이메일 인증
	$("#ismail").click(function(){
		var mail1 = $("#mail1").val();
		var btn1 = "";
		$.ajax({
			type : 'post',
			url : 'mail_confirm.aj',
			data : {'mail1' : mail1},
			dataType : 'xml',
			success: function(redata){
				var mailcnt = $(redata).find("mailcnt").text();
				if (mailcnt == 1){
					alert("중복된 이메일이 있습니다");						
				}else{
					var result = $(redata).find("encryption").text();
					btn1 += "<input type='text' size='10' placeholder='이메일 인증번호' class='confirm_text'>";
					btn1 += "<input type='hidden' class='encryption' value='"+ result +"'>"
					btn1 += "<button type='button' class='confirm_btn'>이메일 인증</button>";
					$("#ismail").next().html(btn1);
				}
			}
		});
	});
	
	// 이메일 인증암호 확인
	$("body").on("click", ".confirm_btn", function(){
		var confirm_text = $(".confirm_text").val();
		var encryption = $(".encryption").val();
		if (confirm_text == encryption) {
			$("#span3").html("");
			$("#span3").css("color", "gray");
			$("#span3").html("이메일 인증 완료");
			$("#mailright").val("1");
		}else{
			$("#span3").html("");
			$("#span3").css("color", "red");
			$("#span3").html("인증번호가 일치하지 않습니다");
			$("#mailright").val("2");
		}
	});
	

});

// 유효성 검사
function checkform(){
	if ( $("#mypass1").val() == "" ){
		$("#span1").css("color", "red");
		$("#span1").html("비밀번호를 입력해주세요");
		return false;
	}
	
}

// onfocus
function onfocus_pass(){
	$("#mypass1").val("");
} 


</script>
</head>
<body>
<div class="page-container">
	<form action="update_action.do" method="post" enctype="multipart/form-data" onsubmit="return checkform();">
	 <!-- onsubmit="return checkform()" -->
		<table style="width: 600px;" class="table table-bordered">
			<caption>회원정보 수정</caption>
			<tr>
				<th width="150">아이디</th>
				<td>
					<input type="text" name="id" id="myid" size="20" value="${m_dto.id}" disabled="disabled" >
					<span id="span2" style="color: gray; font-size: 7pt;"></span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><!-- 07.04 비밀번호는 무조건 입력하도록 만들자 -->
					<input type="password" id="mypass1" name="password" size="20" placeholder="비밀번호입력">
					<br>
					<input type="password" id="mypass2" size="20" placeholder="비밀번호확인">
					<!-- hidden -->
					<input type="hidden" id="passright" value="2">
					<span id="span1" style="color: gray; font-size: 7pt;"></span>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" id="myname" name="name" size="20" value="${m_dto.name}">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="tel" size="20" value="${m_dto.tel}">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email" size="20" id="mail1" value="${m_dto.email}">
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
		<input type="submit" value="회원정보 수정">
	</form>
</div>
</body>
</html>