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
<!-- js -->

<!-- css -->
<link href="../css/bootstrap.css" rel="stylesheet">

<link href="../css/bootstrap-theme.css" rel="stylesheet">
<link href="../css/bootstrap-theme.min.css" rel="stylesheet">
<link href="../css/admin.css" rel="stylesheet">
<link href="../css/jquery.switch.css" rel="stylesheet">
<link href="../css/custom.css" rel="stylesheet">
<link href="../css/date_time_picker.css" rel="stylesheet">


<!-- Google web fonts -->
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
   rel='stylesheet' type='text/css'>
<link
   href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap"
   rel="stylesheet" type='text/css'>

<link href='http://fonts.googleapis.com/css?family=Lato:300,400'
   rel='stylesheet' type='text/css'>
   
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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

<form action="update.do" method="post" enctype="multipart/form-data" >
집이름:<input type="text"  name="home_name" value="${dto.home_name}" required="required"><br>
호스트이름:<input type="text" name="host_name" value="${dto.host_name}" readonly="readonly"><br>

<!--Start Map-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=8c8c41484005696a06aceab619299c52&libraries=services"></script>
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=2b83f513db866294e637be33235d3d0d&libraries=services"></script>
<div class="row">
   <div class="col-md-6 col-sm-6 cst-form-group">
      <div class="cst-form-group">
         <h4>Address</h4>
         <div class="form-group">
            <input type="text" id="postcode" name="repostcode"
               class="form-control cst-form-control" placeholder="우편번호" required="required">
            <input type="button" style="height: 40px;" name="postcode" onClick="execDaumPostcode(); return false;" class="btn btn-lg btn-success" value="우편번호 찾기">
         </div>
      </div>
      <div class="cst-form-group">
         <div class="form-group">
            <input type="text" id="address" name="address" class="cst-form-control form-control" placeholder="주소" required="required"> 
            <input type="text" id="extraAddress" name="extraAddress" class="cst-form-control form-control" placeholder="참고항목" required="required">
         </div>
      </div>
      <div class="cst-form-group">
         <div class="form-group">
            <input type="text" id="detailAddress" name="detailAddress" class="cst-form-width form-control" placeholder="상세주소" required="required">
         </div>
      </div>
   </div>
   <div class="col-md-6 col-sm-6 cst-form-group">
      <div id="map" style="width: 100%; height: 380px;"></div>
   </div>
</div>



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
			   addr += $('input[name=repostcode]').val()+",";
			   addr += $('input[name=address]').val()+",";
			   addr += $('input[name=extraAddress]').val()+",";
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
	   $("#inc").click(function(){
		   	if(parseInt($('#people').val())<6)
		   	{
		   		$("#people").val(parseInt($('#people').val())+1);
		   		$("input[name='person']").val($('#people').val());
		   		
		   	}
		   	});
		   $("#dec").click(function(){
		   	if(parseInt($('#people').val())>1)
		   	{
		   		$("#people").val(parseInt($('#people').val())-1);
		   		$("input[name='person']").val($('#people').val());
		   	}
		   	});
   });
   
   $(function(){
	   var hashtag ='${dto.tag}'.split(",");
	   var facilities = '${dto.facilities}'.split(",");	   
   		$('input[name=hashtag]').each(function(index,item){
   			for(j=0; j<10; j++){	
   			if($(item).val()==hashtag[j]){
   		    $(item).prop("checked",true);
   					}
   				}
   		   });
   		$('input[name=goods]').each(function(index,item){
   			for(j=0; j<10; j++){	
   			if($(item).val()==facilities[j]){
   		    $(item).prop("checked",true);
   					}
   				}
   		   });
	 });

</script>
<!-- end Map -->
인원
<div>
      <button type="button" id="dec">-</button>
      <input id="people" type="text" value="1">
      <button type="button" id="inc">+</button>
</div>
<br>
연락처:<input type="text"  name="hp" value="${dto.hp}" required="required"><br>
비상연락처:<input type="text"  name="emer_hp" value="${dto.emer_hp}" required="required"><br>
소개:<br>
<textarea rows="10" cols="40" name="intro" required="required">${dto.intro}</textarea><br>
해시태그:<br>
<table>
	<tr>
		<td>
			<br>
			아이와 함께<input type="checkbox" name="hashtag" value="아이와 함께">
			힐링하기 좋은<input type="checkbox" name="hashtag" value="힐링하기 좋은">
			혼자서<input type="checkbox" name="hashtag" value="혼자서">
			가족과 함께<input type="checkbox" name="hashtag" value="가족과 함께">
			경치가 좋은<input type="checkbox" name="hashtag" value="경치가 좋은">
			<br>
			사진찍기 좋은<input type="checkbox" name="hashtag" value="사진찍기 좋은">
			계곡<input type="checkbox" name="hashtag" value="계곡">
			드라이브<input type="checkbox" name="hashtag" value="드라이브">
			친구와 함께<input type="checkbox" name="hashtag" value="친구와 함께">
			야경이 좋은<input type="checkbox" name="hashtag" value="야경이 좋은">
			<br>
			<br>
			서브 해시태그<input type="text" name="sub_tag"  value="${dto.sub_tag}">
		</td>
	</tr>
</table>
구비 품목 :<br>
<table>
	<tr>
		<td>
			<br>
			인터넷<input type="checkbox" name="goods" value="인터넷">
			주방<input type="checkbox" name="goods" value="주방">
			주차장<input type="checkbox" name="goods" value="주차장">
			욕실용품<input type="checkbox" name="goods" value="욕실용품">
			<br>
			마당<input type="checkbox" name="goods" value="마당">
			건조기<input type="checkbox" name="goods" value="건조기">
			에어컨<input type="checkbox" name="goods" value="에어컨">
			침대<input type="checkbox" name="goods" value="침대">
			<br>
			<br>
			서브 구비품목<input type="text" name="sub_facilities" value="${dto.sub_facilities}">
		</td>
	</tr>
</table>
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
        alert(str);
        $("#preview").html(str);		
        //addPreview(imgfile);
        $('#file').change(function() {
				$("#preview").html("");
                addPreview($(this)); //preview form 추가하기
        });
    });
 
    // image preview 기능 구현
    // input = file object[]
    function addPreview(input) {
        if (input[0].files) {
            //파일 선택이 여러개였을 시의 대응
            for (var fileIndex = 0 ; fileIndex < input[0].files.length ; fileIndex++) {
                var file = input[0].files[fileIndex];
                var reader = new FileReader();
 
                reader.onload = function (img) {
                    //div id="preview" 내에 동적코드추가.
                    //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
                    $("#preview").append(
                        "<img src=\"" + img.target.result + "\"\/>"
                    );
                };
                
                reader.readAsDataURL(file);
            }
        } else alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
    }
</script>
사진
<input multiple="multiple" id="file" type="file" name="file" class="ct_input_g" style="width:200px; height:19px">
<div id="preview">
	<img src="../save/201907203_1707226_0.jpeg">
</div>

가격
<input type="number" name="price" required="required" value="${dto.price}">

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

<script>
var filecheck=0;
$("#file").click(function(){
	filecheck=filecheck+1;
	$("#filecheck").val(filecheck);
})


</script>
<input type="submit" id="submit" value="전송">
</form>
</body>
</html>