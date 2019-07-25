$(function() {
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
		var num = "";
		var currentPage = $("#currentPage").val();
		$('input:checkbox[name="del_nums"]').each(function(index, item) {
			var num_ch = $(item).is(":checked");
			if(num_ch) {
				num += $(item).attr("sc_num") + ",";
			}
		 });
		location.href = "scrap_delete.do?del_nums=" + num + "&pageNum="+currentPage;
	});
	
	$(".home_info").click(function() {
		var h_num = $(this).attr("h_num");
		location.href = "../board/content.do?num="+h_num;
	});
	
	$("#ch_list").click(function() {
		location.href = "../chat/ch_con.do";
	});
});