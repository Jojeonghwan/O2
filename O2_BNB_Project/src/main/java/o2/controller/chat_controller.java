package o2.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import o2.data.chat_room_dto;
import o2.data.chat_content_dto;
import o2.service.chat_service_imple;
import o2.service.host_service_imple;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class chat_controller {
private static final Logger logger = LoggerFactory.getLogger(chat_controller.class);
	
	@Autowired
	chat_service_imple service;
	
	@Autowired
	host_service_imple h_service;
	
/*	@RequestMapping("/login.do")
	public String login(HttpServletRequest req) {
		return "/login";
	}*/
	
/*	@RequestMapping("/login_action.do")
	public String login_action(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String login = (String)session.getAttribute("login_id");
		login.setId(req.getParameter("id"));
		String ip = "";
		InetAddress local=null;
		try {
			local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("ip", ip);
		session.setAttribute("login", login);
		
		return "redirect:test.do";
	}*/
	
/*	@RequestMapping("/test.do") 
	public String form_page(){
		return "/chatting/chat";s
	}*/
	
	
	// 전체 채팅룸으로 이동
/*	@RequestMapping("/chat/ch_room.do")
	public String chat(Model model, HttpServletRequest req) throws Exception{
		logger.info("chat.do Run! / Run Time : " + new Date());
		
//		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		String login = (String)req.getSession().getAttribute("login_id");
		String ip = "";
		if(login==null) {
			return "redirect:/member/login.do";
		}
		HttpSession session = req.getSession();
		InetAddress local=null;
		try {
			local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("ip", ip);
		// DB에 현재 아이디로 어떤 방에 들어가 있는지 조사 후 세팅하기
		//ChatMemberDto chatM = service.getRoomMember(new ChatMemberDto(0, login.getId(), "", ""));
		chat_member_dto chatM = service.getRoomMember(login);
		
		// 만약 채팅방을 처음 입장하는 것이라면 방에대한 아이디 정보를 생성
		if(chatM==null) {
			service.addRoomMember(new chat_member_dto(0, login, "all", "all"));
			// 추가 후 다시 chatM을 다시 받아오도록 한다.
			//chatM = service.getRoomMember(new ChatMemberDto(0, login.getId(), "", ""));
			chatM = service.getRoomMember(login);
			logger.info("아이디 정보 추가 성공! " + new Date());
		}
		// 존재한다면 방정보를 all로 변경
		else {
			// room 변경
			service.updateRoomMember(new chat_member_dto(0, login, "all", ""));
		}
		
		// 현재 방이름 넣기(전체 채팅방이므로 all)
		model.addAttribute("room", "all");
		model.addAttribute("id", login);
		System.out.println("마지막");
		return "/o2_chatting/chat_form";
	}*/
	
	// 채팅 리스트
	@RequestMapping("/chat/ch_list.do")
	public ModelAndView chatList(HttpServletRequest req) {
		ModelAndView model = new ModelAndView();
		
		// 1. 세션 아이디 받기
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("login_id");
		
		// 2. 채팅방 리스트 가져오기
		List<chat_room_dto> list;
		try {
			list = service.chat_room_list(id);
			model.addObject("list", list);
		} catch (Exception e) {e.printStackTrace();}
		
		// 3. 페이지 이동
		model.setViewName("/o2_chatting/chat_list");
		return model;
	}
	
	// 방만들기 - 일반 유저만 만들 수 있음
	@RequestMapping("/chat/ch_room.do")
	public ModelAndView chat_room_insert(HttpServletRequest req) throws Exception{
		System.out.println("1. con-시작");
		ModelAndView model = new ModelAndView();
		HttpSession sess = req.getSession();
		
		// 1. 변수 받기
		System.out.println("1-1. con-일반유저 채팅방 입장");
		String host_id = h_service.home_select_data(Integer.parseInt(req.getParameter("num"))).getId();
		String user_id = (String)sess.getAttribute("login_id");
		String room_name = host_id + "-" + user_id;	

		// 2. 채팅방 존재하는지 확인
		chat_room_dto ch_room_dto = service.chat_room_dto(room_name);
		if(ch_room_dto==null) {
			System.out.println("2-1. con-채팅방 확인 결과 null");
			// 2-1. 아예 처음 만드는 것
			// 2-1. null값은 채팅방이 없다는 의미 즉, 채팅방 새로 파야함
			service.chat_room_in(room_name);
			System.out.println("2-2. con-채팅방 새로 만듬");
		} else {
			if(ch_room_dto.getValidity().equals("0")) {
				// 2-2. 둘다 나간 경우로 방 다시 활성화
				service.chat_room_re_in(room_name);
			} else if(ch_room_dto.getValidity().equals("1")) {
				if(ch_room_dto.getExit_id()!=null && 
				   ch_room_dto.getExit_id().equals(user_id)) {
					// 2-3. 유저만 나간 경우로 person, exit_id 업데이트
					service.chat_room_per_inc(room_name);
				} else if(ch_room_dto.getExit_id()==null) {
					// 2-4. 둘다 채팅방에 있는 경우 채팅방 내용 불러오기
					List<chat_content_dto> list = service.chat_con_list(room_name, user_id);
					if(list!=null) {
						model.addObject("list", list);
					}
					
				}
			}
		}
		
		// 3. room_name 세션에 담기 Websocket에서 필요
		sess.setAttribute("room_name", room_name);
			
		// 4. ip 받아서 보내기 - 웹소켓 생성시 필요 단, 관리자는 제외
		req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null) {
            ip = req.getRemoteAddr();
            sess.setAttribute("ip", ip);
        }
		System.out.println("3. con-로그인 ip 출력 : " + ip);
		
		// 4. 필요 객체 담아서 보내기
		model.addObject("room", room_name);
		model.addObject("id", user_id);
		
		// 5. 페이지 이동
		model.setViewName("/o2_chatting/chat_form");
		
		System.out.println("4. con-끝 web-이동");
		return model;
	}
	
	// 채팅리스트에서 채팅방 입장시 기존의 대화 내용 불러오기 - 일반 유저, 호스트 둘다
	@RequestMapping("/chat/ch_con.do")
	public ModelAndView chat_content(HttpServletRequest req,
									 @RequestParam(value="room_name", required=false) String room_name) throws Exception {
		ModelAndView model = new ModelAndView();
		// 1. 채팅 내용 불러오려면 c_num 필요
		//    room_name 세션에 담기 - Websocket 에서 필요
		HttpSession sess = req.getSession();
		String id = (String)sess.getAttribute("login_id");
		sess.setAttribute("room_name", room_name);
		
		if(room_name!=null) {
			List<chat_content_dto> list = service.chat_con_list(room_name, id);
			if(list!=null) {
				model.addObject("list", list);
			}
			
			// 1. 채팅방 상태 확인
	/*		chat_room_dto dto = service.chat_room_dto(room_name);
			if(dto.getExit_id()!=null && !dto.getExit_id().equals(id)) {
				// 1-1. 유저가 나간방
				model.addObject("msg", "상대방이 나간 채팅방");
			}*/
			
			// 4. ip 받아서 보내기 - 웹소켓 생성시 필요 단, 관리자는 제외
			req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
	        String ip = req.getHeader("X-FORWARDED-FOR");
	        if (ip == null) {
	            ip = req.getRemoteAddr();
	            sess.setAttribute("ip", ip);
	        }
			System.out.println("3. con-로그인 ip 출력 : " + ip);
			
			// 4. 필요 객체 담아서 보내기
			model.addObject("room", room_name);
			model.addObject("id", id);
		} else if(room_name==null) {
			model.addObject("room_first", "room_first");
		}
		
		List<chat_room_dto> room_list = service.chat_room_list(id);
		model.addObject("room_list", room_list);
		model.addObject("room_ch", "room_ch");
		
	
		// 3. 페이지 이동
		model.setViewName("/o2_chatting/chat_form");
		return model;
	}
	
	// 채팅방 나가기 아이디 체크
	@RequestMapping("/chat/ch_exit_id.aj")
	public @ResponseBody String ch_exit_id_ch(HttpServletRequest req,
								@RequestParam String room_name) throws Exception {
		System.out.println("아이디 체크하기");
		String result = "";
		// 1. 필요 변수 받기
		HttpSession sess = req.getSession();
		String exit_id = (String)sess.getAttribute("login_id");
		
		// 2. 확인
		// 2-1. 해당 방이름에서 person이 2인 경우 나가는 사람이 
		//      사용자이면 방나가기 가능 호스트 이면 불가능
		chat_room_dto dto = service.chat_room_dto(room_name);
		if(dto.getPerson().equals("2") && room_name.split("-")[1].equals(exit_id)) {
			// 나가는 사람이 사용자 임
			result = "1";
		} else if(dto.getPerson().equals("2") && !room_name.split("-")[1].equals(exit_id)) {
			// 나가는 사람이 호스트인 경우
			result = "0";
		} else if(dto.getPerson().equals("1")) {
			// 유저가 나가고 나가는 사람이 호스트인 경우
			result = "1";
		}
		return result;
	}
	
	// 채팅방 나가기
	@RequestMapping("/chat/ch_exit.do")
	public String ch_exit(HttpServletRequest req,
						  @RequestParam String room_name) throws Exception {
		System.out.println("채팅방 나가기");
		// 1. 호스트는 유저가 나가야만 방에서 나갈 수 있음
		HttpSession sess = req.getSession();
		String exit_id = (String)sess.getAttribute("login_id");
		if(room_name.split("-")[1].equals(exit_id)) {
			// 1-1. 나가는 사람 일반 사용자니까 나가도 됨
			service.chat_room_per_dec(exit_id, room_name);
			service.chat_con_del_ch_update(room_name, exit_id);
		} else {
			// 1-2. 나가는 사람이 호스트니까 사용자가 나갔으니 방 삭제 가능
			service.chat_room_val_update(room_name);
			service.chat_con_del_ch_update(room_name, "all");
		}
		return "redirect:ch_con.do";
	}
	/*// 중복확인
	@ResponseBody
	@RequestMapping("/checkRoom.do")
	public int checkRoom(Model model, String name) throws Exception {
		System.out.println("name : " + name);
		
		chat_room_dto dto = service.checkRoom(name);
		// 중복값 없을때
		if(dto==null) {
			return 1;
		}
		// 중복값 있을때
		else {
			return 0;
		}
	}
	
	// 방이동
	@RequestMapping("/MoveChatRoom.do")
	public String MoveChatRoom(Model model, HttpServletRequest req, String roomName) throws Exception {
		logger.info("MoveChatRoom.do Run! / Run Time : " + new Date());
		
//		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		String login = (String)req.getSession().getAttribute("login_id");
		
		if(login==null) {
			return "redirect:loginNull.do";
		}
		
		logger.info("이동할 방이름 : " + roomName);
		
		// 이동하게 될 방 이름으로 수정
		service.updateRoomMember(new chat_content_dto(0, login, roomName, ""));
		
		// 방이동 처리
		model.addAttribute("room", roomName);
		
		return "/chatting/chat";
	}*/
}
