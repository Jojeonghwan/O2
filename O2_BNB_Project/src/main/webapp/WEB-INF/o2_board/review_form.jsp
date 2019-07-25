<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
​<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#insert_btn").on("click", function(){ //댓글 등록 버튼 클릭시 
			var form = new FormData(document.getElementById('uploadForm'));
		    $.ajax({
			      url: "review_insert.do", //컨트롤러 URL
			      data: form,
			      dataType: 'json',
			      processData: false,
			      contentType: false,
			      type: 'POST',
			      success: function (response) {
			    	  alert("success");
			    	  console.log(response);
			      },error: function (jqXHR) {
			    	  alert(jqXHR.responseText);
			      }
		   });
		});
		
	});
	</script>
</head>
<body>
<form id="uploadForm" enctype="multipart/form-data" method="POST" action="review_insert.do">
	<input type="hidden" name="id" value="${sessionScope.login_id}">
	
		<div class="starRev">
		  <span class="starR1 on">0.5</span>
		  <span class="starR2 no">1.0</span>
		  <span class="starR1 no">1.5</span>
		  <span class="starR2 no">2.0</span>
		  <span class="starR1 no">2.5</span>
		  <span class="starR2 no">3.0</span>
		  <span class="starR1 no">3.5</span>
		  <span class="starR2 no">4.0</span>
		  <span class="starR1 no">4.5</span>
		  <span class="starR2 no">5.0</span>
		</div>
		<br><br>
		<span id="startext">평가하기</span>
		<!-- hidden -->
		<input type="hidden" name="score" id="star_score" value="0.5">
		<script type="text/javascript">
		$('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  var star_score =  $(this).text();
			  $("#star_score").val(star_score);
			  alert($("#star_score").val());
			  return false;
			});
		</script>
<label for="file1">사진 첨부</label>
 <div class="files">
	<div><input type="file" name="upfile" id="upfile"></div>
</div>
<textarea style="width: 500px; height: 150px;" name="content" id="content"></textarea>
<input type="button" id="insert_btn" value="댓글등록">
</form>
</body>
</html>