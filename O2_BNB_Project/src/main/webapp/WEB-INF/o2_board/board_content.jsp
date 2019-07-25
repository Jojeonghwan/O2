<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 시작 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- datepicker start -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datetimepickerstyle.css" />
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>
<!-- datepicker 끝 -->
<<<<<<< HEAD

=======
>>>>>>> 6c40d5c98c3c9d61a21e495fe1d2695e6e7345c7

<style>
table{
border:1px inset gray;
}
tr,td{
border:1px inset gray;
}
</style>
</head>
<body>
<br>
<hr>

<form action="content.do">
<!-- 방소개 창 시작 -->
<img src="../image/${scrap_path}" class="scrap" style="width: 30px; height: 30px;">
<input type="hidden" name="sc_num" id="scrap_n" value="${sc_num}">
<table>
<tr>
<td>
사진:
</td>
<td>
<c:if test="${dto.img!='noimage'}">
   <c:forTokens var="myimg" items="${dto.img}" delims=",">
      <a href="../save/${myimg}" target="_new"> <img
         src="../save/${myimg}" style="width: 400px;"
         class="img-thumbnail"></a>
      <!-- img-thumbnail,img-circle,img-rounded -->
   </c:forTokens>
</c:if>
</td>
</tr>
<tr>
<td>
숙소명:
</td>
<td>
${dto.home_name}
</td>
</tr>
<tr>
<td>
호스트 이름:
</td>
<td>
${dto.host_name}
</td>
</tr>
<tr>
</tr>

<tr>
<td>
해시태그 :
</td>
<td>
${dto.tag}
</td>
</tr>
<tr>
<td>
소개 :
</td>
<td>
${dto.intro}
</td>
</tr>
<tr>
<td>
구비 품목 :
</td>
<td>
${dto.facilities}
</td>
</tr>
<tr>
<td>
입실 날짜 ~ 퇴실 날짜
</td>
<td>
<div class="form-group">
    <div class="col-sm-9">
       <div class='col-sm-5'>
            <div class="form-group">
                <div class='input-group date dateTimePicker' id="datepicker1">
                    <input type='text' placeholder="Checkin" class="form-control" name="checkin" required="required" autocomplete="off"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
        <div class='col-sm-2'>
            <h4 align="center"><b>~</b></h4>
        </div>
        <div class='col-sm-5'>
            <div class="form-group">
                <div class='input-group date dateTimePicker' id="datepicker2">
                    <input type='text' placeholder="Checkout" class="form-control" name="checkout" required="required" autocomplete="off"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
</td>
</tr>
<tr>
<td>
인원:
</td>
<td>
      <button type="button" id="dec">-</button>
      <input id="people" name="person" type="text" value="1">
      <button type="button" id="inc">+</button>
</td>
</tr>
<tr>
<td>
가격
</td>
<td>
${dto.price}
</td>
</tr>
<tr>
<td>
결제 타입 :
</td>
<td>
계좌이체<input type="radio" id="pay" name="pay" value="3">
&nbsp;&nbsp;&nbsp;&nbsp;
카드결제<input type="radio" id="pay" name="pay" value="2">
<br>
<a id="paybtn" ><!-- href="javascript:popup()" -->결제</a>
<script>
$("#paybtn").click(function(){
 if($("input[name='checkin']").val()=="" && $("input[name='checkout']").val()==""){
		alert("날짜를 입력해주세요");	
	}else{
		popup();
	}
});
</script>
</td>
</table>
<!-- 방 소개 창 끝 -->
</form>
<input type="button" value="test" id="test">
<input type="button" value="호스트랑 채팅하기" id="chat">
<!-- hidden -->
<input type="hidden" value="${sessionScope.login_id }" id="login_id">



<!-- review 출력 ////////////////////////////-->
<div id="board_review">
	<c:import url="/board/board_review.do" charEncoding="utf-8">
		<c:param name="num" value="${dto.num}" />
	</c:import>
</div>
<!-- review 출력끝//////////////////////////// -->

</body>
<script>
var getDateArray = function(start, end) {
    var arr = new Array();
    var dt = new Date(start);
    while (dt < end) {
    	arr.push(new Date(dt));
        dt.setDate(dt.getDate() + 1);
    }
    return arr;
}
var dateArr = []
</script>
<c:forEach var="list" items="${list}">
${list.checkin} ${list.checkout}
<script>
var startDate = new Date("${list.checkin}"); //YYYY-MM-DD
var endDate = new Date("${list.checkout}"); //YYYY-MM-DD

dateArr = dateArr.concat(getDateArray(startDate, endDate));


</script>
</c:forEach>
<script>
//person start
$("#inc").click(function(){
	if(parseInt($('#people').val())<'${dto.person}')
	{
		$("#people").val(parseInt($('#people').val())+1);
	}
	});
$("#dec").click(function(){
	if(parseInt($('#people').val())>1)
	{
		$("#people").val(parseInt($('#people').val())-1);
	}
	});
$("#person").val($('#people').val()); 

