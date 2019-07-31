<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<% 
    String path = request.getContextPath();    
    pageContext.setAttribute("path", path);
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap&subset=korean" rel="stylesheet">
<style>
#preview img {
    width: 300px;
    height: 300px;
}
#preview p {
    text-overflow: ellipsis;
    overflow: hidden;
}
.preview-box {
    border: 1px solid;
    padding: 5px;
    border-radius: 2px;
    margin-bottom: 10px;
}

input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
.filebox label { 
display: inline-block; 
padding: .5em .75em; 
font-size: inherit; 
line-height: normal; 
vertical-align: middle; 
background-color:rgba( 255, 90, 95, 0.7 );
cursor: pointer; 
border: 1px solid #ebebeb; 
border-bottom-color: #e2e2e2; 
border-radius: .25em; 
} 
.filebox input[type="file"] {
 /* 파일 필드 숨기기 */ 
 position: absolute; 
 width: 1px; 
 height: 1px; 
 padding: 0; 
 margin: -1px; 
 overflow: hidden; 
 clip:rect(0,0,0,0); 
 border: 0; 
 }
.font{
font-family: 'Noto Sans KR', sans-serif;
font-weight: bold;
}
.main_font{
color: #ff5a5f;
font-weight:bold;
}
.btn_green{
background-color: rgb(0, 132, 137);
color:white;
}
.background_color{
background-color: #fffefc;
}
.resize{
resize:none;
}
.icon{
width: 50px;
height: 50px;
}
</style>
<script type="text/javascript">
$(function(){
	var addr='${dto.addr}'.split("/");
	var postcode= addr[0];
	var address = addr[1];
	var extraAddress = addr[2];
	var detailAddress = addr[3];
	$("#postcode").val(postcode);
	$("#address").val(address);
	$("#extraAddress").val(extraAddress);
	$("#detailAddress").val(detailAddress);
})

</script>
</head>
<body>

<form action="update.do" method="post" enctype="multipart/form-data" id="frm" name="frm"  onsubmit="return validate();" >
<div class="container margin_60 background_color">
<h1 class="my-5 font main_font">
	<img class="icon mr-3" src="../image/pencilM1.png">Accommodation Registration
</h1>
<div class="row my-2">
	<div class="col-sm-3">
		<label class="font">Host name :</label><input type="text" class="form-control font"name="host_name" value="${dto.host_name}" readonly="readonly">
	</div>
</div>
<div class="row my-2">
	<div class="col-sm-8">
		<label class="font">Room name :</label><input type="text"  name="home_name" class="form-control font" value="${dto.home_name}">
	</div>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=8c8c41484005696a06aceab619299c52&libraries=services"></script>
<hr>
<div class="row my-5">
   <div class="col-md-6 col-sm-6 form-group">
      <div class="form-group">
         <h4 class="font">주소</h4>
         <div class="form-group">
         	<div class="row">
         		<div class="col">
         			<input type="text" id="postcode" name="repostcode" class="form-control font" placeholder="우편번호" >
         		</div>
         		<div class="col">
         			<input type="button" name="postcode" onClick="execDaumPostcode(); return false;" class="btn btn-block btn-block btn_green" value="우편번호 찾기">
         		</div>
         	</div>
         </div>
      </div>
      <div class="form-group">
         <div class="form-group">
         	<div class="row">
         		<div class="col">
         			<input type="text" id="address" name="address" class="form-control font" placeholder="메인주소" > 
         		</div>
         		<div class="col">
         			<input type="text" id="extraAddress" name="extraAddress" class="form-control font" placeholder="참고항목(동/읍/면)" >
         		</div>
         	</div>
            </div>
      </div>
      <div class="form-group">
         <div class="form-group">
            <input type="text" id="detailAddress" name="detailAddress" class=" form-control font" placeholder="상세주소" >
         </div>
      </div>
   </div>
   <div class="col-md-6 col-sm-6 ">
      <div id="map" style="width: 100%; height: 380px;"></div>
   </div>
