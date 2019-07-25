$(function() {
	/*alert($("#out_ch").val());*/
/*	if($("#out_ch").val()!='') {
		alert("사용자가 나가지 않았기 때문에 삭제가 불가능 합니다.");
	}*/
	
	$(".ch_dto").click(function() {
		var room_name = $(this).attr("room_name");
		location.href = "ch_con.do?room_name="+room_name;
	});
	
	$(".chat_exit").click(function() {
		var room_name = $(this).attr("room_name");
		//location.href = "ch_exit.do?room_name="+room_name;
		
		$.ajax({
			type : "post",
			url : "ch_exit_id.aj",
			data : {
				room_name : room_name
			},
			dataType : "json",
			success : function(data) {
				if(data == "0") {
					alert("사용자가 아직 나가지 않아 삭제가 불가능");
				} else if(data == "1") {
					location.href = "ch_exit.do?room_name="+room_name;
				}
			},
			error : function(e) {
				alert("에러");
			}
		});
	});
	
//	function ch_room_exit(room) {
//		location.href = "ch_exit.do?room_name="+room;
//	}
});