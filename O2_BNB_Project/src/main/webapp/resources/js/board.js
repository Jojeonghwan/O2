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