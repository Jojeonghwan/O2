<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8c8c41484005696a06aceab619299c52&libraries=services,clusterer,drawing"></script>
</head>
<body>
<div>
		<c:forEach var="dto" items="${host_list}" varStatus="status">
			<b>no.${status.index+1}</b>
			<br>
			<table class="table table-bordered" style="width: 500px;">
				<tr>
					<td>
					<a href="../board/content.do?num=${dto.num}&pageNum=${currentPage}">Home_Name: ${dto.home_name}</a><br>
					Host: ${dto.host_name}<span style="margin-left: 200px;"><br>
					Intro: ${dto.intro}<br>
					</span> <br>
					<br> <pre></pre> <br> 
					<c:if test="${dto.img!='noimage'}">
							<c:forTokens var="myimg" items="${dto.img}" delims=",">
								<a href="../save/${myimg}" target="_new"> <img
									src="../save/${myimg}" style="width: 400px;"
									class="img-thumbnail"></a>
								<!-- img-thumbnail,img-circle,img-rounded -->
							</c:forTokens>
						</c:if>
					</td>
				</tr>
			</table>
			<span style="margin-left: 200px;">
				<button type="button" class="btn btn-danger btn-sm"
					style="width: 60px;"onclick="location.href='delete.do?num=${dto.num}&pageNum=${currentPage}'">삭제</button>
				<button type="button" class="btn btn-info btn-sm"
					style="width: 60px;"onclick="location.href='updateform.do?num=${dto.num}&pageNum=${currentPage}'">수정</button>
			</span>
			<br> 
			<br>
			<br>
		</c:forEach>
</div>
</div>
</body>
</html>