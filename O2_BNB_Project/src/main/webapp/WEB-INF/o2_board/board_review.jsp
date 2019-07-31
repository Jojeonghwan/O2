<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 댓글입력 시작 -->

<form id="uploadForm" enctype="multipart/form-data" method="POST" action="review_insert.do">

<div class="container margin_60">

<div class="form-group">
	<b class="font">숙소 후기</b>				
	<div class="font" style="color: gray;">
	총 평점 : (
			<fmt:formatNumber value="${starRating}" pattern="0.00"/>점, 
			<span style="zoom: 0.5;">
			<span class="star-rating">
			<span style="width:${starRating*20}%"></span>
			</span>
			</span>
			)
	</div>
</div>
<hr class="my-4" style="border-color: white;">

	<div class="row background">
		<div class="col-sm-6 col-sm-6 form-group">
			<div class="form-group">
				<span id="startext" class="font">평가하기</span>
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
			</div>
			<div class="form-group">
			<br>
			<!-- 상호작용을 위해 lable 요소의 for 속성과 input 요소의 id 값을 일치시킨다. -->
				<div class="filebox my-3">
				    <label for="upfile" class="font">사진 등록</label> 
				    <input type="file" name="upfile" id="upfile">
				</div>
			</div>
		</div><!-- form-group 끝 -->

		<div class="col-sm-6 col-sm-6 form-group">
			<div class="form-group">
				<textarea name="content" id="reContent" required="required" class="form-control" style="resize:none;"></textarea>
				<input type="button" class="insert_btn" id="insert_btn" value="댓글등록">
			</div>
		</div>
	</div><!--  row 끝  -->
</div><!-- container margin_60 끝 -->

<!-- hidden -->
<input type="hidden" name="score" id="star_score" value="0.5">
<input type="hidden" name="id" value="${sessionScope.login_id}">
<input type="hidden" name="h_num" value="${num}">

</form><!-- 댓글입력 끝 -->

<hr class="my-4" style="border-color: white;">
<!-- ///////////////////////////////////////////////////////////댓글리스트 출력!!! -->
<div class="container margin_60">
	<c:forEach var="r_dto" items="${list}">
		<div class="row background">
			<div class="col-sm-6 col-sm-6 form-group">
				
				<!-- 썸네일, 별점, 아이디, 작성일, 별점 -->
				<div class="form-group">
					<c:if test="${r_dto.thumb_nail == 'noimg' }">
						<img src="../image/user.png" style="width: 30px;">
					</c:if>
					<c:if test="${r_dto.thumb_nail != 'noimg' }">
						<img src="/save/${r_dto.thumb_nail}" style="width: 30px;">						
					</c:if>
					${r_dto.id} 
					<span style="color: gray; font-size: 9pt; padding: .5em;">
						<fmt:formatDate value="${r_dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
					</span>
					(
					<fmt:formatNumber value="${r_dto.score}" pattern="0.00"/>점, 
					<span style="zoom: 0.5;">
						<span class="star-rating">
							<span style="width:${r_dto.score*20}%"></span>
						</span>
					</span>
					)
				</div>	
				
				<!-- 이미지출력 -->
				<div class="form-group">
					<c:if test="${r_dto.img_name != 'noimg' }">
						<img src="../save/${r_dto.img_name}" style="height: 100px;">
					</c:if>
				</div>			
			</div>
			<div class="col-sm-6 col-sm-6 form-group">
				
				<!-- 내용출력 -->
				<div class="form-group">
					<c:set var="myid" value="${r_dto.id}" />
					<c:if test="${sessionScope.login_id != myid }">
						<!-- 내용출력 -->
						${r_dto.content}
						<%-- <input type="text" name="content" class="reviewCon" id="reviewCon" value="${r_dto.content}" readonly="readonly"> --%>
					</c:if>
					<c:if test="${sessionScope.login_id == myid }">
						<!-- 내용출력 -->
						${r_dto.content}
						<%-- <input type="text" name="content" class="reviewCon" id="reviewCon" value="${r_dto.content}" readonly="readonly"> --%>
						<br><br>
						<!-- 수정, 삭제 버튼  -->
						<input type="button" value="수정" name="btn_update" class="btn_update" r_num="${r_dto.num}" h_num="${num}" pageNum="${pageNum}">
						<input type="button" value="삭제" name="btn_delete" class="btn_delete" r_num="${r_dto.num}" h_num="${num}" pageNum="${pageNum}"
						onclick="return confirm('리뷰를 삭제하시겠습니까?');">
					</c:if>
				</div>
			</div>
		</div>
		<hr>
	</c:forEach>
</div>
<!--  //////////////////////////////////////////////////////////////댓글 끝 -->
</body>
</html>