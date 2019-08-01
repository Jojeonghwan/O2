


$(function() {
	$(".qna_content").click(function() {
		var num = $(this).attr("num");
		var pageNum = $(this).attr("pageNum");
		location.href= "qna_content.do?num="+num+"&pageNum="+pageNum;
	});
});

function qnaInsertCheckform(){
	if($("#q_select option:selected").val() == 0){
		alert("주제를 선택해주세요");
		return false;
	}
}

