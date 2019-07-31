/**
 * 
 */
/**
 * 
 */
$(function(){
		// 회원가입 비밀번호 확인
		$("#mypass2").change(function(){
			if($("#mypass1").val() != $("#mypass2").val() ){
				$("#span1").css("color","red");
				$("#span1").text("비밀번호를 확인해주세요");
				$("#mypass2").val("");
				$("#mypass2").focus();
				$("#passright").val("2"); // 비번 두개 일치하면 1
				}
			else{
				$("#span1").css("color","gray");
				$("#span1").text("비밀번호 확인완료");
				$("#passright").val("1"); // 비번 두개 일치하면 1
				$("passChange").val("0"); // 비번바꾸고 일치하면 0, 아니면 1
			}
		});
		
		// 회원가입 중복아이디 확인
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
					}else{
						$("#span2").css("color", "gray");
						$("#span2").html("사용할 수 있는 아이디입니다");
						$("#idright").val("1");					//중복아이디 아니면 1
					}
				}
			});
		});
		
		// 회원가입 메일주소 셀렉트
		$("#mailurl").change(function(){
			var mail1 = $("#mail1").val();
			var mail2 = $("#mailurl option:selected").val();
			var email = mail1 + mail2 ; 
			$("#mail1").val(email);				// email주소에 메일주소 합쳐짐
		});
		
		
		// 회원가입 이메일 인증
		$("#ismail").click(function(){
			var mail1 = $("#mail1").val();
			var btn1 = "";
			var btn2 = "";
			$.ajax({
				type : 'post',
				url : 'mail_confirm.aj',
				data : {'mail1' : mail1},
				dataType : 'xml',
				success: function(redata){
					var mailcnt = $(redata).find("mailcnt").text();	// 중복된 메일 있으면 1 반환
					if (mailcnt == 1){
						alert("중복된 이메일이 있습니다");						
					}else{
						var mailfail = $(redata).find("send").text();	// 중복메일 없을 경우 메일발송
						if(mailfail == 1){
							alert("메일발송실패 : 메일주소를 확인해주세요");
						}else{
							var result = $(redata).find("encryption").text();	// 메일발송 후 암호 받아오기
							btn1 += "<input type='text' size='10' placeholder='이메일 인증번호' class='confirm_text form-control' style='width: 223px;'>";
							btn1 += "<input type='hidden' class='encryption' value='"+ result +"'>"
							btn2 = "<button type='button' class='confirm_btn' style='width: 110px;'>이메일 인증</button>";
							
							$("#span3").html(btn1);
							$("#span4").html(btn2);
							$("#mailsend_con").val("2");	// 메일주소 인증했는지 확인 2
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
		
		// 이메일 변경했을 때 1
		$("#mail1").change(function(){
			$("input[name=mailsend_con]").val("1");
		});
		

		
		// 비번 변경했을 때 1
		$("#mypass1").change(function(){
			$("#passChange").val("1");
			//alert($("#passChange").val());
		});
		
});///////////$(function 끝

	
///////////////////////////////// 회원가입 onsubmit 유효성검사
	 function member_sign_checkform(check){
		 
		 // 아이디 중복ID확인 했는지 여부
		 // 중복 아니면 idright=1
		 if( $("#idright").val() == "2"){
			 alert("아이디 중복확인 버튼을 눌러주세요");
			 return false;
		 }
		 
		
		// 비밀번호에 숫자 특수문자 영어로 유효성 검사  비밀번호의 수는 6~12
		var pwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;
	    if(!pwCheck.test(check.password.value))
	    {
	        alert("비밀번호는 영어,숫자,특수문자 조합으로 해주세요.(글자수는 6~12)");
	        check.password.focus();
	        return false;
	    }
	    // 비밀번호 1,2 일치 확인
	    if( $("#passright").val() =="2" ){
    		alert("비밀번호 확인란까지 입력해주세요");
    		return false;
    	}
	    
		  
	    //휴대폰 번호 유효성 검사 
	    var phoneCheck = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
	    if(!phoneCheck.test(check.tel.value))
	    {
	        alert("전화번호 형식에 맞지 않습니다 ");
	        check.tel.focus();
	        return false;
	    }
	    
	    //이메일 형식에 맞는지 검사 
	    var emailCheck= /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	    if(!emailCheck.test(check.email.value))
	    {
	        alert("이메일 형식에 맞지 않습니다 ")
	        check.email.focus();
	        return false;
	    }

		//이메일주소 변경 시 이메일인증했는지 여부
	    var mailsendCheck = /1/;
		if(mailsendCheck.test(check.mailsend_con.value)){
			alert("이메일을 인증해주세요");
			return false;
		}
	    
		else
			return true;

	} 
	 
/////////////////////////////////////// update_pass	 
	// update_pass 유효성 검사
	 function update_pass_checkform(){
	 	
		 var mypass = $("#pass1").val();
			console.log(mypass);
			$.ajax({
				type: 'post',
				url : "passright.do",//갑자기 주소 앞에 / 넣으니까 alert이 뜬다?
				data : {"mypass":mypass},
				dataType : 'json',
				async: false,
				success: function(right){
					$("#samepass").val(right);
				},error: function(jqXHR){
					alert(jqXHR.responseText);
				}
			});
			
			if($("#samepass").val() == "2"){
				alert("비번을 확인하세요");
				return false;
			}

	 }

	 /////////////////////////////update_member
	 
function update_checkform(check){
	
	// 비밀번호 입력 시 1,2 확인해서 비밀번호 수정
	// 비밀번호 입력 시에만 실행되게 sql문 수정
	if( $("#mypass1").val() != ""){
		// 비밀번호에 숫자 특수문자 영어로 유효성 검사  비밀번호의 수는 6~12
		var pwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;
	    if(!pwCheck.test(check.password.value))
	    {
	        alert("비밀번호는 영어,숫자,특수문자 조합으로 해주세요.(글자수는 6~12)");
	        check.password.focus();
	        return false;
	    }else{	// 비밀번호 형식 통과 시
	    	// mypass1과 mypass2 비교(같으면 passright이 1)
			// 비밀번호 일치시에만 가능
	    	if( $("#passright").val() =="2" ){
	    		alert("비밀번호 수정 시에는 비밀번호 확인란까지 입력해주세요");
	    		return false;
	    	}
	    }
	}// 비밀번호 입력 시 비밀번호 수정 끝
	
	//이메일 형식에 맞는지 검사 
	var emailCheck= /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    if(!emailCheck.test(check.email.value))
    {
        alert("이메일 형식에 맞지 않습니다 ");
        check.email.focus();
        return false;
    }
    
	//이메일주소 변경 시 이메일인증했는지 여부
    var mailsendCheck = /1/;
	if(mailsendCheck.test(check.mailsend_con.value)){
		alert("이메일을 인증해주세요");
		return false;
	}
	
/*	var passchangeCheck = $("passChange").val(); // 비번 바꾸면1, 비번둘다일치하면 0
	//var passrightConfirm = $("#passright").val(); // 1이면 일치
	var mailsendConfirm = $("#mailsend_con").val(); // 이메일인증완료 2
	if( passchangeCheck=="0" && mailsendConfirm=="2" ){
		return true;
	}else{
		return false;
	}*/
	
	 if(check.id=='m_update_action'){
	        alert("정보가 수정되었습니다");
	        return true;
	        location.href('m_update_action.do');
	    }
	 
	 
}
	 