</div>
<hr>

<script>
//$(function(){
	var addr='${dto.addr}'.split("/");
   console.log(execDaumPostcode);
   var initAddr = $("#address").val();
   loadMap(addr[1]);
   if (initAddr != "") {
      loadMap(initAddr);
      removeBox();
   }

   function loadMap(address) {
      //address = document.getElementById('address').value;
      var mapContainer = document
            .getElementById('map'), mapOption = {
         center : new daum.maps.LatLng(33.450701,
               126.570667),
         level : 5
      };
      var map = new daum.maps.Map(mapContainer,mapOption);
      var geocoder = new daum.maps.services.Geocoder();
      geocoder.addressSearch(address,function(result, status) {
         if (status === daum.maps.services.Status.OK) {
            var coords = new daum.maps.LatLng(result[0].y,result[0].x);
            var marker = new daum.maps.Marker({
                     map : map,
                     position : coords
            });
            var infowindow = new daum.maps.InfoWindow({
               content : '<div id="removeBox" style="width:150px;text-align:center;padding:6px 0;"></div>'
            });
            infowindow.open(map,marker);
            map.setCenter(coords);
            $("#removeBox").ready(function() {
               var rmvbox = $("#removeBox").parent();
               rmvbox.parent().remove();
            });
         }
      });
   }// end loadMap
   
   function removeBox() {
      $("#removeBox").ready(function() {
         var rmvbox = $("#removeBox").parent();
         rmvbox.parent().remove();
      });
   }
   
   function execDaumPostcode() {
      new daum.Postcode({oncomplete : function(data) {
         var addr = ''; // 주소 변수
         var extraAddr = ''; // 참고항목 변수
         if (data.userSelectedType === 'R') {
            addr = data.roadAddress;
         } else {
            addr = data.jibunAddress;
         }
         if (data.userSelectedType === 'R') {
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
               extraAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== '' && data.apartment === 'Y') {
                  extraAddr += (extraAddr !== '' ? ', '+ data.buildingName : data.buildingName);
            }
            if (extraAddr !== '') {
               extraAddr = ' (' + extraAddr + ')';
            }
            
            document.getElementById("extraAddress").value = extraAddr;
         } else {
            document.getElementById("extraAddress").value = '';
         }
         
         document.getElementById('postcode').value = data.zonecode;
         document.getElementById("address").value = addr;
         // loadMap
         loadMap(addr);
         document.getElementById("detailAddress").focus();
      }}).open();
   }
   
   $(function(){
	   $("#submit").click(function(){
			   var addr="";
			   addr += $('input[name=repostcode]').val()+"/";
			   addr += $('input[name=address]').val()+"/";
			   addr += $('input[name=extraAddress]').val()+"/";
			   addr += $('input[name=detailAddress]').val();
			   $("#addr").val(addr);
			   
			   var tag="";
			   $("input[name=hashtag]:checked").each(function() {
				   tag+=$(this).val()+",";
				 });
			   tag=tag.substr(0, tag.length-1);
			   $("#tag").val(tag);	
			   
			   
			   
			   var facilities="";
			   $("input[name=goods]:checked").each(function() {
				   facilities+=$(this).val()+",";
				 });
			   facilities=facilities.substr(0, facilities.length-1);
			   $("#facilities").val(facilities);	
	   });	   
	
   });
   
   $(function(){
	   var hashtag ='${dto.tag}'.split(",");
	   var facilities = '${dto.facilities}'.split(",");	   
   		$('input[name=hashtag]:not(checked)').each(function(index,item){
			for(j=0; j<10; j++){	
	   			if($(item).val()==hashtag[j]){
	   		    	$(item).trigger('click');
				}
			}
	   });
   		$('input[name=goods]:not(checked)').each(function(index,item){
   			for(j=0; j<10; j++){	
   			if($(item).val()==facilities[j]){
   		    	$(item).trigger('click');
   					}
   				}
   		   });
   		
   		$("#people").val("${dto.person}").prop("selected", true);

	 });

