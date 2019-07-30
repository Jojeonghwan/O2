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
<style>
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>

</head>
<body>
${sessionScope.login_id}님께서 예약하신 ${dto.home_name}의 결제입니다<br>
<%-- <fmt:formatDate value="${checkin}" pattern="yyyy-MM-dd"/>
&nbsp;~&nbsp;
<fmt:formatDate value="${checkin}" pattern="yyyy-MM-dd"/><br> --%>
금액 
<c:if test="${pay_type=='2'}">
<br>카드사:
<select required="required">
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
<br>카드번호 :
<input type="number" id="canum1" style="width:50px;" maxlength="4" oninput="numberMaxLength(this)">-
<input type="number" id="canum2" style="width:50px;" maxlength="4" oninput="numberMaxLength(this)">-
<input type="number" id="canum3" style="width:50px;" maxlength="4" oninput="numberMaxLength(this)">-
<input type="number" id="canum4" style="width:50px;" maxlength="4" oninput="numberMaxLength(this)">
<br>cvs:
<input type="number" id="cvs" style="width:50px;" required="required" maxlength="3" oninput="numberMaxLength(this)">
<br>비밀번호:
<input type="password" id="pass" style="width:50px;" required="required" maxlength="4">
</c:if>
<c:if test="${pay_type=='3'}">

<br>은행사 : 신한
<br>계좌번호 : 110-338-413542
<br>2시간 이내로 입금해주시기 바랍니다.
</c:if>
<div>
<form id="payForm">
<input type="hidden" name="name" value="${name}">
<input type="hidden" name="id" value="${sessionScope.login_id}">
<input type="hidden" name="home_name" value="${dto.home_name}">
<input type="hidden" name="price" value="${dto.price}">
<input type="hidden" name="person" value="${person}"><!-- 인원 -->
<input type="hidden" name="reserveday">
<input type="hidden" name="checkin" value="">
<input type="hidden" name="checkout" value="">
<input type="hidden" name="h_num" value="${dto.num}">
<input type="hidden" name="addr" value="${dto.addr}">
<input type="hidden" name="pay_type" value="${pay_type}">
<input type="hidden" name="pay_check" value="${pay_type=='2'?'3':'1'}">
<input type="hidden" name="cancel_type" value=1>
	</form>
<button type="button" id="payment">결제</button>
</div>
<script src="${pageContext.request.contextPath}/js/pay_popup_jh.js"></script>
</body>
</html>