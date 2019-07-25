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
<script type="text/javascript">
	$(function(){
		// 비밀번호 확인
		$("#mypass2").change(function(){
			if($("#mypass1").val() != $("#mypass2").val() ){
				$("#span1").css("color","red");
				$("#span1").text("비밀번호를 확인해주세요");
				$("#mypass2").val("");
				$("#mypass2").focus();
				$("#passright").val("2");
				}
			else{
				$("#span1").css("color","gray");
				$("#span1").text("비밀번호 확인완료");
				$("#passright").val("1");
			}
		});
		
		// 중복아이디 확인
		$("#ismyid").click(function(){
			var id = $("#id").val();
			//alert(id);
			$.ajax({
				type : 'post',
				url : 'idfind.aj',
				data : {'id' : id},
				dataType : 'xml',
				success: function(redata) {
					var result = $(redata).find("id").text();
					 if(result == 1){
						$("#span2").html("");
						$("#span2").css("color", "red");
						$("#span2").html("중복된 아이디입니다");
						$("#idright").val("2");
						$("#myid").val("");
						$("#myid").focus();
						//alert($("#isright").val());
					}else{
						$("#span2").css("color", "gray");
						$("#span2").html("사용할 수 있는 아이디입니다");
						$("#idright").val("1");
					}
				}
			});
		});
		
		// 메일주소 셀렉트
		$("#mailurl").change(function(){
			var mail1 = $("#mail1").val();
			var mail2 = $("#mailurl option:selected").val();
			//console.log(mail1);
			//console.log(mail1+mail2);
			var email = mail1 + mail2 ; 
			$("#mail1").val(email);
		});
		
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
						var mailfail = $(redata).find("send").text();
						if(mailfail == 1){
							alert("메일발송실패 : 메일주소를 확인해주세요");
						}else{
							var result = $(redata).find("encryption").text();
							btn1 += "<input type='text' size='10' placeholder='이메일 인증번호' class='confirm_text'>";
							btn1 += "<input type='hidden' class='encryption' value='"+ result +"'>"
							btn1 += "<button type='button' class='confirm_btn'>이메일 인증</button>";
							$("#ismail").next().html(btn1);
						}						
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

	
	// onsubmit 유효성검사
	 function checkform(){
		if ( $("#idright").val() == '2'){
			alert("아이디를 확인해주세요");
			return false;
		}
		
		if ( $("#passright").val() == '2'){
			alert("아이디를 확인해주세요");
			return false;
		}
		
		if ( $("#mailright").val() == '2'){
			alert("메일주소를 확인해주세요");
			return false;
		}
		
	} 
</script>
</head>
<body>
<div class="page-container">
	<form action="signup.do" method="post" enctype="multipart/form-data" onsubmit="return checkform()">
		<table style="width: 600px;" class="table table-bordered">
			<caption>회원가입 폼</caption>
			<tr>
				<th width="150">아이디</th>
				<td>
					<input type="text" name="id" id="id" size="20">
					<input type="button" id="ismyid" value="중복ID확인">
					<!-- hidden -->
					<input type="hidden" id="idright" value="2">
					<span id="span2" style="color: gray; font-size: 7pt;"></span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
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
					<input type="text" id="myname" name="name" size="20">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="tel1" size="5" onkeyup='call()'>
					<input type="text" id="tel2" size="5" onkeyup='call()'>
					<input type="text" id="tel3" size="5" onkeyup='call()'>
					<input type="hidden" id="tel" name="tel" size="20">
					<script type="text/javascript">
						function call()
						{
						 if(document.getElementById("tel1").value 
								 && document.getElementById("tel2").value 
								 && document.getElementById("tel3").value){
						  document.getElementById('tel').value =	document.getElementById('tel1').value + "-"
																  + document.getElementById('tel2').value + "-"
																  + document.getElementById('tel3').value ;
						 }
						}
					</script>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email" size="20" id="mail1">
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
		<input type="submit" value="submit">
	</form>
</div>

</body>
</html>