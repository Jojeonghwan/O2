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
<script type="text/javascript" src="../js/review.js"></script>
<link rel="stylesheet" href="../css/review_sy.css">
<!-- datepicker 끝 -->

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
${dto.home_name}(${dto.num})
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
<c:if test="${login_id != dto.id}">
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
</tr>
</c:if>
</table>
<!-- 방 소개 창 끝 -->
</form>
<c:if test="${login_id != dto.id}">
<input type="button" value="test" id="test">
<input type="button" value="호스트랑 채팅하기" id="chat">
</c:if>
<!-- hidden -->
<input type="hidden" value="${sessionScope.login_id }" id="login_id">



<!-- review 출력 ////////////////////////////-->
<div id="board_review">
	<c:import url="/board/board_review.do" charEncoding="utf-8">
		<c:param name="num" value="${dto.num}"/>
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
<script src="${pageContext.request.contextPath}/js/board_content_jh.js"></script>
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
function popup(){
	
	var checkin=$("input[name='checkin']").val();
	var checkout=$("input[name='checkout']").val();
	var person=$('input[name="person"]').val();
	var pay_type=$("input:radio[name=pay]:checked").val();
    var url="pay_popup.do?num="+${dto.num}+"&checkin="+checkin+"&checkout="+checkout+"&pay_type="+pay_type+"&person="+person+"&id=${sessionScope.login_id}";
    var option="width=500, height=700, top=200 left=800"
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