</script>
<!-- end Map -->
<div class="row">
	<div class="col-sm-6 col-sm-6 form-group">
		<div class="form-group">
			<label class="font">연락처 :</label><input type="text" id="hp" name="hp" class="form-control my-3 font" value="${dto.hp}" >
		</div>
		<hr>
		<div class="form-group">
			<label class="font">비상 연락처 :</label><input type="text" id="emer_hp" name="emer_hp" class="form-control my-3 font" value="${dto.emer_hp}" >
		</div>
		<hr>
		<div class="form-group">
			<label class="font">소개</label>
		</div>
		<div class="form-group">
			<textarea rows="10" cols="40" name="intro" class="form-control my-3 font resize" >${dto.intro}</textarea>
		</div>
		<hr>
		<div class="form-group">
			<label class="font">가격</label>
		</div>
		<div class="form-group">
			<input type="number" name="price" class="form-control my-3 font" value="${dto.price}">
		</div>
	</div>
	<div class="col-sm-6 col-sm-6 form-group">
		<div class="form-group">
			<label class="font">해시태그 :</label>
		</div>
		<div class="form-group">
			<div class="btn-group-toggle my-1" data-toggle="buttons">
  				  <label class="btn btn-secondary ">
				   	 아이와 함께<input type="checkbox" class="font" name="hashtag" value="아이와 함께" autocomplete="off" >
				  </label>
				  <label class="btn btn-secondary ">
				  	힐링하기 좋은<input type="checkbox" class="font" name="hashtag" value="힐링하기 좋은" autocomplete="off">
				  </label>
				  <label class="btn btn-secondary ">
					혼자서<input type="checkbox" class="font" name="hashtag" value="혼자서" autocomplete="off">
				  </label>
				  <label class="btn btn-secondary ">
					가족과 함께<input type="checkbox" class="font" name="hashtag" value="가족과 함께" autocomplete="off">
				  </label>
			</div>
			<div class="btn-group-toggle my-1" data-toggle="buttons">
				  <label class="btn btn-secondary ">
					경치가 좋은<input type="checkbox" class="font" name="hashtag" value="경치가 좋은" autocomplete="off">
				  </label>
				  <label class="btn btn-secondary ">
				  	사진찍기 좋은<input type="checkbox" class="font" name="hashtag" value="사진찍기 좋은" autocomplete="off">
				  </label>
				  <label class="btn btn-secondary ">
				   	계곡<input type="checkbox" class="font" name="hashtag" value="계곡" autocomplete="off">
				  </label>
				  <label class="btn btn-secondary ">
				  	드라이브<input type="checkbox" class="font" name="hashtag" value="드라이브" autocomplete="off">
				  </label>
			</div>
			<div class="btn-group-toggle my-1" data-toggle="buttons">
				  <label class="btn btn-secondary ">
				  	친구와 함께<input type="checkbox" class="font" name="hashtag" value="친구와 함께" autocomplete="off">
				  </label>
				  <label class="btn btn-secondary ">
				  	야경이 좋은<input type="checkbox" class="font" name="hashtag" value="야경이 좋은" autocomplete="off">
				  </label>
			</div>	
		</div>
		<div class="form-group my-3">
			<label class="font">서브 해시태그 :</label>
		</div>
		<div class="form-group my-4">
			<input type="text" name="sub_tag" value="${dto.sub_tag}" class="form-control font">
		</div>
		<hr>
		<div class="form-group">
			<label class="font">구비 품목 :</label>
		</div>
		<div class="form-group">
			<div class="btn-group-toggle my-1" data-toggle="buttons">
  				  <label class="btn btn-secondary ">
  				  	인터넷<input type="checkbox" class="font" name="goods" value="인터넷" autocomplete="off">
  				  </label>
  				  <label class="btn btn-secondary ">
  				  	주방<input type="checkbox" class="font" name="goods" value="주방" autocomplete="off">
  				  </label>
  				  <label class="btn btn-secondary ">
  				  	주차장<input type="checkbox" class="font" name="goods" value="주차장" autocomplete="off">
  				  </label>
  				  <label class="btn btn-secondary ">
  				  	욕실용품<input type="checkbox" class="font" name="goods" value="욕실용품" autocomplete="off">
  				  </label>
  			</div>
  			<div class="btn-group-toggle my-1" data-toggle="buttons">
  				  <label class="btn btn-secondary ">
  				  	마당<input type="checkbox" class="font" name="goods" value="마당" autocomplete="off">
  				  </label>
  				  <label class="btn btn-secondary ">
  				  	건조기<input type="checkbox" class="font" name="goods" value="건조기" autocomplete="off">
  				  </label>
  				  <label class="btn btn-secondary ">
  				  	에어컨<input type="checkbox" class="font" name="goods" value="에어컨" autocomplete="off">
  				  </label>
  				  <label class="btn btn-secondary ">
  				  	침대<input type="checkbox" class="font" name="goods" value="침대" autocomplete="off">
  				  </label>
  			</div>
  		</div>
		<div class="form-group my-4">
			<label class="font">서브 구비품목 :</label>
		</div>
		<div class="form-groupmy-5">	
			<input type="text" name="sub_facilities" value="${dto.sub_facilities}" class="form-control font">
		</div>
		<hr>
		<div class="form-group">
			<label class="font">person</label>
			<select id="people" class="font form-control" style="width:100px; height:40px; border-radius:3px;" >
		 		<option value="1" class="font">1명</option>
		 		<option value="2" class="font">2명</option>
		 		<option value="3" class="font">3명</option>
		 		<option value="4" class="font">4명</option>
		 		<option value="5" class="font">5명</option>
		 		<option value="6" class="font">6명</option>
			</select>
		</div>
	</div>
