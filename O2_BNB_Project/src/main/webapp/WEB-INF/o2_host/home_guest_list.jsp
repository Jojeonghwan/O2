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
<script src="${pageContext.request.contextPath}/js/home_guest_list_jh.js"></script>
<style>
table{
	width:300px;
	border:1px solid gray;
}
tr,td{
border:1px solid gray;
}
</style>
</head>
<body>
<c:forEach var="dto" items="${list}">
<c:if test="${dto.cancel_type eq '1'}">
<table>
	<tr>
		<td>
			num:
		</td>
		<td>
			${dto.num}
		</td>
	</tr>
	<tr>
		<td>
			host_id:
		</td>
		<td>
			${dto.host_id}
		</td>
	</tr>
	<tr>
		<td>
			h_num:
		</td>
		<td>
			${dto.h_num}
		</td>
	</tr>
	<tr>
		<td>
			guest_name:
		</td>
		<td>
			${dto.guest_name}
		</td>
	</tr>
	<tr>
		<td>
			guest_person:
		</td>
		<td>
			${dto.guest_person}
		</td>	
	</tr>
	<tr>
		<td>
			reserveday:
		</td>
		<td>
			${dto.reserveday}
		</td>
	</tr>
	<tr>
		<td>
			checkin:
		</td>
		<td>
			${dto.checkin}
		</td>
	</tr>
	<tr>
		<td>
			checkout:
		</td>
		<td>
			${dto.checkout}
		</td>
	</tr>
	<tr>
		<td>
			guest_hp:
		</td>
		<td>
			${dto.guest_hp}
		</td>
	</tr>
	<tr>
		<td>
			guest_email:
		</td>
		<td>
			${dto.guest_email}
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" class="cancel" value="취소" 
			h_num="${dto.h_num}" checkin="${dto.checkin}" checkout="${dto.checkout}"
			guest_email="${dto.guest_email}" guest_name="${dto.guest_name}"
			reserveday="${dto.reserveday}">
			
			
			<%-- onclick="location.href:'cancel.aj?
			h_num=${dto.h_num}&checkin=${dto.checkin}&checkout=${dto.checkout}&
			guest_email=${dto.guest_email}&guest_name=${dto.guest_name}&
			reserveday=${dto.reserveday}'" --%>
		</td>
	</tr>
</table>

<br><br>

<br><br><br>
</c:if>
<c:if test="${dto.cancel_type eq '2'}">
<table>
	<tr>
		<td>
			num:
		</td>
		<td>
			${dto.num}
		</td>
	</tr>
	<tr>
		<td>
			host_id:
		</td>
		<td>
			${dto.host_id}
		</td>
	</tr>
	<tr>
		<td>
			h_num:
		</td>
		<td>
			${dto.h_num}
		</td>
	</tr>
	<tr>
		<td>
			guest_name:
		</td>
		<td>
			${dto.guest_name}
		</td>
	</tr>
	<tr>
		<td>
			guest_person:
		</td>
		<td>
			${dto.guest_person}
		</td>	
	</tr>
	<tr>
		<td>
			reserveday:
		</td>
		<td>
			${dto.reserveday}
		</td>
	</tr>
	<tr>
		<td>
			checkin:
		</td>
		<td>
			${dto.checkin}
		</td>
	</tr>
	<tr>
		<td>
			checkout:
		</td>
		<td>
			${dto.checkout}
		</td>
	</tr>
	<tr>
		<td>
			guest_hp:
		</td>
		<td>
			${dto.guest_hp}
		</td>
	</tr>
	<tr>
		<td>
			guest_email:
		</td>
		<td>
			${dto.guest_email}
		</td>
	</tr>
	<tr>
		<td colspan="2">
			취소 처리된 예약입니다.
		</td>
	</tr>
</table>

<br><br>

<br><br><br>
</c:if>
</c:forEach> 

</body>
</html>