<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="../js/review.js"></script>
<link rel="stylesheet" href="../css/review_sy.css">
</head>
<body>
<div id="review_here">
<c:set var="r_dto" value="${r_dto}"/>
	<form id="updateForm" enctype="multipart/form-data" method="POST" action="">
		<!-- 별점 -->
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
		<!-- 사진첨부 -->
		<label for="file1">사진 수정</label>
		<br>
		<c:if test="${r_dto.img_name != 'noimg' }">
			<img src="../save/${r_dto.img_name}" style="width: 50px;">
		</c:if>
		<br>
		<div class="files">
			<div><input type="file" name="upfile" id="upfile"></div>
		</div>
			<button type="button" style="width: 60px;" class="btn">추가</button><br>
		<textarea style="width: 500px; height: 150px;" name="content" id="reContent" required="required">${r_dto.content}</textarea>
		<!-- hidden -->
		<input type="hidden" name="score" id="star_score" value="0.5">
		<input type="hidden" name="id" value="${sessionScope.login_id}">
		<input type="hidden" name="h_num" value="${r_dto.h_num}">
		<input type="hidden" name="num" value="${r_dto.num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="img_name" value="${r_dto.img_name}">
		<input type="button" id="update_btn" value="댓글수정">
</form>
</div>
</body>
</html>