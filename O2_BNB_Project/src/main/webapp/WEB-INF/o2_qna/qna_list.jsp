<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">



li {float:left; list-style:none; margin:1px;}

li a {display:block; width:50px;  background:lightblue; color:#fff; font-size:12px; font-family:"돋움";

 text-align:center; padding-top:10px; text-decoration:none;}

li a span {display:block;}

li a:hover {background:#099; text-decoration:none;}

</style>
</head>
<body>

<div>
<table class="table table-bordered" style="width: 800px; ">
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
	
</table>
</div>

<!-- 페이지 번호 출력 -->
<div style="width: 600px; text-align: center; " >
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
</div>
<br><br>
<a href="qna_form.do">글쓰기</a>

&nbsp;&nbsp;
<a href="../index.jsp">메인으로 가기</a>
</body>
</html>