<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 시작 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<link rel="stylesheet" href="http://bootstraptema.ru/plugins/2018/irs/ion.rangeSlider.css" />
<link rel="stylesheet" href="http://bootstraptema.ru/plugins/2018/irs/ion.rangeSlider.skin.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap&subset=korean" rel="stylesheet">
<!-- datepicker start -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datetimepickerstyle.css" />
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>
<!-- datepicker 끝 -->
<!-- rangeSlide -->
<script src="http://bootstraptema.ru/plugins/2018/irs/ion.rangeSlider.min.js"></script>
<script type="text/javascript" src="../js/board_list_sy.js"></script>
<script type="text/javascript" src="../js/board.js"></script>
<link rel="stylesheet" href="../css/board_sy.css">
<style>
.font{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 500;
	font-size: 1.5rem;
}
.ellip {
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
/* .image{
	width:200px;
	height:200px;
} */
</style>
</head>
<body>
<c:import url="/on_header.do?adr=${addr}" charEncoding="utf-8"/>
<div id="board_list_search_form" style="height: 150px;">
	<form action="../board/list.do" method="post">
		<!-- 검색창 -->
		<div class="search_bar form-group" style="display: inline-block;">
			<input type="text" class="search_addr form-control" name="addr" placeholder="지역" value="${addr}" 
			style="display: inline-block; width: 350px;" size=50px; autocomplete="off"/>
			<input type="submit" value="검색" id="search_btn">
			<!-- hidden -->
			<input type="hidden" name="from_main" value="2">
			<input type="hidden" id="person_id" name="person" value="${person}">
			<input type="hidden" id="price_from_id" name="price_from" value="0">
			<input type="hidden" id="price_to_id" name="price_to" value="1000000">
			<input type="hidden" id="tag_id" name="tag" value="${tag}">
			<input type="hidden" id="checkin_id" name="checkin" value="${checkin}">
			<input type="hidden" id="checkout_id" name="checkout" value="${checkout}">
			<input type="hidden" name="end" value="${end}">
			<input type="hidden" value="${sessionScope.login_id }" name="login_id">
			<div id="search_total"></div>
		</div>
	</form>

<div class="o2bnb_search">
	<div class="o2bnb_sel">
		<span><a href="#" onclick="return_date()">날짜</a></span>&nbsp;&nbsp;
		<span><a href="#" onclick="return_theme()">테마별</a></span>&nbsp;&nbsp;
		<span><a href="#" onclick="return_person()">인원</a></span>&nbsp;&nbsp;
		<span><a href="#" onclick="return_price()">가격</a></span>
	</div>
</div>

<!-- 달력 -->
<!-- <div class="form-group">
    <div class="col-sm-8" style="display: none;">
       <div class='col-sm-3'>
            <div class="form-group">
                <div class='input-group date dateTimePicker' id="datepicker1">
                    <input type='text' class="form-control" placeholder="CheckIn" name="checkin" required="required" autocomplete="off"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
        <div class='col-sm-1'>
            <h4 align="center"><b>~</b></h4>
        </div>
        <div class='col-sm-3'>
            <div class="form-group">
                <div class='input-group date dateTimePicker' id="datepicker2">
                    <input type='text' class="form-control" placeholder="CheckOut" name="checkout" required="required" autocomplete="off"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
        <div class='col-sm-1'>
            <input type="button" id="date_val" value="저장">
        </div>
    </div>
</div> -->
<div class="form-group calender" style="display: none; padding-top: 10px;">
	<div class='input-group date dateTimePicker' id="datepicker1" style="float: left;">
		<input type='text' class="form-control" placeholder="CheckIn" name="checkin" class="checkin" required="required" autocomplete="off"/>
		<span class="input-group-addon">
		    <span class="glyphicon glyphicon-calendar"></span>
		</span>
	</div>
	<div style="float: left; margin-left: 45px; margin-right: 50px; text-align: center;
	 padding-top: 4px;">
		<b>~</b>
	</div>	
	<div class='input-group date dateTimePicker' id="datepicker2" style="float: left;">
		<input type='text' class="form-control" placeholder="CheckOut" name="checkout" class="checkout" required="required" autocomplete="off"/>
		<span class="input-group-addon">
		    <span class="glyphicon glyphicon-calendar"></span>
		</span>
	</div>
</div>

<!-- 테마 -->
<div class="theme" style="display: none; padding-top: 10px;">
	<div class="theme_sel" style="float:left;">
		<input type="checkbox" name="theme_sel" class="theme_value" value="가족과 함께">가족과 함께
		<input type="checkbox" name="theme_sel" class="theme_value" value="힐링하기 좋은">힐링하기 좋은
		<input type="checkbox" name="theme_sel" class="theme_value" value="아이와 함께">아이와 함께
		<input type="checkbox" name="theme_sel" class="theme_value" value="혼자서">혼자서
		<input type="checkbox" name="theme_sel" class="theme_value" value="경치가 좋은">경치가 좋은<br>
		<input type="checkbox" name="theme_sel" class="theme_value" value="사진찍기 좋은">사진찍기 좋은
		<input type="checkbox" name="theme_sel" class="theme_value" value="계곡">계곡
		<input type="checkbox" name="theme_sel" class="theme_value" value="드라이브">드라이브
		<input type="checkbox" name="theme_sel" class="theme_value" value="친구와 함께">친구와 함께
		<input type="checkbox" name="theme_sel" class="theme_value" value="야경이 좋은">야경이 좋은
		<!-- <input type="button" id="theme_value" value="저장"> -->
	</div>
</div>

<!-- 인원수 -->
<!-- <div class="person_cnt" >
	<button type="button" id="dec">-</button>
	<input id="person" type="text" value="1" size="10">
	<button type="button" id="inc">+</button>
	<input type="button" id="person_value" value="저장">
</div> -->
<div class="person_cnt form-group" style="padding-top: 10px; ">
 	<select id="people" class="font_black" style="width:140px; height:33px; border-radius:3px;">
 		<option value="1" class="font_black">1명</option>
 		<option value="2" class="font_black">2명</option>
 		<option value="3" class="font_black">3명</option>
 		<option value="4" class="font_black">4명</option>
 		<option value="5" class="font_black">5명</option>
 		<option value="6" class="font_black">6명</option>
 	</select>
</div>	
<!-- 가격 -->
<!-- <div class="price">
	 <div class="col-md-12">
	 <div class="form-group row">
	 <label for="range_03" class="col-sm-2 control-label"><b>Prefix</b></label>
	 <div class="col-sm-10">
	 <input type="text" id="range_03">
	 </div>
	 </div>
	 </div>
	 <input type="button" id="range_value" value="저장">
</div> -->
<div class="price" style="width: 30%; zoom: 0.9;">
	<input type="text" id="range_03">
</div>
<!-- 	
&nbsp;&nbsp;&nbsp;&nbsp;<br><br><br><br><br><br><br><br><br> -->
</div>
<!-- 출력부 %로 바꾸자-->
<div id="map" style="width:400px; height:400px; float:right; position: absolute; left: 60%; top:38%;"></div>

<div class="container" style="width: 800px; float: left; margin-left: 115px;">
<!-- style="position:absolute; top: 40%;" -->

	<div class="row">
		<c:forEach var="dto" items="${list}">
		<c:set var="ho_addr" value="${ho_addr}/${dto.addr}"/>
		<c:set var="home_name" value="${home_name},${dto.home_name}"/>
		<c:set var="price" value="${price},${dto.price}"/>
		<c:set var="num" value="${num},${dto.num}"/>
		<input type="hidden" name="h_num" value="${dto.num}"> 
		
		<div class="col-3 rounded border my-3 mx-4">
			<div class="form-group">
				<a href="#" class="font ellip loginConfirm" h_num="${dto.num}">
				<label class="font">Home_Name</label> <br>
				<b style="color: #484848;">${dto.home_name}</b>
				</a>
			</div>
			<div class="form-group">
				<c:set var="img" value="${dto.img}"/>
				<img class="image" src="../save/${fn:split(img,',')[0]}" style="width: 168px; height: 80px;">
			</div>
			<span class="price_tag" style=" border-bottom: 1px solid gray;">${dto.price}</span>
		</div>
		</c:forEach>
	</div>

<!-- 페이지 번호 출력 -->
<div style="width: 600px; text-align: center; position:absolute; top: 90%;" >
	<ul class="pagination" style="justify-content: center;"><!-- 페이징처리 부트스트랩 -->
	<c:if test="${startPage>1}">
		<li>
			<a href="list.do?pageNum=${startPage-1}">◀</a>
		</li>
		</c:if>
		<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			<c:if test="${pp==currentPage}">
				<li><a href="list.do?pageNum=${pp}&addr=${addr}&checkin=${checkin}
				&checkout=${checkout}&person=${person}&price_from=${price_from}
				&price_to=${price_to}&end=${end}&tag=${tag}&from_main=${from_main}" style="color:red;">${pp}</a></li>
			</c:if>
			<c:if test="${pp!=currentPage}">
				<li><a href="list.do?pageNum=${pp}&addr=${addr}&checkin=${checkin}
				&checkout=${checkout}&person=${person}&price_from=${price_from}
				&price_to=${price_to}&end=${end}&tag=${tag}&from_main=${from_main}" style="color:black;">${pp}</a></li>
			</c:if>
		</c:forEach>
		<c:if test="${endPage<totalPage}">
		<li>
			<a href="list.do?pageNum=${endPage+1}">▶</a>
		</li>
		</c:if>
	</ul>
</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8c8c41484005696a06aceab619299c52&libraries=services"></script>
<script type="text/javascript">
//map start

//console.log('${ho_addr}');
var searchaddr= '${ho_addr}'.substring(1).split("/");
var searchhome_name='${home_name}'.substring(1).split(",");
var searchprice='${price}'.substring(1).split(",");
var num='${num}'.substring(1).split(",");
/* console.log(num);
console.log(num[0]);
console.log(searchprice);
console.log(searchhome_name);
console.log("searchaddr:   "+searchaddr); */
var totalprice="";
for(i=0;i<searchprice.length;i++){
	totalprice= Number(totalprice)+Number(searchprice[i]);
}
avgprice=Number(totalprice)/searchprice.length;
veryveryveryhighprice=avgprice+avgprice*45/100;
veryveryhighprice=avgprice+avgprice*30/100;
veryhighprice=avgprice+avgprice*15/100;
veryveryverylowprice=avgprice-avgprice*45/100;
veryverylowprice=avgprice-avgprice*30/100;
verylowprice=avgprice-avgprice*15/100;
//console.log(avgprice);

/* console.log(searchhome_name[0]);
console.log(searchhome_name[1]);
console.log(searchaddr.length);
console.log(searchaddr[1]);
console.log(searchaddr[5]); */
var addr=new Array();
for(var i=1; i<searchaddr.length; i=i+4){
	 addr.push(searchaddr[i]);		  
}
console.log('${ho_addr}');
console.log("searchaddr0:"+searchaddr[0]);
console.log("searchaddr1:"+searchaddr[1]);
console.log("searchaddr2:"+searchaddr[2]);
console.log("searchaddr3:"+searchaddr[3]);
console.log("searchaddr4:"+searchaddr[4]);
console.log("searchaddr5:"+searchaddr[5]);
console.log("addr :    "+addr);
for(var i=0; i<searchhome_name.length; i++){
	 console.log(searchhome_name[i]);
}
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
  mapOption = {
      center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
      level: 6 // 지도의 확대 레벨
  };  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

//지도에 컨트롤을 추가해야 지도위에 표시됩니다
//kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
//주소-좌표 변환 객체를 생성합니다

var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
addr.forEach(function(addr,index){
geocoder.addressSearch(addr, function(result, status) {
	console.log(result[0]);
	//alert(i);
  // 정상적으로 검색이 완료됐으면  
   if (status === kakao.maps.services.Status.OK) {
			
      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
      //alert(coords);
      var redstar1 = '../image/redstar1.png'; // 마커이미지의 주소입니다
      var redstar2 = '../image/redstar2.png'; // 마커이미지의 주소입니다
      var redstar3 = '../image/redstar3.png'; // 마커이미지의 주소입니다
      var bluestar1 = '../image/bluestar1.png'; // 마커이미지의 주소입니다
      var bluestar2 = '../image/bluestar2.png'; // 마커이미지의 주소입니다
      var bluestar3 = '../image/bluestar3.png'; // 마커이미지의 주소입니다
      var avgstar = '../image/avgstar.png';
      var imageSize = new kakao.maps.Size(45, 45); // 마커이미지의 크기입니다
      var imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      if(searchprice[index]>=veryveryveryhighprice)
      {
      	var markerImage = new kakao.maps.MarkerImage(redstar1, imageSize, imageOption);
      	console.log("searchprice:"+searchprice[index]+"vvvhp:"+veryveryveryhighprice);
      }
      else if(searchprice[index]>=veryveryhighprice && searchprice[index]<veryveryveryhighprice)
      {
      	var markerImage = new kakao.maps.MarkerImage(redstar2, imageSize, imageOption);
      	console.log("searchprice:"+searchprice[index]+"vvhp:"+veryveryhighprice);
      }
      else if(searchprice[index]>=veryhighprice && searchprice[index]<veryveryhighprice)
      {
      	var markerImage = new kakao.maps.MarkerImage(redstar3, imageSize, imageOption);
      	console.log("searchprice:"+searchprice[index]+"vhp:"+veryhighprice);
      }else if(searchprice[index]>=avgprice && searchprice[index]<veryhighprice)
      {
      	var markerImage = new kakao.maps.MarkerImage(avgstar, imageSize, imageOption);
      	console.log("searchprice:"+searchprice[index]+"avgprice:"+avgprice);
      }
      else if( searchprice[index]>=verylowprice && searchprice[index]<avgprice )
      {
      	var markerImage = new kakao.maps.MarkerImage(avgstar, imageSize, imageOption);
      	console.log("searchprice:"+searchprice[index]+"avgprice:"+avgprice);	
      }
      else if( searchprice[index]>=veryverylowprice && searchprice[index]<verylowprice )
      {
      	var markerImage = new kakao.maps.MarkerImage(bluestar1, imageSize, imageOption);
      	console.log("searchprice:"+searchprice[index]+"vlp:"+verylowprice);
      }
      else if( searchprice[index]>=veryveryverylowprice && searchprice[index]<veryverylowprice ){
      	var markerImage = new kakao.maps.MarkerImage(bluestar2, imageSize, imageOption);
      	console.log("searchprice:"+searchprice[index]+"vvlp:"+veryverylowprice);
      }
      else if(searchprice[index]<veryveryverylowprice){
      	var markerImage = new kakao.maps.MarkerImage(bluestar3, imageSize, imageOption);
      	console.log("searchprice:"+searchprice[index]+"vvvlp:"+veryveryverylowprice);
      }
      
      // 결과값으로 받은 위치를 마커로 표시합니다
      console.log("집이름:"+searchhome_name[index]);
		console.log("지역:"+addr[index]);
		
		
       var marker = new kakao.maps.Marker({
          map: map,
          position: coords,
          image:markerImage
      });
      var cc = index;
    	kakao.maps.event.addListener(marker, 'click', function() {
            // 이곳에 작성하면 됩니다.
            // 여기서 infoWindow.getContent() 로 내용을 가져올 수 있습니다.
             location.href="content.do?num="+num[cc]; 
        }); 

      // 인포윈도우로 장소에 대한 설명을 표시합니다
		 for(j=0;j<searchhome_name.length;j++){
      if(index==j){
      var infowindow = new kakao.maps.InfoWindow({
          content: '<div id="home_name" style="width:150px;text-align:center;padding:6px 0;">'+searchhome_name[j]+'</div>'
      });
      }
      }
      
      infowindow.open(map, marker);
		
      // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
      map.setCenter(coords); 
      
    
  } 
  
});    
});


//map end
</script>
<script src="${pageContext.request.contextPath}/js/board_list_jh.js"></script>
</body>
</html>