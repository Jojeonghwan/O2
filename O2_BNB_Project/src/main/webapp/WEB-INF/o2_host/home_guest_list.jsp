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

<script src="${pageContext.request.contextPath}/js/home_guest_list_jh.js"></script>
<style>
font{
	font-family: 'Noto Sans KR', sans-serif;
}
div div{
	text-align: center;
}
label{
font-weight: bold;
}
.main_font{
color: #ff5a5f;
font-weight:bold;
}
.icon{
width: 50px;
height: 50px;
}
.cancel{
background-color:#ff5a5f;
color:white;
}
</style>
</head>
<body>
<c:import url="/header_black2.do"/>
<div class="container margin_60">
	<h1 class="my-5 font main_font">
		<img class="icon mr-3" src="../image/guestM.png">Home Guest List
	</h1>
	<%
	 int cnt=0;
	%>
	<c:forEach var="dto" items="${list}" varStatus="status">
	<%
	cnt++;
	%>
		<h5>
			<label class="font mr-5">no.${status.index+1}</label>
			<%-- <a class="font ml-5" href="../board/content.do?num=${dto.num}">숙소 정보보기</a> --%>
		</h5>
		<div class="row border">
		<c:if test="${dto.cancel_type eq '1'}">
				
			<div class="col form-group">
				<label class="font">guest_name:</label>
				<pre class="font my-5">${dto.guest_name}</pre>
			</div>
			<div class="col form-group">
				<label class="font">guest_person:</label>
				<pre class="font my-5">${dto.guest_person}</pre>
			</div>
			<div class="col form-group">
				<label class="font">reserveday:</label>
				<pre class="font my-5">${dto.reserveday}</pre>
			</div>
			<div class="col form-group">
				<label class="font">checkin:</label>
				<pre class="font my-5">${dto.checkin}</pre>
			</div>
			<div class="col form-group">
				<label class="font">checkout:</label>
				<pre class="font my-5">${dto.checkout}</pre>
			</div>
			<div class="col form-group">
				<label class="font">guest_hp:</label>
				<pre class="font my-5">${dto.guest_hp}</pre>
			</div>
			<div class="col form-group">
				<label class="font">guest_email:</label>
				<pre class="font my-5">${dto.guest_email}</pre>
			</div>
			<div class="col form-group my-5">
				<pre></pre>
				<input type="button" class="cancel font btn-lg" value="취소" 
				h_num="${dto.h_num}" checkin="${dto.checkin}" checkout="${dto.checkout}"
				guest_email="${dto.guest_email}" guest_name="${dto.guest_name}"
				reserveday="${dto.reserveday}">
			</div>
				<%-- onclick="location.href:'cancel.aj?
				h_num=${dto.h_num}&checkin=${dto.checkin}&checkout=${dto.checkout}&
				guest_email=${dto.guest_email}&guest_name=${dto.guest_name}&
				reserveday=${dto.reserveday}'" --%>
		</c:if>
		<c:if test="${dto.cancel_type eq '2'}">
			<div class="col form-group">
				<label class="font">guest_name:</label>
				<pre class="font my-5">${dto.guest_name}</pre>
			</div>
			<div class="col form-group">
				<label class="font">guest_person:</label>
				<pre class="font my-5">${dto.guest_person}</pre>
			</div>
			<div class="col form-group">
				<label class="font">reserveday:</label>
				<pre class="font my-5">${dto.reserveday}</pre>
			</div>
			<div class="col form-group">
				<label class="font">checkin:</label>
				<pre class="font my-5">${dto.checkin}</pre>
			</div>
			<div class="col form-group">
				<label class="font">checkout:</label>
				<pre class="font my-5">${dto.checkout}</pre>
			</div>
			<div class="col form-group">
				<label class="font">guest_hp:</label>
				<pre class="font my-5">${dto.guest_hp}</pre>
			</div>
			<div class="col form-group">
				<label class="font">guest_email:</label>
				<pre class="font my-5">${dto.guest_email}</pre>
			</div>
			<div class="form-group">
				<pre></pre>
				<pre></pre>
				<pre></pre>
				<pre class="font my-5">   취소 처리된 예약입니다.</pre>
			</div>
		</c:if>
		</div>	
	</c:forEach>
	<c:if test="<%=cnt==0%>">
		<h3 class="font">
			<label>예약한 게스트가 없습니다</label>
		</h3>
	</c:if>
</div>
</body>
</html>