<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
.ellip {
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
.avg{
width:250px;
height:200px;
}
.image{
	width:100%;
	height:100%;
}
.center{
	text-align: center;
}
label{
	font-weight:bold;
}
.main_font{
color: #ff5a5f;
font-weight:bold;
}
.icon{
width: 50px;
height: 50px;
}
</style>
</head>
<body>
<c:import url="/header_black2.do"/>
<div class="container margin_60">
	<h1 class="my-5 font main_font">
		<img class="icon mr-3" src="../image/houseM1.png">Room List
	</h1>
	<%
	 int cnt=0;
	%>
	<div class="row">
		<c:forEach var="dto" items="${host_list}" varStatus="status">
		<%
		cnt++;
		%>
			<div class="col-3 rounded border my-3 mx-4">
				<div class="form-group">
					<label class="font">no.${status.index+1}</label>
				</div>
				<div class="form-group">
					<a class="font ellip" href="../board/content.do?num=${dto.num}&pageNum=${currentPage}">
					<label class="font">Home_Name :</label> 
					<pre class="font">${dto.home_name}</pre>
					</a>
				</div>
				<div class="form-group">
					<label class="font">Host :</label>
					<pre class="font ellip">${dto.host_name}</pre>
				</div>
				<div class="form-group">
					<label class="font">Intro :</label>
					<pre class="font ellip">${dto.intro}</pre>
				</div>
				<div class="form-group avg">
					<c:set var="img" value="${dto.img}"/>
					<img class="image" src="../save/${fn:split(img,',')[0]}">
				</div>
				<div class="form-group center">
					<button type="button" class="btn btn-danger btn-sm font"
						style="width: 60px;"onclick="location.href='delete.do?num=${dto.num}&pageNum=${currentPage}'">삭제</button>
					<button type="button" class="btn btn-info btn-sm font"
						style="width: 60px;"onclick="location.href='updateform.do?num=${dto.num}&pageNum=${currentPage}'">수정</button>
				</div>
			</div>
		</c:forEach>
		<c:if test="<%=cnt==0%>">
		<h3 class="font">
			<label>등록한 숙소가 없습니다</label>
		</h3>
	</c:if>
	</div>
</div>
</body>
</html>