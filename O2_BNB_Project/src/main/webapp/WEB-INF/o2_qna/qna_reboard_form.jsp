<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
</head>
<body>
<form action="qna_action.do" method="post" onsubmit="return checkform()">
	<table style="width: 600px;" class="table table-bordered">
		<caption><b>댓글 등록</b></caption>
		<tr>
			<th > 작성자 ${num}</th>
			<td> ${sessionScope.login_id}
			<!-- hidden -->
			<input type="hidden" name="id" value="${sessionScope.login_id}">
			</td>
		</tr>
		<tr>
			<th> 제 목 </th>
			<td> <input type="text" name="subject" style="width: 200px;"> </td>
		</tr>
		<tr>
			<th> 내 용 </th>
			<td> <textarea style="width: 200px; height: 100px;" name="content"></textarea> </td>
		</tr>
		<tr>
			<th> 패스워드 </th>
			<td> <input type="password" name="pw" style="width: 200px;"> </td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="완료"></td>
		</tr>
	</table>
	<!-- hidden -->
	<input type="hidden" name="q_num" value="${num}">
</form>
</body>
</html>