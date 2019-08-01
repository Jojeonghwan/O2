package o2.controller;

import java.io.File;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import o2.data.home_dto;
import o2.data.member_dto;
import o2.data.scrap_dto;
import o2.data.user_pay_dto;
import o2.service.host_service;
import o2.service.host_service_imple;
import o2.service.member_service_imple;
import o2.util.FileWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class member_controller {
	@Autowired
	member_service_imple service;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	host_service_imple h_service;
	
	// signup 폼 로드
	@RequestMapping("/member/signform.do")
	public String signform()
	{
		return "/o2_member/signform";
	}
	
	// signup 완료
	@RequestMapping(value="/member/signup.do", method=RequestMethod.POST)
	public ModelAndView signup(@ModelAttribute member_dto dto, 
								HttpServletRequest request, 
								@RequestParam MultipartFile thumb_nail_img
								) throws Exception
	{
		ModelAndView model = new ModelAndView();
		//System.out.println(dto.getId()+"아이디29");
		// 파일쓰기
	
		// path
		String path=request.getSession().getServletContext().getRealPath("/save");
		System.out.println(path);
		
		FileWriter fileWriter = new FileWriter();

		//빈문자열인 경우 noimg 저장
		if(thumb_nail_img.getOriginalFilename().length() == 0) {
			// dto에 noimg넣어주기
			dto.setThumb_nail("noimg.png");
		}else { //빈문자열이 아닌 경우 img 저장
			fileWriter.writeFile(thumb_nail_img, path, thumb_nail_img.getOriginalFilename());
			// dto에 저장
			dto.setThumb_nail(thumb_nail_img.getOriginalFilename());
		}
	
		model.addObject("dto", dto);
		service.insert_member(dto);
		//System.out.println(dto.getId()+"dhkrlsd");
		model.setViewName("/o2_member/sign_up");
		return model;
	}
	
	// 로그인 폼 로드 
	@RequestMapping("/member/login.do")
	public String login_form() {
		return "/o2_member/login_form";
	}
	
	// 로그인 액션
	@RequestMapping("/member/login_action.do")
	public String login_compl(HttpServletRequest request) throws Exception // request로 받아오니까 id,pw 따로 para으로 안받아도 된다
	{
		HttpSession session = request.getSession();
	
		String pass1 = request.getParameter("pw");			// 입력한 비밀번호
		String login_id = request.getParameter("id");		// login_id
		String pass2 = service.select_pw(login_id); 		// 비밀번호 select
		
		member_dto m_dto = service.select_dto(login_id);	// login_id로 dto출력해서 없으면 로그인실패.jsp
		System.out.println(login_id);
		
		if(m_dto == null) {
			return "/o2_member/login_fail";
		}
		
		int u_num = service.select_dto(login_id).getNum();	// u_num
		//System.out.println(u_num);
		
		if (pass1.equals(pass2)) // 문자열은 .equals로 비교해야한다
		{
			String user_type = service.select_user_type(login_id); //user_type
			u_num = service.select_dto(login_id).getNum();	
			session.setAttribute("u_num", u_num);				// 세션에 num 저장
			session.setAttribute("login_id", login_id);			// 세션에 아이디 저장
			session.setAttribute("user_type", user_type);		// 세션에 유저타입 저장
			System.out.println("썸네일 이름 : " + service.select_dto(login_id).getThumb_nail());
			session.setAttribute("thumb_nail", service.select_dto(login_id).getThumb_nail());
			System.out.println(u_num);
			System.out.println(login_id);
			System.out.println(user_type);
			return "redirect:../index.jsp";
		} else {
			return "/o2_member/login_fail";								// 틀리면 로그인실패.jsp
			
		}
		
	}
	
	// 로그아웃 폼
	@RequestMapping("/member/logout.do")
	public String logout(HttpServletRequest request) throws Exception
	{
		HttpSession session = request.getSession();

		// 세션삭제
		session.removeAttribute("u_num");
		session.removeAttribute("login_id");
		session.removeAttribute("user_type");
		
		return "redirect:../index.jsp";
	}
	
	
	// 아이디/비밀번호 찾기 폼 선택
//	@RequestMapping("/member/find") 
//	public String find() throws Exception{
//		return "/o2_member/find";
//	}
//	
	// 아이디/비밀번호 찾기 폼 로드
	@RequestMapping("/member/{path_find}") 
	public ModelAndView find_form( @PathVariable() String path_find ) throws Exception {
		
		ModelAndView model = new ModelAndView();
		if(path_find.equals("id_find")) {
			model.addObject("ch", 1);
		} else if(path_find.equals("pw_find")) {
			model.addObject("ch", 2);
		}
		model.setViewName("/o2_member/find_form");
		return model;
	}
	
	// mail 보내기
	@RequestMapping("/member/find_action")
	public ModelAndView mailSending(HttpServletRequest request,
							  		@RequestParam String ch
							  		) throws Exception 
	{
		ModelAndView model = new ModelAndView();
		String setfrom = "1px.solid.gary@gmail.com";        	// 보내는 사람
		String email  = request.getParameter("email");    		// 받는 사람 이메일
		String title   = "";     								// 제목
		String content = "";   									// 내용
		
		// email에 해당하는 계정이 있는지 먼저 확인
		int user_ch = service.select_ch(email);
		// user_ch == 0이면 계정이 없는 것
		if(user_ch==0) {
			model.addObject("ch", ch);
			model.addObject("result", "2");
			model.setViewName("/o2_member/find_form");
		} 
		// user_ch != 0이면 계정이 있는 것
		else {
			String find_id = "";									// 찾은 id
		   
			// ch == 1인 경우 : id 찾기 -> id 메일로 보내주기
			if(ch.equals("1")) {
				// 이메일로 해당 계정 id 출력
				find_id = service.select_id(email);
				title = "<O2 B&B> 귀하의 계정 아이디입니다.";
				content = "아이디 : " + find_id;
			} 
			// ch == 2인 경우 : pw 찾기 -> 임시 비밀번호 보내주기
			else if(ch.equals("2")) {
				// 임시 비밀번호 생성 - 숫자와 문자 섞어서
				String tempo_pw = "";
				while(tempo_pw.length()<3) {
					tempo_pw += (int)(Math.random()*10);
				}
				tempo_pw += (char)(Math.floor(Math.random() * (90 - 65 + 1)) + 65);
				tempo_pw += (char)(Math.floor(Math.random() * (97 - 122 + 1)) + 122);
				tempo_pw += (int)(Math.random()*10);
				
				title = "<O2 B&B> 귀하의 계정의 임시 비밀번호입니다.";
				content = "임시 비밀번호 : " + tempo_pw;
				
				// 기존 계정의 pw를 임시 비밀번호로 업데이트 하기
				service.update_pw(tempo_pw, email);
			}
			
			// 메일발송
		    try {
		    	MimeMessage message = mailSender.createMimeMessage();
		    	MimeMessageHelper messageHelper 
		                        				= new MimeMessageHelper(message, true, "UTF-8");
		 
		    	messageHelper.setFrom(setfrom);  
		    	messageHelper.setTo(email);    
		    	messageHelper.setSubject(title); 
		    	messageHelper.setText(content); 
		 
		    	mailSender.send(message);
		    	model.addObject("result", "1");
		    	model.addObject("email", email.split("@")[1]);
		    } catch(Exception e){
		      System.out.println(e);
		    }
	    	model.setViewName("/o2_member/find_result");
		}
		
	    return model;
	}
	
	// 스크랩하기
	@RequestMapping("/host/scrap.aj")
	public ModelAndView scrap_insert(HttpServletRequest req) throws Exception {
		// 변수 선언
		ModelAndView model = new ModelAndView();
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("login_id");
		String h_num = req.getParameter("h_num");
		int review_cnt = service.home_review_ch(h_num); // 해당 홈 리뷰 갯수 
		int ch = service.scrap_ch(id, h_num);			// 스크랩 여부 체크
		String s_num = req.getParameter("sc_num");		// 스크랩 넘버 
		scrap_dto sc_dto = new scrap_dto();				// 스크랩 dto
		// scrapt insert 할때 필요한 homename, imgname 가져오기
		home_dto h_dto = h_service.home_select_data(Integer.parseInt(h_num));
		// 첫번째 이미지만
		String img_name = h_dto.getImg().split(",")[0];
		// 평점
		int score = 0;
		
		// 리뷰가 없으면 평점 0으로
		if(review_cnt!=0) {
			score = service.sc_ho_av_sc(h_num);
		}
		
		// 스크랩 체크 - 0 : 스크랩 안되어 있음 1 : 스크랩 되어 있음
		if(ch==0) {
			// scrap dto 담은후
			sc_dto.setH_num(h_num);
			sc_dto.setId(id);
			sc_dto.setHome_name(h_dto.getHome_name());
			sc_dto.setImg_name(img_name);
			sc_dto.setScore(score);
			// scrap insert 하기
			service.scrap_insert(sc_dto);
			
			// insert한 scrap dto의 num 출력해서 보내기
			String sc_num = service.scrap_dto(h_num, id).getNum();
			model.addObject("sc_num", sc_num);
			model.addObject("scrap_result", "1");
		} else {
			// 삭제할 scrap num 받아서 삭제
			service.scrap_delete(s_num);
			model.addObject("scrap_result", "0");
		}
		
		model.setViewName("/o2_member/scrap_result");
		return model;
	}
	
	// 스크랩 삭제하기
	@RequestMapping("/member/scrap_delete")
	public String scrap_delete(@RequestParam String del_nums,
							   @RequestParam String pageNum) throws Exception {
		System.out.println(del_nums);
		for(String del_num : del_nums.split(",")) {
			service.scrap_delete(del_num);
		}
		return "redirect:scrap_list?pageNum="+pageNum;
	}
	
	// 스크랩 리스트 불러오기
	@RequestMapping("/member/scrap_list")
	public ModelAndView scrap_list(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
								   HttpServletRequest req
								   ) throws Exception 
	{
		ModelAndView model = new ModelAndView();
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("login_id");
		// 나중에 id는 세션으로 읽기
		int cnt = service.scrap_cnt(id);
		
		// 페이징 처리 객체들
		int tot_cnt;		// 전체 리스트 수
		int totPage;		// 토탈 페이지 수
		int startNum;		// 페이지에서 보여질 시작 num
		int endNum;			// 페이지에서 보여질 끝 num
		int startPage;		// 시작 페이지 인덱스
		int endPage;		// 끝 페이지 인덱스
		int no;				// 출력할 시작 번호
		int perPage=3;		// 한페이지당 보여질 글의 갯수
		int perBlock=3;		// 한 블럭당 보여질 페이지 갯수
		
		// 1. 총 글의 갯수
		tot_cnt = cnt;
		
		// 2. 총 페이지 갯수
		totPage = (int)Math.ceil((tot_cnt/1.0)/perPage);
		
		if(currentPage>totPage) {
			currentPage = totPage;
		}
		
		// 4. startPage, endPage 구하기
		startPage =(currentPage-1)/perBlock*perBlock+1;
		endPage = startPage+perBlock-1;
		if(endPage>totPage) {
			endPage=totPage;
		}
		
		// 5. startNum, endNum 구하기
		startNum = (currentPage-1)*perPage+1;
		endNum = startNum+perPage-1;
		if(endNum>tot_cnt) {
			endNum=tot_cnt;
		}
		
		// 6. 각 페이지마다 시작할 no 구하기
		no = tot_cnt-(currentPage-1)*perPage;
		
		List<scrap_dto> list = service.scrap_list(startNum, endNum, id);
		model.addObject("cnt", cnt);
		model.addObject("list", list);
		model.addObject("tot_cnt", tot_cnt);	 
		model.addObject("currentPage", currentPage);
		model.addObject("totPage", totPage);	
		model.addObject("startPage", startPage);	
		model.addObject("endPage", endPage);	
		model.addObject("no", no);	
		
		model.setViewName("/o2_member/scrap_list");
		return model;
	}
	
	// 아이디중복 - 아이디 있으면 no 반환
	@RequestMapping("/member/idfind.aj")
	public ModelAndView member_idfind (@RequestParam String id) throws Exception {
		ModelAndView model = new ModelAndView();
		int no = service.member_id(id);
		model.addObject("no", no);
		model.setViewName("/o2_member/member_id");
		return model;
	}
	
	// 회원가입 이메일 인증하기
	@RequestMapping("/member/mail_confirm.aj")
	public ModelAndView mail_confirm(@RequestParam String mail1) throws Exception
	{
		ModelAndView model = new ModelAndView();
		String setfrom = "1px.solid.gray@gmail.com";        	// 보내는 사람
		String email  = mail1;    								// 받는 사람 이메일
		String title  = "<O2 B&B> 이메일 인증번호 입니다.";  			// 제목
		String content = "";   									// 내용
		
		// DB에서 중복이메일 확인 - 있으면 1반환
		int isright = service.select_ch(mail1);
		if (isright == 1){
			model.addObject("mailcnt",isright);
			model.setViewName("/o2_member/mail_confirm");
			return model;
		}
		
		// encryption 생성
		String tempo_pw = "";
		while(tempo_pw.length()<3) {
			tempo_pw += (int)(Math.random()*10);
		}
		tempo_pw += (char)(Math.floor(Math.random() * (90 - 65 + 1)) + 65);
		tempo_pw += (char)(Math.floor(Math.random() * (97 - 122 + 1)) + 122);
		tempo_pw += (int)(Math.random()*10);
		
		content = "메일 인증 번호 : " + tempo_pw;
		
		
		// 메일발송
	    try {
	    	MimeMessage message = mailSender.createMimeMessage();
	    	MimeMessageHelper messageHelper 
	                        				= new MimeMessageHelper(message, true, "UTF-8");
	 
	    	messageHelper.setFrom(setfrom);  
	    	messageHelper.setTo(email);    
	    	messageHelper.setSubject(title); 
	    	messageHelper.setText(content); 
	    	
	    	System.out.println("메일 인증번호 : " + tempo_pw);
	    	
	    	mailSender.send(message);
	    	model.addObject("result", "1");
	    } catch(Exception e){
	    	System.out.println(e);
	    	int mailfail = 1;
	    	model.addObject("mailfail",mailfail);
			model.setViewName("/o2_member/mail_confirm");
			return model;
	    }
	
		model.addObject("tempo_pw", tempo_pw);
		model.setViewName("/o2_member/mail_confirm");
		return model;
	}
	
	// 회원가입 축하메세지 후 메인으로 이동
	@RequestMapping("/main/index.do")
	public String member_compl() throws Exception
	{
		return "redirect:../index.jsp";
	}
	
	// 마이페이지
	@RequestMapping("/member/mypage.do")
	public String mypage() throws Exception
	{
		return "/o2_member/mypage";
	}
	
	
	// 회원 탈퇴
	@RequestMapping("/member/delete_member.do")
	public String delete_member(HttpServletRequest request) throws Exception
	{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("login_id");
		service.delete_member(id);
		session.removeAttribute("u_num");
		session.removeAttribute("login_id");
		session.removeAttribute("user_type");
		return "redirect:../index.jsp";
	}
	
	
	// 회원정보 수정폼
	@RequestMapping("/member/update_member.do")
	public String change_member(HttpServletRequest request, Model model) throws Exception
	{
		HttpSession session = request.getSession();
		String myid = (String)session.getAttribute("login_id");
		member_dto m_dto = service.select_dto(myid);
		model.addAttribute("m_dto", m_dto);
		return "/o2_member/update_member";
	}
	
	// 회원정보 수정
	@RequestMapping(value = "/member/m_update_action.do", method=RequestMethod.POST)
	public String change_up(@ModelAttribute member_dto dto, 
							HttpServletRequest request, 
							@RequestParam MultipartFile thumb_nail_img
							) throws Exception
	{
		System.out.println("update_action.do 진입");
		// 아이디는 바뀌지않게 하기로함
		HttpSession session = request.getSession();
		String myid = (String)session.getAttribute("login_id");
		dto.setId(myid);
		System.out.println("bb");
		
		// path
		String path=request.getSession().getServletContext().getRealPath("/save");
		System.out.println(path);
		
		// 수정 전 dto
		String imgname = service.select_dto(myid).getThumb_nail();
		// 수정 전 dto에 썸네일이 존재하는지 확인
		File file = new File(path+"\\"+imgname);
		if(!imgname.equals("noimg.png")) {
			// noimg가 아니면 파일삭제
			file.delete();
		}
		System.out.println("기존이미지삭제");
		FileWriter fileWriter = new FileWriter();
		
		// form에서 넘어온 이미지thumb_nail_img가 빈문자열인 경우 noimg 저장
		if(thumb_nail_img.getOriginalFilename().length() == 0) {
			dto.setThumb_nail("noimg.png");
		}else { //빈문자열이 아닌 경우 img 저장
			fileWriter.writeFile(thumb_nail_img, path, thumb_nail_img.getOriginalFilename());
			// 새로운 dto에 썸네일 저장
			dto.setThumb_nail(thumb_nail_img.getOriginalFilename());
		}
		
		// 비밀번호 null 일때 dto에 널값 저장
		if(dto.getPassword()==null){
			dto.setPassword("");
		}else{
			dto.setPassword(dto.getPassword());
		}
		
		System.out.println(dto.getEmail()+"이메일");
		System.out.println(dto.getId()+", 아이디");
		System.out.println(dto.getName()+", 이름");
		System.out.println(dto.getPassword()+", 비번");
		System.out.println(dto.getTel()+", 전화번호");
		System.out.println(dto.getThumb_nail()+", 썸네일");
		System.out.println("파일업로드");
		service.update_member(dto);
		System.out.println("회원정보 업데이트");

		return "redirect:/member/mypage.do";
	}
	
	

	@RequestMapping("member/user_type_change.do")
	public String user_type(){
		return "/o2_member/user_type_change";
	}
	
	@RequestMapping("member/change.do")
	public String change(
			HttpServletRequest request
			){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("login_id");
		service.user_type_change(id);
		
		return "redirect:/member/mypage.do";
	}

	/////////////////////////////////회원정보수정 / 비밀번호 확인
	
	
	@RequestMapping("/member/update.do")
	public String update_pass() throws Exception
	{
		return "o2_member/update_pass";
	}
	
	@RequestMapping("/member/passright.do")
	@ResponseBody
	public String passright(@RequestParam String mypass, HttpServletRequest request) throws Exception
	{
		HttpSession session = request.getSession();
		System.out.println("컨트롤러 진입");
		
		String login_id = (String)session.getAttribute("login_id");
		String password = service.select_pw(login_id);	// DB 비번 가져오기
		
		System.out.println("입력한 비번 : "+mypass);
		System.out.println("DB비번 : "+password);
		
		String right = "";						//right으로 반환
		if ( password.equals(mypass) ){	//DB 비번과 같을때 1 리턴
			right = "1";
			System.out.println("right = 1");
		}else{							// DB 비번과 다를때 2 리턴
			right = "2";
			System.out.println("right = 2");			
		}
		return right;
	}

}
















