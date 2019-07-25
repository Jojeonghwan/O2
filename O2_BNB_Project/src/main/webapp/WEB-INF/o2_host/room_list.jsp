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
		<hr align="left" width="400" size="5" color="gray">
		<c:forEach var="dto" items="${host_list}" varStatus="status">
			<b>no.${status.index}</b>
			<br>
			<table class="table table-bordered" style="width: 500px;">
				<tr>
					<td>
					<a href="../board/content.do?num=${dto.num}&pageNum=${currentPage}">Home_Name: ${dto.home_name}</a><br>
					Host: ${dto.host_name}<span style="margin-left: 200px;"><br>
					Intro: ${dto.intro}<br>
					<!-- Location:<input type="text" id="addr_result" style="background-color:transparent;border:0 solid black;text-align:left;">  -->
						<input type=hidden class="addr" value="${dto.addr}">
						<!-- <script>
							$("#addr_result")
							var addr = '${dto.addr}';
							var addr_arr = addr.split('/');
							var addr_arr_arr = addr_arr[1].split(' ');
							var addr_result=addr_arr_arr[0]+" "+addr_arr_arr[1];
							$(this).("#addr_result").val(addr_result);
							console.log(addr_result);
						</script> -->
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

		<%-- <!-- paging -->
		<div style="width: 600px;text-align: center;font-size: 15pt;">
     <ul class="pagination">
     	<c:if test="${startPage>1}">
		 	<li>
		    	<a href="list.do?pageNum=${startPage-1}">◀</a>
		 	</li>
	 	</c:if>
     	<c:forEach var="pp" begin="${startPage}" end="${endPage}">
     		<li>
     			<c:if test="${pp==currentPage}">
     			<a href="list.do?pageNum=${pp}" style="color:red;">${pp}</a>
     			</c:if>
     			<c:if test="${pp!=currentPage}">
     			<a href="list.do?pageNum=${pp}" style="color:black;">${pp}</a>
     			</c:if>
     		</li>
     	</c:forEach>
     	<c:if test="${endPage<totalPage}">
	     	<li>
	     		<a href="list.do?pageNum=${endPage+1}">▶</a>
	     	</li>
     	</c:if>
     </ul> --%>
</div>
</div>
</body>
</html>