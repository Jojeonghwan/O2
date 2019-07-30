//유효성검사

function validate() {
alert("유효성 스타트");
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
		
 	else{
 		return true;
 	}

}
//유효성검사



   
//input
   $(function(){
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
 
   
//input
   
//file
   
 
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
   
       
       var filecheck=0;
       $("#file").click(function(){
       	filecheck=filecheck+1;
       	$("#filecheck").val(filecheck);
       })
//file
   
