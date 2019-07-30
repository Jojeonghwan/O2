$(function() {
	$(".cancel").click(function() {
		var h_num = $(this).attr("h_num");
		var checkin =$(this).attr("checkin")
		var checkout = $(this).attr("checkout");
		var guest_email = $(this).attr("guest_email");
		var guest_name = $(this).attr("guest_name");
		var reserveday = $(this).attr("reserveday");
		$.ajax({
			type : "post",
			url : "cancel.aj",
			data : {
				h_num : h_num,
				checkin : checkin,
				checkout : checkout,
				guest_email : guest_email,
				guest_name : guest_name,
				reserveday : reserveday
			},
			dataType : "xml",
			success : function(redata) {
				var ch = $(redata).find("result").text();
				if(ch=='1') {
					alert("예약 취소가 완료되었습니다.");
					location.reload();
				}
			},
			error : function() {
				alert("에러");
			}
		});
	});
});