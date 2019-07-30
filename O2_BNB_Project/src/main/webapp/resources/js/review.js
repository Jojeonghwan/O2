/**
 * 
 */
$(function(){
	// 별점 평가
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  var star_score =  $(this).text();
		  $("#star_score").val(star_score);
		  //alert($("#star_score").val());
		  return false;
		});
	
	
	//이미지 3개까지만 추가가능
//	let cnt=1;
//	$(document).on("click", "button.btn", function(){
//		cnt++;
//		if(cnt>3){
//			alert("이미지첨부의 최대갯수는 3개입니다");
//			return false;
//		}
//		var s='<input type="file" name="upfile">';
//
//		$("div.files").append(s);					
//	});
	
	
	//리뷰 등록
	$("#insert_btn").on("click", function(){ //댓글 등록 버튼 클릭시 
		var reContent = $("#reContent").val();
		if(!reContent){
			alert("내용을 입력해주세요");
			return false;
		}
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
		    	  alert("등록되었습니다");
		    	  window.close();
		    	  console.log(response);
		    	  location.reload();
		      },error: function (jqXHR) {
		    	  alert(jqXHR.responseText);
		      }
	   });
	});
	
	
	//리뷰 삭제
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
	
	
/*	$(".btn_updateDo").hide();
	// 리뷰 수정
	$(".btn_update").on("click", function(){
		alert("123;");
		var clickTimes = $(this).next('input').val();
		
		if( clickTimes == "0" ){
			$(this).prev('input').attr("readonly", false);
			$(this).prev('input').focus();
			//히든값 추가
			$(this).next('input').val("1");
			$(this).hide();
			//var inputUpdate = '<input type="button" value="수정완료" class="btn_updateDo" r_num="${r_dto.num}" h_num="${num}" pageNum="${pageNum}">';
			$(this).nextAll('.btn_updateDo').show();
			return false;
		}else{
			alert("1");
		}	
	});
	
	$(".btn_updateDo").on("click", function(){
		var content = $(this).parent().children('.reviewCon').val();
		var form = new FormData(document.getElementById('uploadForm'));
		$.ajax({
			url: "review_update.do", //컨트롤러 URL
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
	});*/
});


// 리뷰목록불러오는 함수
//function listReview(){
//	var num = '${num}';
//	alert(num);
//	$.ajax({
//		type : 'post',
//		url : 'review_list.do',
//		data : {"num" : num },
//		dataType: 'json',
//		async: false,
//		success : function(list){
//			$("#review_here").html(list);
//		}		
//	});
//}

//페이지 로딩시 댓글 목록 출력 
//$(document).ready(function(){
//	//listReview(); 
//});


$(function(){
	// 리뷰 수정 팝업띄우기
	$(".btn_update").click(function(){
		var reviewNum = $(this).attr("r_num"); // 리뷰번호
		var reviewPageNum = $(this).attr("pageNum");
		var reviewH_num = $(this).attr("h_num");
		var url="boardReview_update.do?r_num="+reviewNum+"&h_num="+reviewH_num+"&pageNum="+reviewPageNum;
		var option="width=500, height=500, top=200 left=200";
		window.open(url, "", option);
	});
	
	//리뷰 수정하기
	$("#update_btn").click(function(){
		var reContent = $("#reContent").val();
		if(!reContent){
			alert("내용을 입력해주세요");
			return false;
		}
		var form = new FormData(document.getElementById('updateForm'));
		var num = $("input[name=h_num]").val();
		var pageNum = $("input[name=pageNum]").val();
		
	    $.ajax({
		      url: "review_update.do", //컨트롤러 URL
		      data: form,
		      dataType: 'json',
		      processData: false,
		      contentType: false,
		      type: 'POST',
		      success: function (response) {		   
		    	  alert("수정되었습니다");
		    	  window.opener.document.location.href='../board/content.do?num='+num+'&pageNum='+pageNum;
		    	  	window.close();
		    	  
		      },error: function (jqXHR) {
		    	  alert(jqXHR.responseText);
		      }  
	   });
	    
	});
});


//function reviewPopup(){
//	
//	var reviewNum = $("input[name='btn_update']").attr("r_num");
//	alert(reviewNum);
//	var checkin=$("input[name='checkin']").val();
//	
//    var url="pay_popup.do?num="+${dto.num}+"&checkin="+checkin+"&checkout="+checkout+"&pay_type="+pay_type+"&person="+person+"&id=${sessionScope.login_id}";
//    var option="width=500, height=700, top=200 left=800"
//    window.open(url, "", option);
//
//}

