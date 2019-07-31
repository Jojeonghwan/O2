$( function () {
	var main_adr = $("#main_addr").val();
	if(main_adr) {
		RealTime(main_adr);
	}
	
	setInterval(function(){
        RealTime(main_adr);
    }, 100000)
    
   function RealTime(adr) {
		// 실시간 집 순위 에이작스로 실행
	    $.ajax({
	    	type : "post",
	    	url : "../main2/real_time.aj",
	    	dataType: "xml",
	    	data : {
	    		addr : adr
	    	},
			success: function(data) {
				var str = "";
				var list = $(data).find("list");
				$(list).each(function(index, item) {
					str += "<div class='rtime_dto' style='border: 1px solid black' h_num='"+$(item).find("hnum").text()+"'>";
					str += (index+1) + ". " + $(item).find("homename").text();
					str += "</div>";
				});
				$("#result").html(str);
				real();
			}, 
			error : function(e) {
				alert("에러")
			}
	    });
	}
    
    // 실시간 순위로 불러온 각각의 데이터를 div로 묶고
    // 클릭시 해당 집 상세 페이지로 이동
    $("body").on("click", "div#real div.real_time", function() {
    	var h_num = $(this).attr("h_num");
    	location.href = "content.do?num="+h_num;
    });
    
    var index = 0;
    setInterval(function(){
    	real();
    }, 3000);
    
    function real() {
    	var home_info = $("div.rtime_dto:eq("+index+")").html();
    	var h_num = $("div.rtime_dto:eq("+index+")").attr("h_num");
    	var st = "<div class='real_time' h_num='"+h_num+"'>"+home_info+"</div>";
		var re = $('#real').html(st);
		
		if(index==9) {
			index = 0;
		} else {
			index++;
		}
    }
    
    $("#on_header_menu_bar").hide();
    
    $("#on_header_menu").hover(function(event) {
    	console.log(event.pageX);
    	console.log(event.pageY);
    	$("#on_header_menu_bar").css({
    		"position" : "absolute",
			"top" : "12%",
			"left" : "10%"
    	});
    	$("#on_header_menu_bar").show();
    }, function(event) {
    	event.stopPropagation();	
    	$("#on_header_menu_bar").mouseleave(function() {
    		 $("#on_header_menu_bar").hide();
    	});
    });
    
    
    
});