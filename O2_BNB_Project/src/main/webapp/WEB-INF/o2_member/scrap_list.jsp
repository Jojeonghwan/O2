<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<link rel="stylesheet" href="../css/scrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head> 
<body>
<c:import url="/header_black.do"/>
<div class="container" id="scrap_list">
<h1 class="my-5 font main_font" style="color : #ff5a5f;">
	Scrap
</h1>
	<c:if test="${cnt==0}">
		<table class="table table-hover">
		<thead>
			<tr>
				<th>
					<input type="checkbox" id="all_ch"> Del
				</th>
				<th>No</th>
				<th>Home Name/Host Name</th>
				<th>Score</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="4" style="text-align: center;">스크랩한 게시물이 없습니다.</td>
			</tr>
		</tbody>
		</table>
	</c:if>
	<c:if test="${cnt!=0}">
	<input type="hidden" id="currentPage" value="${currentPage}">
		<table class="table table-hover">
			<thead>
			<tr>
				<th>
					<input type="checkbox" id="all_ch"> Del
				</th>
				<th>No</th>
				<th>Home Name/Host Name</th>
				<th>Score</th>
			</tr>
			</thead>
			<tbody>
		<c:forEach var="dto" items="${list}">
				<tr>
					<td>
						<input type="checkbox" name="del_nums" sc_num="${dto.num}">
					</td>
					<td class="home_info" h_num="${dto.h_num}">${no}</td>
					<c:set var="no" value="${no-1}"/>
					<td class="home_info subject" h_num="${dto.h_num}" scrap_list_img="${dto.img_name}">
						${dto.home_name}
					</td>
					<td class="home_info" h_num="${dto.h_num}">
						<fmt:formatNumber value="${dto.score}" pattern="#.##"/>
					</td>
				</tr>
			</c:forEach>
			</tbody>
	</table>
	<button class="scrap_delete" id="Del">Delete</button>
		<div class="row">
			<div class="col">
			<ul class="pagination" style="justify-content: center;">
				<c:if test="${startPage>1}">
					<li class="page-item"><a class="page-link" href="scrap_list?pageNum=${1}" style="colr: black;">＜＜</a></li>
					<li class="page-item"><a class="page-link" href="scrap_list?pageNum=${startPage-1}" style="colr: black;">◀</a></li>
				</c:if>
				<c:forEach var="pp" begin="${startPage}" end="${endPage}">
					<c:if test="${pp==currentPage}">
						<li class="page-item"><a class="page-link" href="scrap_list?pageNum=${pp}" style="color: red;">${pp}</a></li>
					</c:if>
					<c:if test="${pp!=currentPage}">
						<li class="page-item"><a class="page-link" href="scrap_list?pageNum=${pp}" style="colr: black;">${pp}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${endPage<tot_cnt && endPage!=totPage}">
					<li class="page-item"><a class="page-link" href="scrap_list?pageNum=${endPage+1}" style="colr: black;">▶</a></li>
					<li class="page-item"><a class="page-link" href="scrap_list?pageNum=${totPage}" style="colr: black;">＞＞</a></li>
				</c:if>
			</ul>
			</div>
		</div>
	</c:if>
</div>
<div id="dialog">
	<img class="scarp_list_img">
</div>
</body>
</html>