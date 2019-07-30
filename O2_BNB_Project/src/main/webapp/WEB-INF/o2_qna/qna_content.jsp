<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/qna_sy.js"></script>

</head>
<body>
<div>
	<table class="table table-bordered" style="width: 600px;">
		<caption>문 의 내 역 ${pageNum }</caption>
		<tr>
			<th style="width: 100px;"> 아 이 디 </th>
			<td> ${dto.id} 
			</td>
		</tr>
		<tr>
			<th> 제    목 </th>
			<td> ${dto.subject} </td>
		</tr>
		<tr>
			<th> 내    용 </th>
			<td> ${dto.content} </td>
		</tr>
		<tr>
			<td colspan="2">
			<c:if test="${ dto.id == sessionScope.login_id }">
				<a href="qna_update_form.do?num=${dto.num}&pageNum=${pageNum}">수정하기</a><br>
				<a href="qna_delete.do?num=${dto.num}&pageNum=${pageNum}" onclick="return confirm('문의사항을 삭제하시겠습니까?');">삭제하기</a>		
			</c:if>
			</td>
		</tr>
	</table>

<c:if test="${sessionScope.user_type == '3'}">
	<a href="qna_update_form.do?num=${dto.num}&pageNum=${pageNum}">관리자용수정하기</a>
</c:if>

<br><br>

</div>
<div>
<!-- 이클립스 내에서 보기위해 만드는 부분 -->
<embed src="http://localhost:3000" style="width: 800px; height: 800px;">

</div>
</body>
</html>