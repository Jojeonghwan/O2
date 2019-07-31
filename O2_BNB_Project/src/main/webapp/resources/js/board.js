$(function() {
	$(".send_ticket").click(function() {
		var num = $(this).attr("num");
		$.ajax({
			type : "post",
			url : "ticket_send.aj",
			data : {
				num : num
			},
			dataType : "xml",
			success : function(redata) {
				var ch = $(redata).find("result").text();
				if(ch=='1') {
					alert("메일로 예약 정보가 발송되었습니다.");
				}
			},
			error : function() {
				alert("에러");
			}
		});
	});
});


// board list에서 로그인했으면 content.do로 아니면 login.do로 보내기
$(function(){
	$(".loginConfirm").click(function(){
		 var name = $('input[name=login_id]').val();
//		 var num = $('input[name=h_num]').val();
		 var num = $(this).attr("h_num");
		  if ( name == "") {
		   alert("로그인을 해주세요. 확인을 누르시면 로그인페이지로 이동합니다");
		   location.href="../member/login.do";
		  }else{
			  location.href="../board/content.do?num="+num;
		  }
	});
});
