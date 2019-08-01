<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>

</head>
<body>
<div class="container">
	<h3 class="font mb-3">
		${sessionScope.login_id}님께서 예약하신 ${dto.home_name}의 결제입니다<br>
	</h3>
	<h4 class="font mb-3">
		결제하실 금액 : ${dto.price}
	</h4>
	<c:if test="${pay_type=='2'}">
		<div class="row">
			<div class="form-group col-3">
				<label class="font">카드사 :</label>
			</div>
			<div class="form-group col-3">
				<select>
					<option selected="selected">신한</option>
					<option>국민</option>
					<option>삼성</option>
					<option>현대</option>
					<option>하나</option>
					<option>우리</option>
					<option>롯데</option>
					<option>BC</option>
					<option>농협</option>
				</select>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-3">
				<label class="font">카드번호 :</label>
			</div>
			<div class="form-group col-2">
				<input type="number" class="form-control" id="canum1" style="width:60px;" maxlength="4" oninput="numberMaxLength(this)">
			</div>
			-
			<div class="form-group col-2">
				<input type="number" class="form-control" id="canum2" style="width:60px;" maxlength="4" oninput="numberMaxLength(this)">
			</div>
			-
			<div class="form-group col-2">	
				<input type="number" class="form-control" id="canum3" style="width:60px;" maxlength="4" oninput="numberMaxLength(this)">
			</div>
			-
			<div class="form-group col-2">
				<input type="number" class="form-control" id="canum4" style="width:60px;" maxlength="4" oninput="numberMaxLength(this)">
			</div>
		</div>
		<div class="row">
			<div class="form-group col-3">
				<label class="font">cvs :</label>
			</div>
			<div class="form-group col-3">
				<input type="number" class="form-control" id="cvs" style="width:50px;" required="required" maxlength="3" oninput="numberMaxLength(this)">
			</div>
		</div>
		<div class="row">
			<div class="form-group col-3">
				<label class="font">비밀번호 : </label>
			</div>
			<div class="form-group col-3">
				<input type="password" class="form-control" id="pass" style="width:50px;" required="required" maxlength="4">
			</div>
		</div>
	</c:if>
	<c:if test="${pay_type=='3'}">
		<div class="row my-4">
			<div class="col-3">
				<label class="font">은행사 : 신한</label>
			</div>
		</div>
		<div class="row mb-4">
			<div class="col-9">
				<label class="font">계좌번호 : 110-338-413542</label>
			</div>
		</div>
		<div class="row mb-4">
			<div class="col-12">
				<label class="font">2시간 이내로 입금해주시기 바랍니다.</label>
			</div>
		</div>
	</c:if>
		<form id="payForm">
		<input type="hidden" name="name" value="${name}">
		<input type="hidden" name="id" value="${sessionScope.login_id}">
		<input type="hidden" name="home_name" value="${dto.home_name}">
		<input type="hidden" name="price" value="${dto.price}">
		<input type="hidden" name="person" value="${person}"><!-- 인원 -->
		<input type="hidden" name="reserveday">
		<input type="hidden" name="checkin" value="${checkin}">
		<input type="hidden" name="checkout" value="${checkout}">
		<input type="hidden" name="h_num" value="${dto.num}">
		<input type="hidden" name="addr" value="${dto.addr}">
		<input type="hidden" name="pay_type" value="${pay_type}">
		<input type="hidden" name="pay_check" value="${pay_type=='2'?'3':'1'}">
		<input type="hidden" name="cancel_type" value=1>
		</form>
		<button type="button" id="payment" style="float:right;">결제</button>
</div>
<script src="${pageContext.request.contextPath}/js/pay_popup_jh.js"></script>
</body>
</html>