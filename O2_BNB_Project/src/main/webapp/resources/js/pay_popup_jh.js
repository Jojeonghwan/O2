function numberMaxLength(e){
    if(e.value.length > e.maxLength){
        e.value = e.value.slice(0, e.maxLength);
    }
}

/*var checkin='${dto.checkin}';
var checkout='${checkout}';
$("input[name='checkin']").val(checkin);
$("input[name='checkout']").val(checkout);*/
$("#payment").click(function(){
	if($("#canum1").val()==null || $("#canum1").val()==""){
		alert("카드번호를 입력해주세요");
		return false;
	}
	else if($("#canum2").val()==null || $("#canum2").val()==""){
		alert("카드번호를 입력해주세요");
		return false;
	}
	else if($("#canum3").val()==null || $("#canum3").val()==""){
		alert("카드번호를 입력해주세요");
		return false;
	}
	else if($("#canum4").val()==null || $("#canum4").val()==""){
		alert("카드번호를 입력해주세요");
		return false;
	}
	else if($("#cvs").val()==null || $("#cvs").val()==""){
		alert("cvs를 입력해주세요");
		return false;
	}
	else if($("#pass").val()==null || $("#pass").val()==""){
		alert("비밀번호를 입력해주세요.");
		return false;
	}else{
	doPay();
	}
});
function doPay(){
	var formData = new FormData($('#payForm')[0]);
	
    $.ajax({
    	type : "post",
    	url : "pay_save.aj",
    	dataType: "json",
        processData: false,
        contentType: false,
    	data: formData,
    	success: function(a,b,c){
    		alert("결제가 진행되고 있습니다");
    		 window.opener.document.location.href ='/O2_BNB_Project/board/pay_result.do';
        		window.close();
    	}
    });
}