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
<script type="text/javascript" src="<c:url value='../js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='../js/sockjs-0.3.4.js'/>"></script>
</head> 
<body>
	<!-- 유저 아이디 -->
	<input type="hidden" id="login_id" value="${id}">
	<!-- 현재 유저가 접속한 방이름 -->
	<input type="hidden" id="room" value="${room}">
	<!-- 호스트 아이디 -->
	<input type="hidden" id="host_id" value="${host_id}">
	<!-- 방 이름 / 방 만들기 / 방 나가기 -->
	<table style="width: 900px; ">
		<tr>
			<td align="center" style="width: 600px; color:black;" colspan="2">
				<!-- 방이름 -->
				<c:if test="${room_ch==null}">
					<h2>방이름 : <b>${room}</b></h2>
				</c:if>
				<c:if test="${room_ch!=null}">
					<c:if test="${room==null}">
						<h2>선택된 채팅방이 없습니다.</h2>
					</c:if>
					<c:if test="${room!=null}">
						<h2>방이름 : <b>${room}</b></h2>
					</c:if>
				</c:if>
			</td>
			<!-- <td align="center" style="width: 300px;">
				방 만들기 / 방 나가기 버튼
				<input type="button" value="방 만들기" id="createRoom">&nbsp;&nbsp;
				<input type="button" value="나가기" id="backBtn">
			</td> -->
		</tr>
	</table>
	
	<!-- 채팅방 구현하기 위한 테이블 -->
	<table align="center" style="height: 600px; width: 900px; margin: 0; padding: :0;">
		<!-- 왼쪽 채팅창 출력 -->
		<%-- <col width="200px;"> --%>	<!-- 귀속말 영역 -->
		<col width="500px;">	<!-- 메세지 입력 영역 -->
		<!-- 오른쪽 리스트 출력 -->
		<col width="400px;">	<!-- 보내기 영역 -->
		
		<tr height="600px;">
			<!-- 채팅내용 출력 -->
			<c:if test="${room_ch==null}">
				<td style="width: 550px;" colspan="3">
			</c:if>
			<c:if test="${room_ch!=null}">
				<td style="width: 550px;" colspan="2">
			</c:if>
				<div style="width: 100%; height: 550px; overflow-y: scroll; overflow-w:inherit;"
				 id = "output">
				 <c:if test="${list!=null}">
				 	<c:forEach var="dto" items="${list}">
				 		<c:if test="${dto.writer==sessionScope.login_id}">
				 			<div style="color:blue; text-align: right;">${dto.content}</div>
				 		</c:if>
				 		<c:if test="${dto.writer!=sessionScope.login_id}">
				 			<div style="text-align: left;">${dto.content}</div>
				 		</c:if>
				 	</c:forEach>
				 </c:if>
				</div>
			</td>
			<c:if test="${room_ch!=null}">
				<td style="width: 400px; height: 550px;">
					<c:if test="${room_list==null || room_list.size()==0}">
						채팅방 없음
					</c:if>
					<c:if test="${room_ch!=null}">
						<c:forEach var="room_dto" items="${room_list}">
							<div class="ch_dto" room_name="${room_dto.room_name}">
								${room_dto.room_name}
							<img src="../image/del.png" style="width: 10px; height: 10px;"
								 class="chat_exit" room_name="${room_dto.room_name}">
							</div>
						</c:forEach>
					</c:if>
				</td>
			</c:if>
			<!-- 채팅방 목록 -->
			<!-- <td style="width: 300px;">
				채팅방
				<form action="MoveChatRoom.do" method="post" id="moveChatForm">
					<input type="hidden" name="roomName" value="">
					<div style="width: 300px; height: 100px; overflow-y: scroll; overflow-x:inherit; "
					 id="room">
						전체 채팅방
						<div id="getRoomList">
							<div class="item">
								<div class="content">
									<b title="전체 채팅입니다.">전체 채팅방</b>
								</div>
							</div>
						</div>
					</div>
				</form> -->
				<!-- <input type="text" style="width: 200px; height: 32px;" placeholder="방 제목"
				 id="searchRoomText">
				 &nbsp;&nbsp;&nbsp;
				<input type="button" value="검색" style="width: 80px; height: 30px;"
				 id="searchRoomBtn"> -->
				 
				 <!-- 방만들기 form 이용 -->
				 <%-- <form action="createChatRoom.do" method="post" id="createForm">
				 	<!-- hidden 정보 -->
				 	<!-- 방 제목 중복 확인 여부 -->
				 	<input type="hidden" id="chkRoomName" value="">
				 	
				 	<div style="width: 300px; height: 500px; display: none;"
				 	 id="showCreateRoom">
				 		<!-- 방만들기 테이블 -->
				 		<table style="width: 100%; height: 100%;">
				 			<col width="80px;">
				 			<!-- 방 제목 -->
				 			<tr style="padding: 1px; margin: 1px;">
				 				<th>방제목</th>
				 				<td>
				 					<input type="text" name="name" placeholder="방이름" size="8"
				 					 style="font-weight: bold; width: 100%; height: 15px;">
				 				</td>
				 			</tr>
				 			
				 			<!-- 비밀번호 -->
				 			<tr>
				 				<th>비밀번호</th>
				 				<td>
				 					<input type="text" name="pwd" placeholder="pwd" size="8"
				 					 style="font-weight: bold; width: 100%; height: 15px;"
				 					 title="작성하지 않을 경우 공개방으로 생성됩니다.">
				 				</td>
				 			</tr>
				 			
				 			<!-- 참여인원 -->
				 			<tr>
				 				<th>참여인원</th>
				 				<td>
				 					<a href="#none">
				 						<img src="../image/heart_out.png" onclick="count_back()" width="13px"
				 						 title="1명 감소">
				 					</a>
				 					<input type="text" name="totalcount" value="4" size="2"
				 					 readonly="readonly" id="count" style="height: 15px; 
				 					 font-weight: bold;">
				 					<a href="#none">
				 						<img src="../image/heart_in.png" onclick="count_next()" width="13px;"
				 						 title="1명 증가">
				 					</a>
				 				</td>
				 			</tr>
				 			
				 			<!-- 내용 입력 -->
				 			<tr>
				 				<th>내용</th>
				 				<td>
				 					<input type="text" name="content" placeholder="내용"
				 					 style="font-weight: bold; width: 100%; height: 15px;">
				 				</td>
				 			</tr>
				 			
				 			<!-- 버튼 처리 -->
				 			<tr>
				 				<td colspan="2">
				 					<input type="button" id="submitBtn" value="방만들기">
				 					<input type="button" id="backBtn" value="돌아가기">
				 				</td>
				 			</tr>
				 		</table>
				 	</div>
				 </form> --%>
				 
				 <!-- 채팅참여자 출력 -->
				 <!-- <div style="width: 100%; height: 400px; overflow-y: scroll;" id="listPeople">
				 </div>
			</td> -->
		</tr>
		
		<!-- 입력 창 -->
		<tr height="100px;">
			<!-- 귓말 대상 아이디 입력 -->
			<!-- <td>
				<input type="text" id="wisper" style="width: 100%; height: 100%; font-weight: bold;"
				 name="who" placeholder="귀속말">
			</td> -->
			<!-- 보낼 메세지 입력 -->
			<td>
				<input type="text" id="textID" size="50" style="width: 100%; height: 100%; 
				 font-weight: bold;" name="chatInput" placeholder="내용 입력">
			</td>
			<!-- 보내기 버튼 -->
			<td>
				<input type="button" value="보내기" id="buttonMessage" style="width: 100%; height: 100%;">
			</td>
		</tr>
	</table>
	<script type="text/javascript">
	if('${room_first}'== '') {
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
			
			// 접속자 리스트
/* 			var jsonData2 = JSON.parse(message.data);
			
			if(jsonData2.list!=null) {
				$("#listPeople").html(jsonData2.list);
			} */
			
			// 방정보
			/* var jsonData3 = JSON.parse(message.data);
			
			if(jsonData3.room!=null) {
				var roomSplit = jsonData3.room.split(",");
				
				var str = "<div class='item'><div class='content'>" + 
						  "<b title='전체채팅입니다.' class='chatRoom' " +
						  "onclick=\"moveRoom('all', 0, 10000, 'null')\">" +
						  "전체채팅방</b> (총 " + roomSplit[0] + "명 참여)</div></div>"
						  ;
						  
				for(var i=1; i<roomSplit.length;i++) {
					var spl = roomSplit[i].split("/");
					
					if(spl[0]=="방이 존재하지 않습니다.") {
						str += "<div class='item'><div class='content'><b title='방이존재하지 않습니다.'>"
							+  spl[0] + "</b></div></div>"
							;
					} else {
						// 방이름 : spl[0], 남은인원수 : spl[1], 전체인원수 : spl[2], 방내용 : spl[3]
						str += "<div class='item'><div class='content'><b title'"
							+  spl[3] +"' class='chatRoom' onclick=\"moveRoom('" + spl[0] + "','"
							+  spl[1] + "','" + spl[2] + "','" + spl[4] + "')\">"
							+  spl[0] + "</b> (" + spl[1] + "/" + spl[2] +")</div></div>"
							;
					}
				}
				
				$("#getRoomList").html(str);
			} */
		}
		
		// 닫힐때
		ws.onclose = function(event) {};
		
		// 방이동 처리함수
		/* function moveRoom(room, remaincount, totalcount, pwd) {
			// 현재자신이 있는 방
			var currentRoom = $("#room").val();
			
			if(room==currentRoom) {
				// 들어가는방과 현재자신의 방이 같음
				alert("이미 방에 있음");
			}
			// 방이동
			else {
				if(remaincount<totalcount) {
					if(pwd!="null") {
						var chkPwd = prompt("비밀번호를 입력하세여.");
						if(chkPwd==pwd) {
							$("[name='roomName']").val(room);
							$("#moveChatForm").attr("target", "_self").submit();
						} else {
							alert("비밀번호 틀림");
						}
					} else {
						// 비밀번호가 없다면 바로 이동
						$("[name='roomName']").val(room);
						$("#moveChatForm").atte("target", "_self").submit();
					}
				} else {
					alert("인원수 꽉참");
				}
			}
		} */
		
		// 방만들기
