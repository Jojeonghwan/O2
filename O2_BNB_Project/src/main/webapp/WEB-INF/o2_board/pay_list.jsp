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
<style>
td,th,tr{
text-align: center;
border: 1px solid gray;
width: 250px;
}
</style>
</head>
<body>
결제 리스트
<br>

<c:forEach var="dto" items="${list}">
<%-- ${dto.id}<br>
${dto.name}<br>
${dto.home_name}<br>
${dto.price}<br>
${dto.person}<br>
${dto.reserveday}<br>
${dto.checkin}<br>
${dto.addr}<br>
${dto.pay_type}<br>
${dto.pay_check}<br>


<hr>
<hr> --%>



<table style="border: 1px solid gray; width:100%">
<tr>
	<th>이름</th>
	<th>숙소명</th>
	<th>가격</th>
	<th>인원</th>
	<th>예약 날짜</th>
	<th>입실 날짜</th>
	<th>퇴실 날짜</th>
	<th>결제 타입</th>
	<th>결제 상태</th>
	<th>숙소정보</th>
</tr>
<tr>
<td>
${dto.name}
</td>
<td>
${dto.home_name}
</td>
<td>
${dto.price}
</td>
<td>
${dto.person}
</td>
<td>
${dto.reserveday}
</td>
<td>
${dto.checkin}
</td>
<td>
${dto.checkout}
</td>
<td>
<c:if test="${dto.pay_type eq '2'}">
카드결제
</c:if>
<c:if test="${dto.pay_type eq '3'}">
계좌이체결제
</c:if>
</td>
<td>
<c:if test="${dto.pay_check eq '4'}">
예약 취소
</c:if>
<c:if test="${dto.pay_check eq '3'}">
예약 확정
</c:if>
<c:if test="${dto.pay_check eq '1'}">
입금 대기
</c:if>
</td>
<td>
<c:if test="${dto.send_ticket_ch=='1'}">
	<c:if test="${dto.pay_check != '4'}">
		<input type="button" value="보내기" num="${dto.num}" class="send_ticket">
	</c:if>
</c:if>
</td>
</tr>
</table>
</c:forEach>
</body>
</html>