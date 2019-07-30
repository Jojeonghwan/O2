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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/qna_sy.js"></script>
<script type="text/javascript">
function checkform(){
	var user_type = "<%=(String)session.getAttribute("user_type")%>";
	var pass = $("#pass").val();
	var num = $("#dto_num").val();
	var rtn="";
	
	$.ajax({

		url : 'pass_right.aj',
		data : {'pass': pass, 'num': num},
		type : 'get',
		async:false,
		dataType : 'json',
		//contentType: 'application/json; charset=utf-8',
		success : function(pass_right){
			if(pass_right==1)// dto의 pw와 입력한 pw가 같을 때 1 반환
			{
				rtn=true;
			}else if(pass_right==2){
				alert("비번이 일치하지 않습니다");
				rtn=false;
			}
		}
	});
	return rtn;
}
</script>
</head>
<body>
<div>
<form action="update_action.do" method="get" onsubmit="return checkform();">
<table class="table table-bordered" style="width: 500px;">
	<tr>
		<th> 제    목 </th>
		<td> <input type="text" name="subject" value="${dto.subject}"> </td>
	</tr>
	<tr>
		<th> 작성자 </th>
		<td> ${dto.id} </td>
	</tr>
	<tr>
		<th> 내   용 </th>
		<td>
			<br>
			<pre> <textarea style="width: 200px;" name="content">${dto.content}</textarea> </pre>
			<br>					
		</td>
	</tr>
	<c:if test="${sessionScope.user_type != 3}">
	<tr>
		<th> 비밀번호 </th>
		<td>
			<input type="text" size="20" name="pw" id="pass"> 게시물의 비밀번호를 입력하세요
		</td>
	</tr>
	</c:if>
	<tr>
		<td colspan="2"> 
			<!-- hidden -->
			<input type="hidden" name="num" value="${dto.num}" id="dto_num">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<input type="submit" value="수정완료"> 			
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>