/* 		$("#createRoom").click(function() {
			$("#listPeople").slideToggle(300);
			$("#showCreateRoom").slideToggle(300);
		}); */
		
		// 방나가기
		$("#backBtn").click(function() {
			location.href = "test.do";
		});
		
		// 방제목 중복확인
		/* $("[name='name']").blur(function() {
			var name = $("[name='name']").val();
			
			if(name!="") {
				$.ajax({
					type : "post",
					url : "./checkRoom.do",
					async : ture,
					data : "name="+name,
					success : function(msg) {
						if(msg=="1") {
							$("#checkRoomName").val(name);
						} else if(msg=="0") {
							alert("이미 존재하는 방");
							$("[name='name']").val("");
							$("[name='name']").focus();
						}
					}
				});
			}
		}); */
		
		// 인원수 증가, 감소
		/* function count_back() {
			var count = $("#count").val();
			count = (Number(count)-1);
			if(count>=2) {
				$("#count").val(count);
			}
		}
		
		function count_next() {
			var count = $("#count").val();
			count = (Number(count)+1);
			if($("#count").val()<30) {
				$("#count").val(count);
			}
		} */
		
		// 버튼처리
		/* $("#submitBtn").click(function() {
			if($("[name='name']").val().length<1) {
				alert("방제목 입력해라");
				$("[name='name']").focus();
			} else if($("[name='name']").val()=="all") {
				alert("all은 안됨");
			} else if($("[name='content']").val().length<1) {
				alert("방 설명 써라");
				$("[name='content']").focus();
			} else {
				// form 처리
				$("#createForm").attr("target", "_self").submit();
			}
		});
		
		$("#backBtn").click(function() {
			$("form").each(function() {
				this.reset();
			});
			$("#listPeople").slideToggle(300);
			$("#showCreateRoom").slideToggle(300);
		}); */
		
		// 접속자 명단에서 아이디 클릭시 귀속말 바로 셋팅
		/* function insertWisper(id) {
			if($("#userId").val()==id) {
				alert("본인에게는 귀속말 금지");
			} else {
				$("#wisper").val(id);
			}
		}
		
		$("#wisper").click(function() {
			$("#wisper").val("");
		}); */
	}
	</script>
</body>
</html>