</div>

<hr>

<script>
var path="D:/it0312/egoveclipse/eGovFrameDev-3.5.1-64bit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/O2_BNB_Project/save";

$(document).ready(
    function() {
        // 태그에 onchange를 부여한다.
        imgfile='${dto.img}'.split(",");
        var str = "";
        for(i=0; i<imgfile.length; i++)
        {
        	str+= "<img src='../save/"+imgfile[i]+"'><br>";	
        }
        
        $("#preview").html(str);		
        //addPreview(imgfile);
        $('#file').change(function() {
				$("#preview").html("");
                addPreview($(this)); //preview form 추가하기
        });
    });

</script>
<div class="row my-5">
	<div class="col-sm-6 form-group">
		<label class="font">사진</label>
		<div class="filebox">
			<label for="file" class="font">업로드</label> 
			<input multiple="multiple" id="file" type="file" name="file" class="ct_input_g font" style="width:200px; height:19px" ><!-- accept=".gif, .jpg, .png" -->
		</div>
	</div>	
</div>
<div class="row my-5">
	<div class="col-sm-12 form-group">
		<div id="preview"></div>
	</div>
</div>
<hr>
<script src="${pageContext.request.contextPath}/js/room_update_jh.js"></script>

<input type="hidden" id="id" name="id" value="${sessionScope.login_id}">
<input type="hidden" id="person" name="person" value="1">
<input type="hidden" id="facilities" name="facilities" value="">
<input type="hidden" id="addr" name="addr" value="">
<input type="hidden" id="tag" name="tag" value="">
<input type="hidden" id="u_num" name="u_num" value="${u_num}">
<input type="hidden" id="num" name="num" value="${dto.num}">
<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
<input type="hidden" id="filecheck" name="filecheck" value="">
<input type="hidden" id="before_img" name="before_img" value="${dto.img}" >

<div class="col-sm-1 offset-sm-11">
		<input type="submit" id="submit" value="전송">
	</div>
</div>
</form>
</body>
</html>