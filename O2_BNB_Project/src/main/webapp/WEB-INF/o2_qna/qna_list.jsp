<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/qna_sy.js"></script>
<link rel="stylesheet" href="../css/qna.css">
</head>
<body>
<c:import url="/header_black2.do"/>

<div class="container" id="qna_list" style="width: 800px;">
	<h1 class="my-5 font main_font" style="color : #ff5a5f;">
		QNA
	</h1>
	<div style="text-align: right;">
		<a href="qna_form.do" id="qna_write">Write</a>
	</div>
	<c:if test="${totalCount==0}">
		<table class="table table-hover" >
		<thead>
			<tr>
				<th>No</th>
				<th>ID</th>
				<th>Subject</th>
				<th>WriteDay</th>
			</tr>
			<tr>
				<th colspan="4" style="text-align: center;">문의사항이 없습니다.</th>
			</tr>
		</thead>
		</table>
	</c:if>
	<c:if test="${totalCount!=0}">
	<input type="hidden" id="currentPage" value="${currentPage}">
		<table class="table table-hover">
			<thead>
			<tr>
				<th>No</th>
				<th>ID</th>
				<th>Subject</th>
				<th>WriteDay</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="dto" items="${qna_list}">
				<tr class="qna_content" num="${dto.num}" pageNum="${currentPage}">
					<td>${no}</td>
					<c:set var="no" value="${no-1}"/>
					<td>
						${dto.id}
					</td>
					<td>
						${dto.subject}
					</td>
					<td>
						<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="row">
			<div class="col">
			<ul class="pagination" style="justify-content: center;">
				<c:if test="${startPage>1}">
					<li class="page-item"><a class="page-link" href="qna_list.do?pageNum=${1}" style="colr: black;">＜＜</a></li>
					<li class="page-item"><a class="page-link" href="qna_list.do?pageNum=${startPage-1}" style="colr: black;">◀</a></li>
				</c:if>
				<c:forEach var="pp" begin="${startPage}" end="${endPage}">
					<c:if test="${pp==currentPage}">
						<li class="page-item"><a class="page-link" href="qna_list.do?pageNum=${pp}" style="color: red;">${pp}</a></li>
					</c:if>
					<c:if test="${pp!=currentPage}">
						<li class="page-item"><a class="page-link" href="qna_list.do?pageNum=${pp}" style="colr: black;">${pp}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${endPage<totalCount && endPage!=totalPage}">
					<li class="page-item"><a class="page-link" href="qna_list.do?pageNum=${endPage+1}" style="colr: black;">▶</a></li>
					<li class="page-item"><a class="page-link" href="qna_list.do?pageNum=${totalPage}" style="colr: black;">＞＞</a></li>
				</c:if>
			</ul>
			</div>
		</div>
	</c:if>
</div>
<%-- <table class="table table-bordered" style="width: 800px; ">
	<caption><b>게시판 목록</b></caption>
	<tr style="background: #f5f5dc;">
		<td style="width: 60px;">번    호</td>
		<td style="width: 150px;" colspan="2" align="center">문    의</td>
		<td style="width: 120px;">아 이 디</td>
		<td style="width: 100px;">작 성 일</td>
	</tr>
	
	<c:forEach var="n_dto" items="${qna_notice_list}">
	<c:if test="${dto.q_type == 1}">
		<tr id="notice"> <!-- 공지사항 -->
				<td align="center">◎</td>
				<td align="center" style="width: 50px;">공지사항</td>
				<td>				
					<a href="qna_content.do?num=${n_dto.num}&pageNum=${currentPage}" 
					style="color: red;">${n_dto.subject}</a>
				</td>
				<td align="center">${n_dto.id}</td>
				<td align="center">
					<fmt:formatDate value="${n_dto.writeday}" pattern="yyyy-MM-dd"/>
				</td>
		</tr>
	</c:if>
	</c:forEach>
	
	
	<c:forEach var="dto" items="${qna_list}">
	<c:if test="${dto.q_type != 1}">
		<tr id="users"> <!-- 일반문의글 -->
				<td align="center">${no}</td>
				<c:set var="no" value="${no-1}"/> <!-- 이래야 전달받은 값으로부터 1씩 줄어든다 -->
				<td align="center" style="width: 50px;">
					<c:if test="${dto.q_type == 2}">
						환불
					</c:if>
					<c:if test="${dto.q_type == 3}">
						사용자
					</c:if>
					<c:if test="${dto.q_type == 4}">
						기타
					</c:if>
				</td>
				<td>				
					<a href="qna_content.do?num=${dto.num}&pageNum=${currentPage}">${dto.subject}</a>
				</td>
				<td align="center">${dto.id}</td>
				<td align="center">
					<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
				</td>
		</tr>
	</c:if>
	</c:forEach>
	
</table> --%>


<!-- 페이지 번호 출력 -->
<%-- <div style="width: 600px; text-align: center; " >
	<ul class="pagination"><!-- 페이징처리 부트스트랩 -->
	<c:if test="${startPage>1}">
		<li>
			<a href="list.do?pageNum=${startPage-1}">◀</a>
		</li>
	</c:if>
	
		<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			<c:if test="${pp==currentPage}">
				<li><a href="qna_list.do?pageNum=${pp}&id=${sessionScope.login_id}" style="color:red;">${pp}</a></li>
			</c:if>
			<c:if test="${pp!=currentPage}">
				<li><a href="qna_list.do?pageNum=${pp}&id=${sessionScope.login_id}" style="color:black;">${pp}</a></li>
			</c:if>
		</c:forEach>
		
	<c:if test="${endPage<totalPage}">
		<li>
			<a href="list.do?pageNum=${endPage+1}">▶</a>
		</li>
	</c:if>
	</ul>
</div> --%>
</body>
</html>