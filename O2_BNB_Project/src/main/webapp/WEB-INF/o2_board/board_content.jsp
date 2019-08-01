<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap&subset=korean" rel="stylesheet">

<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.js">
</script>
<script type="text/javascript" src="../js/review.js"></script>
<script type="text/javascript" src="../js/board.js"></script>
<link rel="stylesheet" href="../css/review_sy.css">
<link rel="stylesheet" href="../css/board_sy.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400&display=swap&subset=korean" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datetimepickerstyle.css"/>

<!-- datepicker 끝 -->

</head>
<body>

<c:import url="/all_header.do"/>

<form action="content.do">
<div class="container margin_60">
	<h4 class="my-4 font">
		O2bnb에서 즐거운 여행을 만나세요!
	</h4>
	
<hr class="my-4">
	<div class="form-group">
		<c:if test="${dto.img!='noimage'}">
		   <c:forTokens var="myimg" items="${dto.img}" delims=",">
		      <a href="../save/${myimg}" target="_new"> 
		      	<img src="../save/${myimg}" style="width: 400px;" class="img-thumbnail">
		      </a>
		      <!-- img-thumbnail,img-circle,img-rounded -->
		   </c:forTokens>
		</c:if>
	</div>
<hr class="my-4">
	<div class="row"><!-- row 시작 -->
		<div class="col-sm-6 col-sm-6 form-group"><!-- 열 1 -->
			<div class="form-group">
				<h2 class="font">${dto.home_name}
					<img src="../image/${scrap_path}" class="scrap mr-3" style="width: 30px; height: 30px;">		
				</h2>
			</div>
			<div class="form-group font">
				<c:set var="addr" value="${dto.addr}" />
				${fn:split(addr,'/')[1]}
			</div>
			<div class="form-group font">
				<label>${dto.host_name}</label>
				<c:if test="${login_id != dto.id}">
				<input type="button" class="btn btn-light" value="채팅하기" id="chat">
				</c:if>
			</div>
			<div class="form-group font">
				<div>${dto.intro}</div>
				<div>
					<c:forTokens var="tag" items="${dto.tag}" delims="/">		
						<pre class="font" style="color: gray;">${tag}</pre> &nbsp;&nbsp;&nbsp;
					</c:forTokens>
				</div>
			</div>
			<div class="form-group font">
				<div class="boldweight">구비품목</div>
				<div class="light">${dto.facilities}
				${dto.sub_facilities}</div>
			</div>
			<div class="form-group font">
				<c:forTokens var="sub_tag" items="${dto.sub_tag}" delims="/">		
					${sub_tag} &nbsp;&nbsp;&nbsp;
				</c:forTokens>
			</div>
		</div><!-- left 끝  -->
		<c:if test="${sessionScope.user_type==1}">
		<div class="col-sm-6 col-sm-6 form-group back"><!-- 열 2 -->
		<br>
			<div class="form-group">
				<!-- datePicker -->
				<div class="form-group">
		            <div class="form-group font">
		                <div class='input-group date dateTimePicker' id="datepicker1">
		              	  	<label class="font mb-3">체크인</label>
		              	  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    <input type='text' placeholder="Checkin" class="form-control check" style="width:100px;" name="checkin" required="required" autocomplete="off"/>
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
		            </div>
	                <div class='input-group date dateTimePicker font' id="datepicker2">
	                	<label class="font mb-3">체크아웃</label>
	                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <input type='text' placeholder="Checkout" class="form-control check" style="width:100px;" name="checkout" required="required" autocomplete="off"/>
	                    <span class="input-group-addon">
	                        <span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
				</div>
			</div>
			<!-- 인원 -->
			 <div class="form-group font my-4">
			 	인원수  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 	<select id="people" class="font" style="width:100px; height:25px; border-radius:3px; ">
			 		<option value="1" class="font">1명</option>
			 		<option value="2" class="font">2명</option>
			 		<option value="3" class="font">3명</option>
			 		<option value="4" class="font">4명</option>
			 		<option value="5" class="font">5명</option>
			 		<option value="6" class="font">6명</option>
			 	</select>
			 </div>
			 <div class="form-group font">
					<br><b>결제방법</b>
				<br>
					계좌이체&nbsp;&nbsp;<input type="radio" id="pay" name="pay" value="3">
					&nbsp;&nbsp;&nbsp;&nbsp;
					카드결제&nbsp;&nbsp;<input type="radio" id="pay" name="pay" value="2">
					<a id="paybtn">
					<!-- href="javascript:popup()" -->
					결제</a>
			</div>
			<div class="form-group" style="margin-bottom: 0;">
				<span class="contentprice">
				 가격   ${dto.price} 
				 </span>
			</div>
		</div>
		</c:if>
	</div>
</div>
<hr>

<!-- hidden -->
<input type="hidden" name="sc_num" id="scrap_n" value="${sc_num}">
<input type="hidden" value="${sessionScope.login_id }" id="login_id">
<script>
$("#paybtn").click(function(){
 if($("input[name='checkin']").val()=="" && $("input[name='checkout']").val()==""){
		alert("날짜를 입력해주세요");	
	}else{
		popup();
	}
});
</script>

</form>



<!-- review 출력 ////////////////////////////-->
<div id="board_review">
	<c:import url="/board/board_review.do" charEncoding="utf-8">
		<c:param name="num" value="${num}"/>
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
<script>
var startDate = new Date("${list.checkin}"); //YYYY-MM-DD
var endDate = new Date("${list.checkout}"); //YYYY-MM-DD

dateArr = dateArr.concat(getDateArray(startDate, endDate));


</script>
</c:forEach>
<script type="text/javascript">
//datepicker start
//부트스트랩 datetimepicker 셋팅과 두개씩 링크
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

function popup(){
	
	var checkin=$("input[name='checkin']").val();
	var checkout=$("input[name='checkout']").val();
	var person=$("#people option:selected").val();
	var pay_type=$("input:radio[name=pay]:checked").val();
    var url="pay_popup.do?num="+${dto.num}+"&checkin="+checkin+"&checkout="+checkout+"&pay_type="+pay_type+"&person="+person+"&id=${sessionScope.login_id}";
    var option="width=500, height=350, top=200 left=800"
    window.open(url, "", option);

}
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
					$(".scrap").attr("src", "../image/heart_in.png");
					$("#scrap_n").val($(redata).find("sc_num").text());
				} else {
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


</html>