$(function() {
	$("#dialog").hide();
	
	if($("#result").val()=="2") {
		alert("죄송합니다. 입력하신 이메일에 해당하는 계정이 없습니다.\n"
			+ "이메일을 다시 입력해주시길 바랍니다.");
	}
	
	$("#all_ch").click(function() {
		var all_ch = $(this).is(":checked");
		if(!all_ch) {
			 $('input:checkbox[name="del_nums"]').each(function() {
			      this.checked = false;
			 });
		} else {
			 $('input:checkbox[name="del_nums"]').each(function() {
			      this.checked = true;
			 });
		}
	});
	
	$("#Del").click(function() {
		var ch = confirm("스크랩 게시물을 삭제하시겠습니까?");
		
		if(ch) {
			var num = "";
			var currentPage = $("#currentPage").val();
			$('input:checkbox[name="del_nums"]').each(function(index, item) {
				var num_ch = $(item).is(":checked");
				if(num_ch) {
					num += $(item).attr("sc_num") + ",";
				}
			 });
			location.href = "scrap_delete.do?del_nums=" + num + "&pageNum="+currentPage;
		}
		
	});
	
	$("#Del").hover(function() {
		$(this).css({
			"background-color" : "#ff5a5f",
			"color" : "white"
		});
	}, function() {
		$(this).css({
			"background-color" : "white",
			"color" : "#484848"
		});
	});
	
	$(".home_info").click(function() {
		var h_num = $(this).attr("h_num");
		location.href = "../board/content.do?num="+h_num;
	});
	
	$("#ch_list").click(function() {
		location.href = "../chat/ch_con.do";
	});
	
	$(".subject").hover(function(event) {
		var src = $(this).attr("scrap_list_img");
		$( "#dialog img" ).attr("src", "../save/"+src);
		$( "#dialog" ).css({
			"position" : "absolute",
			"top" : event.pageY+"px",
			"left" : event.pageX+5+"px"
		});
		$( "#dialog" ).show();
	}, function() {
		$("#dialog").hide();
	});
	
/*	$("#all_header_img").click(function() {
    	location.href = "../index.jsp";
    });
    
	$("#title").click(function() {
    	location.href = "../index.jsp";
    });*/
	
	$("#all_header_div").click(function() {
    	location.href = "../index.jsp";
    });
});