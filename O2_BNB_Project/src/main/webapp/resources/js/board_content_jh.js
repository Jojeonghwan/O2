//datepicker start
// 부트스트랩 datetimepicker 셋팅과 두개씩 링크
    // minDate : 오늘 이후의 날짜값만 셋팅될 수 있도록
 $(document).ready(function(){
    $('.dateTimePicker').datetimepicker({
 		format:"YYYY-MM-DD",
 		minDate : moment(),
        useCurrent: false,
        disabledDates: dateArr
    });
     $('.dateTimePicker input[type="text"]').focus(function(){
    	$(this).parent().data("DateTimePicker").show();
    }) ; 

    $("#datepicker1").on("dp.change", function (e) {
        $('#datepicker2').data("DateTimePicker").minDate(e.date.add(1, 'days'));
    });
   
    $("#datepicker2").on("dp.change", function (e) {
        $('#datepicker1').data("DateTimePicker").maxDate(e.date.add(-1, 'days'));
    });
}); 
//datepicker end
 

//pay start
$(document).ready(function(){
	$("#paybtn").hide();
});
$("input[name='pay']").click(function(){
	if($("input:radio[name=pay]:checked").val()=="3"){
		$("#paybtn").show();
	}else if($("input:radio[name=pay]:checked").val()=="2"){
		$("#paybtn").show();
	}
})

//pay end
