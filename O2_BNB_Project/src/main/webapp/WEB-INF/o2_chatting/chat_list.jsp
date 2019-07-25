<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="../js/chat.js"></script>
</head> 
<body>
	<h2>채팅 리스트</h2>
	<c:if test="${list==null || list.size()==0}">
		채팅이 없음
	</c:if>
	<c:if test="${list!=null}">
	<input type="hidden" value="${msg_list}" id="out_ch">
		<table border="1">
			<tr>
				<th colspan="2">채팅방</th>
			</tr>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td class="ch_dto" room_name="${dto.room_name}">${dto.room_name}</td>
					<td>
						<input type="button" value="채팅방 나가기" class="chat_exit" room_name="${dto.room_name}">
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>