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
<%-- <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.js">
</script> --%>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js">
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datetimepickerstyle.css" />
<!-- datepicker start -->
</head>
<body>
<!-- 숙소 검색후 집 리스트로 이동  -->
<form action="board/list.do">
	<input type="text" name="addr" placeholder="지역" style="height:30px;"/>
	<div class="form-group">
    <br><br><br>
    <div class="col-sm-9">
       <div class='col-sm-5'>
            <div class="form-group">
                <div class='input-group date dateTimePicker' id="datepicker1">
                    <input type='text' class="form-control" placeholder="CheckIn" name="checkin" required="required" autocomplete="off"/>
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
                    <input type='text' class="form-control" placeholder="CheckOut" name="checkout" required="required" autocomplete="off"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
<br><br>
<button type="button" id="dec">-</button>
<input id="person" name="person" type="text" value="1">
<button type="button" id="inc">+</button>
<br><br>
	<!-- startday('YYYY-MM-DD')+" "+endday('YYYY-MM-DD') 이런 형식으로 저장 띄어쓰기로 구분자이다. -->
	<input type="hidden" name="from_main" value="1"> 
	<input type="submit" value="숙소 검색">
</form>
<div>
해시태그 
<br>
<input type="button" name="tag" value="가족과 함께" onclick="location.href='main/tag.do?tag=가족과 함께'">
<input type="button" name="tag" value="계곡" onclick="location.href='main/tag.do?tag=계곡'">
<input type="button" name="tag" value="친구와 함께" onclick="location.href='main/tag.do?tag=친구와 함께'">
<input type="button" name="tag" value="야경이 좋은" onclick="location.href='main/tag.do?tag=야경이 좋은'">
<input type="button" name="tag" value="힐링하기 좋은" onclick="location.href='main/tag.do?tag=힐링하기 좋은'">
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
$("#inc").click(function(){
	if(parseInt($('#person').val())<6)
	{
		$("#person").val(parseInt($('#person').val())+1);
	}
	});
$("#dec").click(function(){
	if(parseInt($('#person').val())>1)
	{
		$("#person").val(parseInt($('#person').val())-1);
	}
	});
//person end
</script>

</body>
</html>
