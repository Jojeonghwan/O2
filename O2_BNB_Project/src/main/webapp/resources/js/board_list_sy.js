/**
 * 
 */

$(function(){

	var adr_ch = false;
	// 주소창에 커서
	$(".search_addr").click(function(){
		event.preventDefault();
		if(!adr_ch) {
			$(".o2bnb_search").css("display","block");
			adr_ch = true;
		} else {
			$(".o2bnb_search").css("display","none");
			
			if($(".person_cnt").css("display")== "block") {
				$(".person_cnt").css("display", "none");
			}
			if($(".price").css("display")=="inline-block") {
				$(".price").css("display", "none");
			}
			if($("div.calender").css("display")=="inline-block") {
				$("div.calender").css("display","none");
			}
			if($(".theme").css("display")=="inline-block") {
			    $(".theme").css("display","none");
			}
			adr_ch = false;
		}
	});
	
	// 테마 선택
	/*$("#theme_value").click(function(){
		var test="";
		$("input:checkbox[name=theme_sel]:checked").each(function() {// checked값 반복 		
			if($(this).is(':checked'))
	            test += "|"+($(this).val());
		});
		$("#theme_id").val(test);
		$(".theme").css("display","none");
	});
	*/
	var cnt = 0;
	$(".theme_value").click(function() {
		var test=$("#tag_id").val();
		if(test=="|") {
			test += $(this).val();
		} else {
			test += "|" + $(this).val();
		}
		$("#tag_id").val(test);
	});
	
	// 인원수 
	/*$("#inc").click(function(){ //6까지 증가
		if(parseInt($('#person').val())<6)
		{
			$("#person").val(parseInt($('#person').val())+1);
		}
		});
	$("#dec").click(function(){ //1까지 감소
		if(parseInt($('#person').val())>1)
		{
			$("#person").val(parseInt($('#person').val())-1);
		}
		});
	$("#person_value").click(function(){
		var person_val= $("#person").val();
		$("#person_id").val(person_val);
		$(".person_cnt").css("display","none");
	});*/
	
	$("#people").change(function() {
		var people = $(this).val();
		$("#person_id").val(people);
	});
	
	// 가격 ionRangeSlider
	 $("#range_03").ionRangeSlider({
		 type: "double",
		 grid: true,
		 min: 0,
		 max: 300000,
		 from: 20000,
		 to: 250000,
		 postfix: "원"
	 });
	 
	 /*$("#range_value").click(function(){
		var slider = $("#range_03").data("ionRangeSlider");
		var from = slider.result.from;
		var to = slider.result.to;
		
		$("#price_from_id").val(from);
		$("#price_to_id").val(to);
		$(".price").css("display","none");
	 });*/
	 
	 $("span.from").mouseup(function() {
		 var slider = $("#range_03").data("ionRangeSlider");
		 var from = slider.result.from;
		 $("#price_from_id").val(from);
	 });
	 
	 $("span.type_last").mouseup(function() {
		 var slider = $("#range_03").data("ionRangeSlider");
		 var to = slider.result.to;
		 $("#price_to_id").val(to);
	 });
	 
	 $("#datepicker1").on("dp.change", function (e) {
	    var s = $('#datepicker2').data("DateTimePicker").minDate(e.date.add(1, 'days'));
	    var checkin = $('.dateTimePicker input[name=checkin]').val();
		$("#checkin_id").val(checkin);
		
	 });

	 $("#datepicker2").on("dp.change", function (e) {
	    $('#datepicker1').data("DateTimePicker").maxDate(e.date.add(-1, 'days'));
		var checkout = $('.dateTimePicker input[name=checkout]').val();
		$("#checkout_id").val(checkout);
	 });
});

function return_theme(){
	$(".person_cnt").css("display", "none");
	$(".price").css("display", "none");
	$("div.calender").css("display", "none");
	$(".theme").css("display", "inline-block");
}
function return_person(){
	$(".theme").css("display", "none");
	$(".price").css("display", "none");
	$("div.calender").css("display", "none");
	$(".person_cnt").css("display", "block");
}
function return_price(){
	$(".theme").css("display", "none");
	$(".person_cnt").css("display", "none");
//	$(".col-sm-9").css("display", "none");
	$("div.calender").css("display", "none");
	$(".price").css("display", "inline-block");
}
function return_date(){
	$(".person_cnt").css("display", "none");
	$(".price").css("display", "none");
	$(".theme").css("display", "none");
	/*$(".col-sm-8").css("display", "block");*/
	$("div.calender").css("display", "inline-block");
}

//////////////무한스크롤 실패/////////

//var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
//
//$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
//     getList(page);
//     page++;
//}); 
// 
//$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
//     if($(window).scrollTop() >= $(document).height() - $(window).height()){
//          getList(page);
//           page++;   
//     } 
//});
// 
//function getList(page){
//	var from_main = $("input[name=from_main]").val();
//	var person = $("input[name=person]").val();
//	var price_from = $("input[name=price_from]").val();
//	var price_to = $("input[name=price_to]").val();
//	var tag = $("input[name=tag]").val();
//	var checkin = $("input[name=checkin]").val();
//	var checkout = $("input[name=checkout]").val();
//	var end = $("input[name=end]").val();
//	var addr = $("input[name=addr]").val();
////	console.log(from_main);
////	console.log(person);
////	console.log(price_from);
////	console.log(price_to);
////	console.log(tag);
////	console.log(checkin);
////	console.log(checkout);
////	console.log(end);
////	console.log(addr);
//	
//    $.ajax({
//        type : 'POST',  
//        dataType : 'xml', 
//        data : {
//        	"from_main" : from_main,
//        	"person" : person,
//        	"price_from" : price_from,
//        	"price_to" : price_to,
//        	"tag" : tag,
//        	"checkin" : checkin,
//        	"checkout" : checkout,
//        	"end" : end,
//        	"addr" : addr
//        	},
//        url : 'infiniteDown.do',
//        success : function(returnData) {
//            var data = returnData.rows;
//            var html = "";
//            if (page==1){ //페이지가 1일경우에만 id가 list인 html을 비운다.
//                  $("#list").html(""); 
//            }
//            if (returnData.startNum<=returnData.totCnt){
//                if(data.length>0){
//                // for문을 돌면서 행을 그린다.
//                }else{
//                //데이터가 없을경우
//                }
//            }
//            html = html.replace(/%20/gi, " ");
//            if (page==1){  //페이지가 1이 아닐경우 데이터를 붙힌다.
//                $("#list").html(html); 
//            }else{
//                $("#busStopList").append(html);
//            }
//       },error:function(e){
//           if(e.status==300){
//               alert("데이터를 가져오는데 실패하였습니다.");
//           };
//       }
//    }); 
//}




