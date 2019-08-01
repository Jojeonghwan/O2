<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- datepicker start -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
​<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap&subset=korean" rel="stylesheet">

<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js">
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datetimepickerstyle.css" />
<!-- datepicker start -->
<style>
.search_box{
		width:300px;
		height:45px;
	}
input[name*="tag"]{
		height:40px;
		font-size:13pt;
		border-radius:30px;
		background-color: rgba( 255, 90, 95, 0.7 );
}
.font{
color: white;
font-family: 'Noto Sans KR', sans-serif;
}
.font_black{
font-family: 'Noto Sans KR', sans-serif;
}
.icon{
width: 40px;
height: 40px;
}
</style>
</head>
<body>
<!-- 숙소 검색후 집 리스트로 이동  -->
<form action="board/list.do" class="form-inline">
	<div class="form-group">
		<input type="text" name="addr" placeholder="Location" style="width:300px; height:45px;" class="form-control search_box font_black" />
	</div>
	<div class="form-group">
		<div class='input-group date dateTimePicker' id="datepicker1">
			<input type='text' class="form-control font_black" style="width:150px; height:45px;" placeholder="CheckIn" name="checkin" autocomplete="off" />
			<span class="input-group-addon" style="color:#ff5a5f;">
				<span class="glyphicon glyphicon-calendar" ></span>
			</span>
		</div>
	</div>
	<div class="form-group">
		<div class='input-group date dateTimePicker' id="datepicker2">
			<input type='text' class="form-control font_black" style="width:150px; height:45px;" placeholder="CheckOut" name="checkout" autocomplete="off"/>
			<span class="input-group-addon" style="color:#ff5a5f;">
				<span class="glyphicon glyphicon-calendar" ></span>
			</span>
		</div>
	 </div>
	 <div class="form-group">
	 	<select id="people" class="font_black" style="width:100px; height:45px; border-radius:3px; ">
	 		<option value="1" class="font_black">1명</option>
	 		<option value="2" class="font_black">2명</option>
	 		<option value="3" class="font_black">3명</option>
	 		<option value="4" class="font_black">4명</option>
	 		<option value="5" class="font_black">5명</option>
	 		<option value="6" class="font_black">6명</option>
	 	</select>
	 </div>
	<!-- <div class="form-group">
		<input type=button id="dec" class="minus"></button>
	</div>
	<div class="form-group">
		<input id="person" name="person" type="text search_box" value="1" class="form-control" readonly="readonly" style="width:100px; height:30px;">
	</div>
	<div class="form-group">
		<input type="button" id="inc" class="plus"></button>
	</div> -->
	<!-- startday('YYYY-MM-DD')+" "+endday('YYYY-MM-DD') 이런 형식으로 저장 띄어쓰기로 구분자이다. -->
	<input type="hidden" name="from_main" value="1"> 
	<input type="hidden" id="person" name="person" value="">
	<div class="form-group">
		<input type="image" name="submit" src="image/searchM1.png" class="icon" style="z-index: 1" value="" />
	</div>
</form>
<br>
<div>
	<label class="font" style="font-size:15pt;">추천 테마 :</label>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" name="tag" value="#가족과 함께" class="font" onclick="location.href='main/tag.do?tag=가족과 함께'">
	&nbsp;&nbsp;
	<input type="button" name="tag" value="#계곡" class="font" onclick="location.href='main/tag.do?tag=계곡'">
	&nbsp;&nbsp;
	<input type="button" name="tag" value="#친구와 함께" class="font" onclick="location.href='main/tag.do?tag=친구와 함께'">
	&nbsp;&nbsp;
	<input type="button" name="tag" value="#야경이 좋은" class="font" onclick="location.href='main/tag.do?tag=야경이 좋은'">
	&nbsp;&nbsp;
	<input type="button" name="tag" value="#힐링하기 좋은" class="font" onclick="location.href='main/tag.do?tag=힐링하기 좋은'">
</div>
<script>
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
//person start
$("#person").val($("#people option:selected").val());

</script>

</body>
</html>
