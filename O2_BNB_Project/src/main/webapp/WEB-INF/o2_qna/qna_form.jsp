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
<script type="text/javascript" src="../js/qna_sy.js"></script>
</head>
<body>
<form action="qna_action.do" method="post" onsubmit="return qnaInsertCheckform()">
	<table style="width: 600px;" class="table table-bordered">
		<caption><b>문의글 등록</b></caption>
		<tr>
			<th > 작성자 </th>
			<td> ${sessionScope.login_id}
			<!-- hidden -->
			<input type="hidden" name="id" value="${sessionScope.login_id}">
			</td>
		</tr>
		<tr>
			<th> 주 제 </th>
			<td> 
				<select name="q_type" id="q_select" style="width: 200px;">
					<option value="0"> ----문의주제 선택---- </option>
					<c:if test="${sessionScope.user_type == '3'}">
						<option value="1"> 공지사항 </option>
					</c:if>
					<option value="2"> 환불 관련 문의 </option>
					<option value="3"> 사용자 관련 문의 </option>
					<option value="4"> 기타 문의 </option>
				</select> 
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
</form>
</body>
</html>