//person end
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
//daterangepicker start
/* 	var today = new Date(); 
	var dd = today.getDate(); 
	var mm = today.getMonth()+1; //January is 0! 
	var yyyy = today.getFullYear(); 
	if(dd<10){ dd='0'+dd } 
	if(mm<10){ mm='0'+mm } 
	var today = mm+'/'+dd+'/'+yyyy;
	function getFormatDate(d){
	    return d.getMonth()+12 + '/' + d.getDate() + '/' + d.getFullYear()
	}
	var reserve_date="";
	  $('input[name="daterange"]').daterangepicker({
	    opens: 'left'
	    
	  }, function(start, end, label) {
	    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
	  });
	  $(document).ready(function() {
		  mdTemp = new Date(),
		  maxDate = getFormatDate(new Date(mdTemp.setDate(mdTemp.getDate() + 365)));
		$('input[name="daterange"]').daterangepicker({ 
			minDate: today,
			maxDate: maxDate
			});
	  });
		  */
//daterangepicker end

//pay start
$(document).ready(function(){
	$("#paybtn").hide();
});

function popup(){
	
	var checkin=$("input[name='checkin']").val();
	var checkout=$("input[name='checkout']").val();
	var person=$('input[name="person"]').val();
	var pay_type=$("input:radio[name=pay]:checked").val();
    var url="pay_popup.do?num="+${dto.num}+"&checkin="+checkin+"&checkout="+checkout+"&pay_type="+pay_type+"&person="+person+"&id=${sessionScope.login_id}";
    var option="width=500, height=700, top=200 left=800"
    window.open(url, "", option);

}
$("input[name='pay']").click(function(){
	if($("input:radio[name=pay]:checked").val()=="3"){
		$("#paybtn").show();
	}else if($("input:radio[name=pay]:checked").val()=="2"){
		$("#paybtn").show();
	}
})

$(".scrap").click(function() {
		var h_num = '${dto.num}';
		var sc_num = $("#scrap_n").val();
		$.ajax({
			type : "post",
			url : "../host/scrap.aj",
			data : {
				h_num : h_num,
				sc_num : sc_num
			},
			success : function(redata) {
				var sc_ch = $(redata).find("scrap_result").text();
				if(sc_ch=='1') {
					alert("스크랩이 완료 되었습니다.");
					$(".scrap").attr("src", "../image/heart_in.png");
					$("#scrap_n").val($(redata).find("sc_num").text());
				} else {
					alert("스크랩이 해제 되었습니다.");
					$(".scrap").attr("src", "../image/heart_out.png");
				}
			},
			error : function() {
				alert("에러");
			}
		});
});

$("#chat").click(function() {
	var num = '${dto.num}';
	location.href = "../chat/ch_room.do?num="+num;
});

</script>
<!-- -----------//////////////////////////////////////리뷰관련 제이쿼리/////// -->
<script type="text/javascript">
// 별점 평가
$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  var star_score =  $(this).text();
	  $("#star_score").val(star_score);
	  alert($("#star_score").val());
	  return false;
	});

//이미지 3개까지만 추가가능
$(function(){ 
	let cnt=1;
	$(document).on("click", "div.files button.btn", function(){
		cnt++;
		if(cnt>3){
			alert("이미지첨부의 최대갯수는 3개입니다");
			return false;
		}
		var s='<input type="file" name="upfile">';
		//s+='<button type="button" style="width: 60px;" class="photo_upfile">추가</button>';
		//s+='<br>';
		$("div.files").append(s);					
	});
});//여러개가 한번에 알아서 들어가는지 확인하자

// 리뷰목록불러오는 함수
function listReview(){
	var num = '${dto.num}';
	$.ajax({
		type : 'post',
		url : '/board/review_list.do',
		data : {"num" : num },
		dataType: 'json',
		async: false,
		success : function(list){
			$("#review_here").html(list);
		}
		
	});
}

//페이지 로딩시 댓글 목록 출력 
$(document).ready(function(){
	listReview(); 
});

//리뷰 등록
$(function() { 
	$("#insert_btn").on("click", function(){ //댓글 등록 버튼 클릭시 
		var form = new FormData(document.getElementById('uploadForm'));
		var num = '${dto.num}';
	    $.ajax({
		      url: "review_insert.do", //컨트롤러 URL
		      data: form,
		      dataType: 'json',
		      processData: false,
		      contentType: false,
		      type: 'POST',
		      success: function (response) {		   
		    	  alert("success");
		    	  console.log(response);
		    	  location.reload();
		      },error: function (jqXHR) {
		    	  alert(jqXHR.responseText);
		      }
	   });
	});	
});

//리뷰 삭제
$(function() { 
	$(".btn_delete").on("click", function(){ //댓글 삭제 버튼 클릭시 
		var r_num = $(this).attr('r_num');
	
	    $.ajax({
		      url: "review_delete.do", //컨트롤러 URL
		      data: {"r_num":r_num },	
		      dataType: 'json',
		      type: 'POST',
		      success: function (a,b,c) {		   
		    	  alert("삭제 success");
		    	  location.reload();
		      },error: function (jqXHR) {
		    	  alert(jqXHR.responseText);
		      }
	   }); 
	   
	});
	
});

</script>
</html>