<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="../js/chat.js"></script>
<link rel="stylesheet" href="../css/chat.css">
<%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<c:url value='../js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='../js/sockjs-0.3.4.js'/>"></script> --%>
</head> 
<body>
	<!-- 유저 아이디 -->
	<input type="hidden" id="login_id" value="${id}">
	<!-- 현재 유저가 접속한 방이름 -->
	<input type="hidden" id="room" value="${room}">
	<!-- 호스트 아이디 -->
	<input type="hidden" id="host_id" value="${host_id}">
	<a href="../index.jsp">Main</a>
	
<div id="chat_form" class="container" >
	<c:if test="${room_ch==null}">
		<h2>방이름&lt;<b>${room}</b>&gt;</h2>
	</c:if>
	<c:if test="${room_ch!=null}">
		<c:if test="${room==null || room=='채팅방 선택'}">
			<h2>선택된 채팅방이 없습니다.</h2>
			<br>
		</c:if>
		<c:if test="${room!=null && room!='채팅방 선택'}">
			<h2>방이름&lt;<b>${room}</b>&gt;</h2>
			<a href="#" id="chat_exit" room_name="${room}">Exit</a><br>
		</c:if>
	</c:if>
	
	<!-- 채팅방 구현하기 위한 테이블 -->
	<table>
		<tr>
			<td>
				<div style="width: 100%; height: 400px; overflow-y: scroll; overflow-w:inherit;"
				 id = "output">
				 <c:if test="${list!=null}">
				 	<c:forEach var="dto" items="${list}">
				 		<c:if test="${dto.writer==sessionScope.login_id}">
				 			<div style="color: blue; text-align: right;">${dto.content}</div>
				 		</c:if>
				 		<c:if test="${dto.writer!=sessionScope.login_id}">
				 			<div style="text-align: left;">${dto.content}</div>
				 		</c:if>
				 	</c:forEach>
				 </c:if>
				</div>
			</td>
		</tr>
		
		<!-- 입력 창 -->
		<tr>
			<td colspan="3">
				<c:if test="${room_ch!=null}">
				<select id="chat_room_list" style="height: 30px; margin-left: 20px;">
					<c:if test="${room_list==null || room_list.size()==0}">
						채팅방 없음
					</c:if>
					<c:if test="${room_ch!=null}">
						채팅방
						<option class="ch_dto" selected="selected">채팅방 선택</option>
						<c:forEach var="room_dto" items="${room_list}">
							<option class="ch_dto" value="${room_dto.room_name}">
								${room_dto.room_name}
							</option>
						</c:forEach>
					</c:if>
				</select>
				</c:if>
			<div class="form-group" style="display: inline-block;">
				<input type="text" id="textID" size="50" style="width: 80%; height: 22px;
				 margin-left: 0; margin-right: 10px; padding-top: 3px;"
				 name="chatInput" placeholder="Message">
				<input type="button" value="Send" id="buttonMessage" style="width: 10%; height: 30px;">
			</div>
			</td>
		</tr>
	</table>
</div>
	<script type="text/javascript">
	$("#buttonMessage").click(function() {
		if('${room_first}'!= '' || '${room}'=='채팅방 선택') {
			$("#textID").val("");
			$("#textID").focus();
			alert("채팅방을 선택해 주세요.");
		}
	});
	
	$("#textID").keypress(function(event) {
		if(event.which=="13") {
			event.preventDefault();
			if('${room_first}'!= '' || '${room}'=='채팅방 선택') {
				$("#textID").val("");
				$("#textID").focus();
				alert("채팅방을 선택해 주세요.");
			}
		}
	});
	
	if('${room_first}'== '' && '${room}'!='채팅방 선택') {
		var sock = null;
		var ip = '${sessionScope.ip}';
		/* 처음 접속시 메세지 입력창에 포커스 시킴 */
		$("#textID").focus();
		var ws = null;
		// 서버로 접속시에는 localhost로 - 관리자
		// 그 외는 본인의 아이피로
		if(ip=="0:0:0:0:0:0:0:1") {
			ws = new WebSocket("ws://localhost:9000/O2_BNB_Project/echo");
		}
		else {
			ws = new WebSocket("ws://192.168.0.156:9000/O2_BNB_Project/echo");
		}
		
		// 서버로 메세지 보낼때
		ws.onopen = function() {
			// 처음 접속시에만 채팅방에 추가함(현재 방정보도 같이 출력)
			/* $("#output").append("<b>채팅방에 참여하였습니다.</b> : " + $("#room").val()+"<br>"); */
			
			// 보내기 버튼 눌렀을 때
			$("#buttonMessage").click(function() {
				// 메세지
				var msg = $("input[name=chatInput]").val().trim("!%/");
				// 방이름(전체카톡이면 all)
				var room = $("#room").val().trim("!%/");

				// 소켓에 메세지 전달
				ws.send(msg+"!%/"+room);
				$("#output").append("<div style='color:blue; text-align: right;'>"+msg+"</div>");
				// 글 입력시 무조건 하단으로 보냄
				$("#output").scrollTop(99999999);
				// 입력 후 창 초기화
				$("#textID").val("");
				// 입력 창에 포커스 시킴
				$("#textID").focus();
			});
			
			// 엔터키 입력 처리
			$("#textID").keypress(function(event) {
				if(event.which=="13") {
					event.preventDefault();
					// 메세지
					var msg = $("input[name=chatInput]").val().trim("!%/");
					// 방이름 - 전체단톡이면 all
					var room = $("#room").val().trim("!%/");
					
					// 소켓에 메세지 전달
					ws.send(msg+"!%/"+room);
					$("#output").append("<div style='color:blue; text-align: right;'>"+msg+"</div>");
					// 글 입력시 무조건 하단으로 보냄
					$("#output").scrollTop(99999999);
					// 입력 후 창 초기화
					$("#textID").val("");
					// 입력 창에 포커스 시킴
					$("#textID").focus();
				}
			
			});
		}
		
		// 서버로부터 받은 메세지 보내주기
		ws.onmessage = function(message) {
			// 메세지
			var jsonData = JSON.parse(message.data);
			
			if(jsonData.message!=null) {
				$("#output").append(jsonData.message);
				$("#output").scrollTop(99999999);
			}
		}
		
		// 닫힐때
		ws.onclose = function(event) {};
	}
	</script>
</body>
</html>
