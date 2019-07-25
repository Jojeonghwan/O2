package o2.util;

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;

import o2.data.chat_room_dto;
import o2.data.chat_content_dto;
import o2.service.chat_service_imple;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class Websocket extends TextWebSocketHandler{
	// Service 접근 : db 처리를 위해서
		@Autowired
		chat_service_imple service;
		
		private static final Logger logger = LoggerFactory.getLogger(Websocket.class);
		
		// 서버에 연결된 사용자들을 저장하기 위해 선언
		// 메세지를 날려주기 위한 웹소켓 전용 세션
		private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
		// 실제 세션의 id정보, web 소켓 정보
		private Map<WebSocketSession, String> mapList = new HashMap<WebSocketSession, String>();
		// 실제 세션의 id정보, room 정보
		private Map<WebSocketSession, String> roomList = new HashMap<WebSocketSession, String>();
		// 접속자 명단을 개개인별로 뿌려주기위해 선언한 일반리스트
		private List<String> userList = new ArrayList<String>();
		
		// 연결되었을때
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception{
			System.out.println("1. web-시작");
			
			// 1. 로그인 아이디와 방이름 가져오기 - 채팅방 정보 찾을시 필요
			Map<String, Object> map = session.getAttributes();
			String session_id = map.get("login_id").toString();
			String room_name = map.get("room_name").toString();
			System.out.println("2. web-로그인아이디, 방이름 : " + session_id+", "+room_name);
			
			// 2. 맵에 세션, 방이름 담기
			roomList.put(session, room_name);
			
			// 3. 맵에 세션, 아이디 담기
			mapList.put(session, session_id);
			
			// 4. 맵을 사용하지 않을 경우를 대비해 리스트에도 담기
			sessionList.add(session);
			System.out.println("3. web-roomList, mapList, sessionList : " +
							   room_name+", " + session_id+", "+session+"담음");
			
			// 5. 접속 정보 알리기
			/*for(int i=0; i<sessionList.size(); i++) {
				if(room_name.equals(roomList.get(sessionList.get(i)))) {
					// 6-1. 접속 정보 같은 방 사람에게만 보내기
					sessionList.get(i).sendMessage(new TextMessage(JsonDataOpen(session_id)));
				}
			}*/
			
		}
		
		// 통신끊었을떄
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
			//1. 현재 접속한 사람의 로그인 정보 가져오기
			Map<String, Object> map = session.getAttributes();
/*			String userId = map.get("login_id").toString();
			String room_name = map.get("room_name").toString();*/
			
			/*chat_room_dto ch_room_dto = service.chat_room_dto(map.get("room_name").toString());
			if(ch_room_dto.getPerson().equals("1")) {
				// 3. 채팅 내용 인설트 하기
				chat_content_dto ch_con_dto = new chat_content_dto();
				ch_con_dto.setContent("상대방이 나간 채팅방");
				ch_con_dto.setWriter(map.get("login_id").toString());
				ch_con_dto.setIp(map.get("ip").toString());
				ch_con_dto.setRoom_name(map.get("room_name").toString());
				service.chat_con_in(ch_con_dto);
			}*/
			
			//2. 해당 유저의 roomList, mapList, sessionList를 제거한다.
			//   미리 제거해야 본인을 제외한 모든 사람들에게 본인의 정보를 날려줄 수가 있음
			roomList.remove(session);		// key : 세션 , value : 방이름
			mapList.remove(session);		// key : 세션 , value : 아이디
			sessionList.remove(session); 	// 실제 websocket 세션명

			
			//3. 본인 제외하고 본인이 잇던방의 모든 사람들에게 나갔음을 알림
/*			for(int i=0; i<sessionList.size(); i++) {
				if(room_name.equals(roomList.get(sessionList.get(i)))) {
					sessionList.get(i).sendMessage(new TextMessage(JsonDataClose(userId)));
				}
			}*/
		}
		
		
		// 서버가 클라이언트로부터 메세지 받은 경우
		@Override
		public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			System.out.println("1. web-msg-시작");
			// 1. 세션 로그인 얻기, 방이름 얻기
			Map<String, Object> map = session.getAttributes();
			String id = map.get("login_id").toString();
			String room_name = map.get("room_name").toString();
			String ip = map.get("ip").toString();
			
			// 2. 넘어온 메세지 값 분리하기 
			String msgArr[] = new String[2];
			msgArr = message.getPayload().split("!%/");
			
			// 3. 채팅 내용 인설트 하기
			chat_content_dto ch_con_dto = new chat_content_dto();
			System.out.println("채팅 내용 : "+msgArr[0]);
			ch_con_dto.setContent(msgArr[0]);
			ch_con_dto.setWriter(id);
			ch_con_dto.setIp(ip);
			ch_con_dto.setRoom_name(room_name);
			service.chat_con_in(ch_con_dto);
			
			// 4. 같은방 멤버에게만 보내기
			for(WebSocketSession sess : sessionList) {
				if(msgArr[1].equals(roomList.get(sess))) {
					// 3-1. 나를 제외한 같은방 멤버에게만 보내기
					if(!session.getId().equals(sess.getId())) {
						sess.sendMessage(new TextMessage(JsonData(id, msgArr[0])));
					}
				}
			}
			
			logger.info("메세지 : " + message);
		}
		
		// json 형태로 메세지 변환 - 일반 메세지 보낼때
		public String JsonData(String id, Object msg) {
			JsonObject jsonObject = Json.createObjectBuilder().add("message", 
					"<div style='text-align: left;'>" + msg + "</div>").build();
			StringWriter write = new StringWriter();
			
			try(JsonWriter jsonWriter = Json.createWriter(write)) {
				jsonWriter.write(jsonObject);
			};
			
			return write.toString();
		}
		
		// json 형태로 메세지 변환 - 접속한거 알릴때
		public String JsonDataOpen(String id) {
			JsonObject jsonObject = Json.createObjectBuilder().add("message", 
					"<b  style='color:blue;'>["+id+"]님이 접속하셨습니다. </b>").build();
			
			StringWriter write = new StringWriter();
			
			try(JsonWriter jsonWriter = Json.createWriter(write)) {
				jsonWriter.write(jsonObject);
			}
			return write.toString();
		}
		
		// json 형태로 메세지 변환 - 나간거 알릴때
		public String JsonDataClose(String id) {
			JsonObject jsonObject = Json.createObjectBuilder().add("message", 
					"<b>["+id+"]</b>님이 <b style='color:red;'>퇴장</b>하셨습니다.").build();
			
			StringWriter write = new StringWriter();
			
			try(JsonWriter jsonWriter = Json.createWriter(write)) {
				jsonWriter.write(jsonObject);
			}
			return write.toString();
		}
		
		// json 형태로 귓속말
		public String JsonWisper(String fromId, Object msg) {
			JsonObject jsonObject = Json.createObjectBuilder().add("message",
					"<a href='#none' onclick=\"insertWisper('"+fromId+"')\">"
				 +  "<i class='user icon'></i>"
				 +  "<b style='color:green;'>[" + // 아이디 클릭시 귓속말 폼 셋팅
				 fromId+"]</b>님의 귀속말</a> : " + msg + "").build()
				 ;
			
			StringWriter write = new StringWriter();
			
			try(JsonWriter jsonWriter = Json.createWriter(write)) {
				jsonWriter.write(jsonObject);
			}
			return write.toString();
		}
		
		// json 형태로 유저 정보 날리기
		public String JsonUser(String id) {
			JsonObject jsonObject = Json.createObjectBuilder().add("list",id).build()
				 ;
			
			StringWriter write = new StringWriter();
			
			try(JsonWriter jsonWriter = Json.createWriter(write)) {
				jsonWriter.write(jsonObject);
			}
			return write.toString();
		}
		
		// json 형태로 방정보 날리기
		public String JsonRoom(String roomNames) {
			JsonObject jsonObject = Json.createObjectBuilder().add("room",roomNames).build()
					 ;
				
			StringWriter write = new StringWriter();
			
			try(JsonWriter jsonWriter = Json.createWriter(write)) {
				jsonWriter.write(jsonObject);
			}
			return write.toString();
		}
		
		// 유저 리스트
		private List<String> informUser(Map<WebSocketSession, String> maplist, String room)
		throws Exception{
			// 맵을 이용하여 세션을 통해 아이디값을 value로 가져와 리스트에 담기
			// 담을 리스트 선언
			List<String> list = new ArrayList<String>();
			
			// 존재하는 웹소켓 아이디, 로그인 아이디 만큼 와일문 돌리기
			Iterator<WebSocketSession> sessionIds = maplist.keySet().iterator();
			while(sessionIds.hasNext()) {
				WebSocketSession sessionId = sessionIds.next();
				String value = maplist.get(sessionId); // 실제 아이디 값
				
				// 해당 번지의 key값에 해당하는 방의 이름정보를 가져옴
				String userRoom = roomList.get(sessionId);
				
				// 지금 돌고잇는 와일문에서 추출한 방이름과 들엉온 방의이름이 같을 겨우 리스트에 저장
				if(userRoom.equals(room)) {
					System.out.println("아이디 : " + value + ", 방이름 : " + userRoom);
					list.add(value);
				}
			}
			return list;
		}
		
		// DB로부터 존재하는 방정보 String 형태로 가져오기
		/*public String getRoomName() throws Exception {
			List<chat_room_dto> roomList = service.getRoomList();
			
			String room = sessionList.size()+"";
			
			for(int i=0; i<roomList.size(); i++) {
				room +=",";
				room += roomList.get(i).getName() + "/";
				room += roomList.get(i).getRemaincount() + "/";
				room += roomList.get(i).getTotalcount() + "/";
				room += roomList.get(i).getContent() + "/";
				room += roomList.get(i).getPwd();
			}
			return room;
		}
		
		// 방이름 반환
		public String getRoomName(String name) throws Exception{
			List<chat_room_dto> roomList = service.searchRoomList(name);
			
			String room = sessionList.size()+"";
			
			// 검색했는디 방이 없는 경우
			if(roomList.size()<1) {
				room += ", 방이 존재하지 않습니다. /// null";
			} 
			// 방이 존재하는 경우
			else {
				for(int i=0; i<roomList.size();i++) {
					room += ",";
					room += roomList.get(i).getName() + "/";
					room += roomList.get(i).getRemaincount() + "/";
					room += roomList.get(i).getTotalcount() + "/";
					room += roomList.get(i).getContent() + "/";
					room += roomList.get(i).getPwd();
				}
			}
			logger.info(room);
			return room;
		}*/
}
