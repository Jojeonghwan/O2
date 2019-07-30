<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../js/board.js"></script>
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
.font{
	font-family: 'Noto Sans KR', sans-serif;
}
.send{
	background-color: rgba( 255, 90, 95, 0.7 );
	color:white;
}
hr{
	border: solid 1px #ff5a5f;
}
.color{
	
}
div div{
text-align: center;
}
</style>
</head>
<body>
<div class="container margin_60">
	<h1 class="my-5 font">
		Pay List
	</h1>
	<c:forEach var="dto" items="${list}" varStatus="status">
		<h5>
			<label class="font mr-5">no.${status.index+1}</label>
		</h5>
		<div class="row border">
			<div class="col form-group">
				<label class="font">이름</label>
				<pre class="font my-5">${dto.name}</pre>
			</div>
			<div class="col form-group">
				<label class="font">숙소명</label>
				<pre class="font my-5">${dto.home_name}</pre>
			</div>
			<div class="col form-group">
				<label class="font">가격</label>
				<pre class="font my-5">${dto.price}</pre>
			</div>
			<div class="col form-group">
				<label class="font">인원</label>
				<pre class="font my-5">${dto.person}</pre>
			</div>
			<div class="col form-group">
				<label class="font">예약 날짜</label>
				<pre class="font my-5">${dto.reserveday}</pre>
			</div>
			<div class="col form-group">
				<label class="font">입실 날짜</label>
				<pre class="font my-5">${dto.checkin}</pre>
			</div>
			<div class="col form-group">
				<label class="font">퇴실 날짜</label>
				<pre class="font my-5">${dto.checkout}</pre>
			</div>
			<div class="col form-group">
				<label class="font">결제 타입</label>
				<p class="font">
					<c:if test="${dto.pay_type eq '2'}">
						<pre class="font my-5">카드결제</pre>
					</c:if>
					<c:if test="${dto.pay_type eq '3'}">
						<pre class="font my-5">계좌이체결제</pre>
					</c:if>
				</p>
			</div>
			<div class="col form-group">
				<label class="font">결제 상태</label>
				<p class="font">
					<c:if test="${dto.pay_check eq '4'}">
						<pre class="font my-5">예약 취소</pre>
					</c:if>
					<c:if test="${dto.pay_check eq '3'}">
						<pre class="font my-5">예약 확정</pre>
					</c:if>
					<c:if test="${dto.pay_check eq '1'}">
						<pre class="font">입금 대기</pre>
					</c:if>
				</p>
			</div>
			<div class="col form-group">
				<label class="font mb-5">숙소정보</label>
				<p class="font">
					<c:if test="${dto.send_ticket_ch=='1'}">
						<c:if test="${dto.pay_check != '4'}">
							<input type="button" class="font btn-lg send my-5" value="보내기" num="${dto.num}" class="send_ticket">
						</c:if>
					</c:if>
				</p>
			</div>			
		</div>
	</c:forEach>
</div>
</body>
</html>