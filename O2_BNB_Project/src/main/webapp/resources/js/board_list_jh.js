//datepicker start
$(document).ready(function(){
    $('.dateTimePicker').datetimepicker({
 		format:"YYYY-MM-DD",
 		minDate : moment(),
        useCurrent: false,
        disabledDates: [new Date(2013, 11 - 1, 21)]//의미 없지만 없으면 안되는 코드
    });
     $('.dateTimePicker input[type="text"]').focus(function(){
    	$(this).parent().data("DateTimePicker").show();
    }) ; 
// 함수 호출 순서가 4,3,2 순서이다.
// 4가 바뀌어야 3이 바뀌고 3이 바뀌어야 2가 바뀐다.

$("#datepicker1").on("dp.change", function (e) {
    $('#datepicker2').data("DateTimePicker").minDate(e.date.add(1, 'days'));
});

$("#datepicker2").on("dp.change", function (e) {
    $('#datepicker1').data("DateTimePicker").maxDate(e.date.add(-1, 'days'));
});
}); 
//datepicker end

/*$("#date_val").click(function(){
	var checkin = $('.dateTimePicker input[name=checkin]').val();
	var checkout = $('.dateTimePicker input[name=checkout]').val();
	
	$("#checkin_id").val(checkin);
	$("#checkout_id").val(checkout);
	$(".col-sm-9").css("display","none");
});
*/
//datepicker end

//person start


$("#inc").click(function(){ //6까지 증가
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
		});
//person end


