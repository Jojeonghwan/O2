<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-1.10.2.js"></script> -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
<style type="text/css">
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}
</style>
</head>
<body>

<div>
** 숙소 후기 ** <br>
<form id="uploadForm" enctype="multipart/form-data" method="POST" action="review_insert.do">
	
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
		
		
<label for="file1">사진 첨부</label>
 <div class="files">
 	<button type="button" style="width: 60px;" class="btn">추가</button>
	<div><input type="file" name="upfile" id="upfile"></div>
</div>
<textarea style="width: 500px; height: 150px;" name="content" id="content"></textarea>
<!-- hidden -->
<input type="hidden" name="score" id="star_score" value="0.5">
<input type="hidden" name="id" value="${sessionScope.login_id}">
<input type="hidden" name="h_num" value="${num}">
<input type="button" id="insert_btn" value="댓글등록">
</form>

</div>
	
<!-- ///////////////////////////////////////////////////////////댓글리스트 출력!!! -->
<div id="review_here">
<table class="table " style="width: 600px;">
	<c:forEach var="r_dto" items="${list}">
	<tr>
		<td>
			<c:if test="${r_dto.thumb_nail == 'noimg' }">
				<img src="../image/user.png" style="width: 50px;">
			</c:if>
			<c:if test="${r_dto.thumb_nail != 'noimg' }">
				<img src="/save/${r_dto.thumb_nail}" style="width: 50px;">
			</c:if>
		</td>
		<td style="width: 400px;">
			${r_dto.id} <span style="color: gray; font-size: 9pt;">${r_dto.writeday}</span>
			<span>${r_dto.score}</span>
		</td>
	</tr>
	<tr>
		<td>
			${r_dto.content}
		</td>
		<td style="width: 80px;">
			<input type="button" value="수정" class="btn_update" r_num="${r_dto.num}" h_num="${num}" pageNum="${pageNum}">
			<input type="button" value="삭제" class="btn_delete" r_num="${r_dto.num}" h_num="${num}" pageNum="${pageNum}">
			
		</td>
	</tr>
	</c:forEach>
</table>

</div> 

<!--  //////////////////////////////////////////////////////////////댓글 끝 -->
</body>
</html>