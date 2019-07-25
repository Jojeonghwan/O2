<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
</head> 
<body>
	<c:if test="${cnt==0}">
		<table border="1">
			<tr>
				<th>no</th>
				<th>host_name</th>
				<th>img</th>
				<th>score</th>
			</tr>
			<tr>
				<td colspan="4">스크랩한 게시물이 없습니다.</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${cnt!=0}">
	<input type="hidden" id="currentPage" value="${currentPage}">
		<table border="1">
			<tr>
				<th>del
					<input type="checkbox" id="all_ch">
				</th>
				<th>no</th>
				<th>host_name</th>
				<th>img</th>
				<th>score</th>
			</tr>
		<c:forEach var="dto" items="${list}">
				<tr>
					<td>
						<input type="checkbox" name="del_nums" sc_num="${dto.num}">
					</td>
					<td class="home_info" h_num="${dto.h_num}">${no}</td>
					<c:set var="no" value="${no-1}"/>
					<td class="home_info" h_num="${dto.h_num}">${dto.home_name}</td>
					<td class="home_info" h_num="${dto.h_num}">${dto.img_name}</td>
					<td class="home_info" h_num="${dto.h_num}">${dto.score}</td>
				</tr>
			</c:forEach>
	</table>
	<div id="Del">삭제하기</div>
		<div id="page">
			<ul>
				<c:if test="${startPage>1}">
					<li><a href="scrap_list?pageNum=${1}" style="colr: black;">＜＜</a></li>
					<li><a href="scrap_list?pageNum=${startPage-1}" style="colr: black;">◀</a></li>
				</c:if>
				<c:forEach var="pp" begin="${startPage}" end="${endPage}">
					<c:if test="${pp==currentPage}">
						<li><a href="scrap_list?pageNum=${pp}" style="color: red;">${pp}</a></li>
					</c:if>
					<c:if test="${pp!=currentPage}">
						<li><a href="scrap_list?pageNum=${pp}" style="colr: black;">${pp}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${endPage<tot_cnt && endPage!=totPage}">
					<li><a href="scrap_list?pageNum=${endPage+1}" style="colr: black;">▶</a></li>
					<li><a href="scrap_list?pageNum=${totPage}" style="colr: black;">＞＞</a></li>
				</c:if>
			</ul>
		</div>
	</c:if>
</body>
</html>