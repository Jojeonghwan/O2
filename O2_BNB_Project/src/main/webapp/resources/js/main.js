$( function () {
	RealTime();
	
	setInterval(function(){
        RealTime();
    }, 10000)
	
    function RealTime() {
		// 실시간 집 순위 에이작스로 실행
	    $.ajax({
	    	type : "post",
	    	url : "main2/real_time.aj",
	    	dataType: "xml",
			success: function(data) {
				var str = "";
				var list = $(data).find("list");
				$(list).each(function(index, item) {
					if(index==0) {
						str += "<div id='rtime_dto_1' class='rtime_dtos' style='border: 1px solid black' h_num='"+$(item).find("hnum").text()+"'>";
						str += (index+1) + ". " + $(item).find("homename").text();
						str += " 평점 : "+ $(item).find("avgcore").text() + "<br><br>";
						str += "</div>";
						str += "<div class='rtime_dtos' style='border: 1px solid black'>";
					} else {
						str += "<div class='rtime_dto' style='border: 1px solid black' h_num='"+$(item).find("hnum").text()+"'>";
						str += (index+1) + ". " + $(item).find("homename").text();
						str += " 평점 : "+ $(item).find("avgcore").text() + "<br><br>";
						str += "</div>";
					}
				});
				str += "</div>";
				$("#result").html(str);
			}, 
			error : function(e) {
				alert("에러")
			}
	    });
	}
    
    // 실시간 순위로 불러온 각각의 데이터를 div로 묶고
    // 클릭시 해당 집 상세 페이지로 이동
    $("body").on("click", "div#result div#rtime_dto_1", function() {
    	var h_num = $(this).attr("h_num");
    	location.href = "board/content.do?num="+h_num;
    });
    $("body").on("click", "div#result div.rtime_dto", function() {
    	var h_num = $(this).attr("h_num");
    	location.href = "board/content.do?num="+h_num;
    });
});