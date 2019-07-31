//유효성 검사
function validate() {
var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
		if(document.frm.home_name.value==null || document.frm.home_name.value==""){

			alert("집제목을 입력하세요.");

			document.frm.home_name.focus();

			return false;
		}

		else if(document.frm.repostcode.value==null || document.frm.repostcode.value==""){

			alert("주소를 입력하세요.");

			document.frm.repostcode.focus();

			return false;

		}
		else if(document.frm.address.value==null || document.frm.address.value==""){

			alert("주소를 입력하세요.");

			document.frm.address.focus();

			return false;

		}
		else if(document.frm.extraAddress.value==null || document.frm.extraAddress.value==""){

			alert("주소를 입력하세요.");

			document.frm.extraAddress.focus();

			return false;

		}
		else if(document.frm.detailAddress.value==null || document.frm.detailAddress.value==""){

			alert("주소를 입력하세요.");

			document.frm.detailAddress.focus();

			return false;

		}
		else if(document.frm.hp.value==null || document.frm.hp.value==""){

			alert("연락처를 입력하세요.");

			document.frm.hp.focus();

			return false;

		}
 		else if(!regPhone.test(document.frm.hp.value)){
			
			alert("연락처 형식에 맞지 않습니다.");
			
			document.frm.hp.focus();
			
			return false;
		} 
		else if(document.frm.emer_hp.value==null || document.frm.emer_hp.value==""){

			alert("비상연락처를 입력하세요.");

			document.frm.emer_hp.focus();

			return false;

		}
		else if(!regPhone.test(document.frm.emer_hp.value)){
			
			alert("비상연락처 형식에 맞지 않습니다.");
			
			document.frm.emer_hp.value.focus();
			
			return false;
		}
		else if(document.frm.intro.value==null || document.frm.intro.value==""){

			alert("소개를 입력하세요.");

			document.frm.intro.focus();

			return false;

		}
		else if(document.frm.price.value==null || document.frm.price.value==""){

			alert("가격을 입력하세요.");

			document.frm.price.focus();

			return false;

		}
		else if(document.frm.file.value==null || document.frm.file.value==""){

			alert("파일을 추가하세요.");

			return false;

		}
		
 	else{
 		return true;
 	}

}
//유효성 검사

//map

console.log(execDaumPostcode);
var initAddr = $("#address").val();
loadMap();
if (initAddr != "") {
   loadMap(initAddr);
   removeBox();
}

function loadMap(address) {
   address = document.getElementById('address').value;
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
//map
//input


//input

//file
$(document).ready(
	    function() {
	        // 태그에 onchange를 부여한다.
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
//file