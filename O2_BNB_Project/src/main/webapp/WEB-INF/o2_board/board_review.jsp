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

</head>
<body>

<div>
** 숙소 후기 ** <br>

숙소 총 평점 : (
스코어가 없을때
		<fmt:formatNumber value="${starRating}" pattern="0.00"/>점, 
		<span style="zoom: 0.5;">
		<span class="star-rating">
		<span style="width:${starRating*20}%"></span>
		</span>
		</span>
		)

<hr>
<!-- 댓글입력 시작 -->
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
		
<label for="file1">사진 등록</label>
<div class="files">
	<div><input type="file" name="upfile" id="upfile"></div>
</div>
<textarea style="width: 500px; height: 150px;" name="content" id="reContent" required="required"></textarea>
<!-- hidden -->
<input type="hidden" name="score" id="star_score" value="0.5">
<input type="hidden" name="id" value="${sessionScope.login_id}">
<input type="hidden" name="h_num" value="${num}">
<input type="button" id="insert_btn" value="댓글등록">
</form>
<!-- 댓글입력 끝 -->
</div>
	
<!-- ///////////////////////////////////////////////////////////댓글리스트 출력!!! -->
<div id="review_here">
<c:forEach var="r_dto" items="${list}">
<!-- <div class="listReview" style="width: 600px;"> -->
		<!-- 이미지출력 -->
			<c:if test="${r_dto.img_name != 'noimg' }">
				<img src="../save/${r_dto.img_name}" style="height: 100px;">
			</c:if>
			<br>
		<!-- 썸네일, 별점 -->
		<div>
			<c:if test="${r_dto.thumb_nail == 'noimg' }">
				<img src="../image/user.png" style="width: 30px;">
				${r_dto.id} <span style="color: gray; font-size: 9pt;">${r_dto.writeday}</span>
				(
				<fmt:formatNumber value="${r_dto.score}" pattern="0.00"/>점, 
				<span style="zoom: 0.5;">
				<span class="star-rating">
				<span style="width:${r_dto.score*20}%"></span>
				</span>
				</span>
				)
			</c:if>
			<c:if test="${r_dto.thumb_nail != 'noimg' }">
				<img src="/save/${r_dto.thumb_nail}" style="width: 30px;">
				${r_dto.id} <span style="color: gray; font-size: 9pt;">${r_dto.writeday}</span>
				(
				<fmt:formatNumber value="${r_dto.score}" pattern="0.00"/>점, 
				<span style="zoom: 0.5;">
				<span class="star-rating">
				<span style="width:${r_dto.score*20}%"></span>
				</span>
				</span>
				)
			</c:if>
		</div>
<br>
		<c:set var="myid" value="${r_dto.id}" />
		<c:if test="${sessionScope.login_id != myid }">
			<!-- 내용출력 -->
			<input type="text" name="content" class="reviewCon" id="reviewCon" value="${r_dto.content}" readonly="readonly">
		</c:if>
		
		<c:if test="${sessionScope.login_id == myid }">
			<!-- 내용출력 -->
			<input type="text" name="content" class="reviewCon" id="reviewCon" value="${r_dto.content}" readonly="readonly">
			<!-- 수정, 삭제 버튼  -->
			<input type="button" value="수정" name="btn_update" class="btn_update" r_num="${r_dto.num}" h_num="${num}" pageNum="${pageNum}">
			<input type="button" value="삭제" name="btn_delete" class="btn_delete" r_num="${r_dto.num}" h_num="${num}" pageNum="${pageNum}"
			onclick="return confirm('리뷰를 삭제하시겠습니까?');">
		</c:if>
		<br>
		<hr>
<!-- </div> -->
</c:forEach>
</div> <!-- review_here -->

<!--  //////////////////////////////////////////////////////////////댓글 끝 -->
</body>
</html>