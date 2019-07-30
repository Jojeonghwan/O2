package o2.controller;



import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import o2.data.home_dto;
import o2.data.home_guest_dto;
import o2.data.home_review_dto;
import o2.data.member_dto;
import o2.data.user_pay_dto;
import o2.service.board_service_imple;
import o2.service.host_service_imple;
import o2.service.member_service_imple;




import o2.util.FileWriter;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.fasterxml.jackson.databind.ObjectMapper;



@Controller
public class board_controller {
	
	@Autowired
	host_service_imple h_service;
	@Autowired
	member_service_imple m_service;
	@Autowired
	board_service_imple b_service;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	MappingJackson2JsonView jsonView;

/*	@RequestMapping("board/content")
	public ModelAndView roomform(
			@RequestParam int num,
			@RequestParam int pageNum
			)
	{
		ModelAndView model = new ModelAndView();
		//데이타 가져오기
		home_dto dto=h_service.home_select_data(num);
		//model 에 저장
		model.addObject("dto", dto);
		model.addObject("pageNum", pageNum);		
		model.setViewName("/o2_board/board_content");
		return model;
	}*/
	
	////////////////////////////////////////////////////집 상세페이지////////
	@RequestMapping("board/content.do")
	public ModelAndView roomform(HttpServletRequest req,
			@RequestParam int num,
			@RequestParam(value="pageNum", required=false) String pageNum) throws Exception
	{
		ModelAndView model = new ModelAndView();
		// 데이타 가져오기 && 변수 선언
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("login_id");
		System.out.println(num);
/*		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));*/
		int scrap_ch = m_service.scrap_ch(id, String.valueOf(num));
		
		// 스크랩 되어 있는지 체크
		if(scrap_ch!=0) {
			// 스크랩 되어 있는 경우 - scrap num, 채워진 하트 파일명 보내기
			String sc_num = m_service.scrap_dto(String.valueOf(num), id).getNum();
			model.addObject("scrap_path", "heart_in.png");
			model.addObject("sc_num", sc_num);
		} else {
			// 스크랩 안되어 있는 경우 - 빈 하트 파일면 보내기
			model.addObject("scrap_path", "heart_out.png");
		}
		home_dto dto=h_service.home_select_data(num);

		//model 에 저장
		model.addObject("dto", dto);
		if(pageNum!=null) {
			model.addObject("pageNum", pageNum);	
		}
		
		///////////////////////이 밑으로는 달력 disable 구현//////////////////////
		List<home_guest_dto> list = h_service.home_guest_select(dto);
		
		model.addObject("list",list);
		model.addObject("login_id",id);
		model.addObject("num", num);
		//////////////////////////////////////////////////////////////////

		
		model.setViewName("/o2_board/board_content");
		return model;
	}
	
	@RequestMapping(value="/board/pay_popup.do",method=RequestMethod.GET)
	public ModelAndView pay_popup(
			HttpServletRequest request
			) throws Exception
	{
		ModelAndView model = new ModelAndView();

		int num=Integer.parseInt(request.getParameter("num").toString());
		System.out.println("num="+num);
		String checkin=request.getParameter("checkin").toString();
		String checkout=request.getParameter("checkout").toString();
		String pay_type=request.getParameter("pay_type").toString();
		String person=(request.getParameter("person").toString());
		String id=request.getParameter("id").toString();
		
		home_dto dto=h_service.home_select_data(num);
		String name=m_service.select_name(id);
		
		model.addObject("dto", dto);
		model.addObject("checkin",checkin);
		model.addObject("checkout",checkout);
		model.addObject("pay_type",pay_type);
		model.addObject("person",person);
		model.addObject("name",name);
	
		model.setViewName("/o2_board/pay_popup");
		return model;
	}
	
	@RequestMapping("board/pay_save.aj")
	public void paySave(
			HttpServletRequest request,
	        HttpServletResponse response,
	        @RequestParam int cancel_type
			) throws Exception
	{
		String checkin=request.getParameter("checkin").toString();
		String checkout=request.getParameter("checkout").toString();	
		SimpleDateFormat transFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat transFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		Date iDate = new Date(0);
		Date oDate = new Date(0);
		try{
	        iDate = new java.sql.Date(transFormat1.parse(checkin).getTime());
	        oDate = new java.sql.Date(transFormat2.parse(checkout).getTime());			
		} catch (ParseException e) {
            e.printStackTrace();
        }


        System.out.println(Integer.parseInt(request.getParameter("person").toString()));
		user_pay_dto udto=new user_pay_dto();
		udto.setName(request.getParameter("name").toString());
		udto.setId(request.getParameter("id").toString());
		udto.setHome_name(request.getParameter("home_name").toString());
		udto.setPrice(Integer.parseInt(request.getParameter("price").toString()));
		udto.setPerson(Integer.parseInt(request.getParameter("person").toString()));
		
		udto.setCheckin(iDate);
		udto.setCheckout(oDate);
		System.out.println(iDate);
		System.out.println(oDate);
		udto.setH_num(Integer.parseInt(request.getParameter("h_num").toString()));
		udto.setAddr(request.getParameter("addr").toString());
		udto.setPay_type(request.getParameter("pay_type").toString());
		udto.setPay_check(request.getParameter("pay_check").toString());
		
		b_service.user_pay_insert(udto);
		//user_pay_insert 끝
		
		home_guest_dto gdto=new home_guest_dto();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("login_id");
		member_dto mdto =m_service.select_dto(id);
		home_dto hdto = h_service.home_select_data(Integer.parseInt(request.getParameter("h_num").toString()));
		gdto.setH_num(Integer.parseInt(request.getParameter("h_num").toString()));
		gdto.setGuest_name(request.getParameter("name").toString());
		gdto.setGuest_person(Integer.parseInt(request.getParameter("person").toString()));
		gdto.setCheckin(iDate);
		gdto.setCheckout(oDate);
		gdto.setGuest_hp(mdto.getTel());
		gdto.setGuest_email(mdto.getEmail());
		gdto.setHost_id(String.valueOf(hdto.getId()));
		gdto.setCancel_type(cancel_type);
		h_service.home_guest_insert(gdto);
		//h_service.
	    try {
			response.getWriter().print("{\"a\": 1}");
	    } catch (IOException e) {
	        e.printStackTrace();
	    }   
	}
	
	@RequestMapping("board/pay_result.do")
	public ModelAndView pay_result()
	{
		ModelAndView model = new ModelAndView();
		System.out.println("zzz");
		model.setViewName("o2_board/pay_result");
		return model;
	}
	
	@RequestMapping("board/pay_list.do")
	public ModelAndView pay_list(
			HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		ModelAndView model = new ModelAndView();
		List<user_pay_dto> list = b_service.user_pay_select_by_id((session.getAttribute("login_id")).toString());
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Calendar time = Calendar.getInstance(); 
		String format_time1 = format1.format(time.getTime());
		        
		System.out.println(format_time1);
		for(int j=0;j<list.size();j++)
		{
			System.out.println(list.get(j).getCheckin());
		}
		for(int i=0;i<list.size();i++) {
			String check = String.valueOf(list.get(i).getCheckin());
			System.out.println(check.equals(format_time1));
			System.out.println(list.get(i).getPay_check().equals("3"));
			if(check.equals(format_time1)&&
			   list.get(i).getPay_check().equals("3")) {
				list.get(i).setSend_ticket_ch("1");
			} else {
				list.get(i).setSend_ticket_ch("0");
			}
		}
		model.addObject("list",list);
		model.setViewName("o2_board/pay_list");
		return model;
	}
	
	////////////////////////////////추가시작/////////////////////////////////////////
	// 결재 내역 티켓으로 보내기	
	@RequestMapping("/board/ticket_send.aj")
	public ModelAndView send_ticket(@RequestParam String num,
									HttpServletRequest req) throws Exception {
		ModelAndView model = new ModelAndView();
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("login_id");
		String setfrom = "1px.solid.gary@gmail.com";        	
		/*String email  = service.select_dto(id).getId();   */ 		
		/*String email  = "dodns190@naver.com";*/
		String email = m_service.select_dto(id).getEmail();
		String title   = "귀하의 결제 내역입니다.";     		
		String content = "";   									
		user_pay_dto u_p_dto = b_service.user_pay_select_by_num(num);
		
		// 메일발송
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper 
							= new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom);  
			messageHelper.setTo(email);    
			messageHelper.setSubject(title); 
			content = "<!DOCTYPE html>" 
					+ 	"<html>"
					+ 		"<head>"
					+ 			"<meta charset='utf-8'>"
					+ 		"</head>"
					+ 		"<body>"
					+			"<div id='ticket'>"
					+				"결제자명/인원 : " + u_p_dto.getName() + "/" + u_p_dto.getPerson() + "명<br>"
					+				"홈 이름 : " + u_p_dto.getHome_name() + "<br>"
					+				"가격 : " + u_p_dto.getPrice() + "<br>"
					+				"예약일자 : " + u_p_dto.getReserveday() + "<br>"
					+				"체크인 : " + u_p_dto.getCheckin() + "<br>"
					+				"집주소 : " + u_p_dto.getAddr() + "<br>"
/*					+				"<img src='../save/c1.png'>"*/
					+			"</div>"
					+ 		"</body>"
					+ 	"</html>"
			;

			messageHelper.setText(content, true); 
			System.out.println(content);
			
			mailSender.send(message);
			model.addObject("result", "1");
			model.setViewName("/o2_member/send_ticket_result");
		} catch(Exception e){
			model.addObject("result", "0");
			System.out.println(e);
		}
		return model;
	}
	
	////////////////////////////////추가끝끝/////////////////////////////////////////
	
	
	
	///////////////////////////////리뷰 추가 시작//////////////////////////////////////
	@RequestMapping("/board/board_review.do")
	public ModelAndView review_page(@RequestParam int num) throws Exception
	{
		ModelAndView model = new ModelAndView();
		List<home_review_dto> list= b_service.select_review(num); // 집번호로 리뷰list
		model.addObject("list", list);
		
		int beStarRating = b_service.beStarRating(num);
		double starRating = 0.0;
		if(beStarRating==1){	// 별점이 있을 때 1 리턴
			starRating = b_service.review_starRating(num); // 집번호로 총점리뷰
		}else{
			starRating = 0.0;
		}
		
		model.addObject("starRating", starRating);
		model.setViewName("o2_board/board_review");
		return model;
	}
	
/*	@RequestMapping("/board/review_list.do")
	@ResponseBody
	public List<home_review_dto> review_list(@RequestParam String num) throws Exception
	{
		int h_num = Integer.parseInt(num);
		List<home_review_dto> list= b_service.select_review(h_num);
		return list;
	}*/
	
	//리뷰 입력
	@RequestMapping(value="/board/review_insert.do", method=RequestMethod.POST, produces="text/plain")
	public ModelAndView upload(MultipartHttpServletRequest request,
								@RequestParam MultipartFile upfile) throws Exception {
		JSONObject json = new JSONObject();
		String PATH=request.getSession().getServletContext().getRealPath("/save");
		System.out.println("path:"+PATH);
		ModelAndView model = new ModelAndView();
		model.setView(jsonView);
		
		// dto 저장
		home_review_dto h_re_dto = new home_review_dto();
		String content = request.getParameter("content");
		h_re_dto.setContent(content);
		System.out.println(content+", content");
		
		double score = Double.parseDouble(request.getParameter("score"));
		h_re_dto.setScore(score);
		System.out.println(score+", score");
		
		String myid = request.getParameter("id");
		System.out.println(myid+", myid");
		h_re_dto.setId(myid);
		
		// 썸네일저장
		String thumb_nail = m_service.select_dto(myid).getThumb_nail();
		h_re_dto.setThumb_nail(thumb_nail);
		
		String imagename="";
		FileWriter fileWriter = new FileWriter();
		// 이미지저장
//		if(upfile.getOriginalFilename().length() == 0) {
//			h_re_dto.setImg_name("noimg"); // null 이면 noimg
//		}else { //빈문자열이 아닌 경우 img 저장
//			for(MultipartFile f:dto.getUpfile())
//			{ //upfile만큼 반복
//				imagename+=f.getOriginalFilename()+",";
//				fileWriter.writeFile(f, PATH, f.getOriginalFilename());
//			}
//			h_re_dto.setImg_name(imagename); //dto에 이미지이름 저장
//		}

		if(upfile.getOriginalFilename().length() == 0) {
			h_re_dto.setImg_name("noimg"); // null 이면 noimg
		}else { //빈문자열이 아닌 경우 img 저장
			fileWriter.writeFile(upfile, PATH, upfile.getOriginalFilename());
			// 새로운 dto에 이미지 저장
			h_re_dto.setImg_name(upfile.getOriginalFilename());
		}
		
		int h_num = Integer.parseInt(request.getParameter("h_num"));
		h_re_dto.setH_num(h_num);
		
		b_service.insert_review(h_re_dto);
		

        json.put("code", "true");
        model.addObject("result", json);
        return model;
       
	}
	
	/////////////////////////리뷰 삭제
	@RequestMapping("/board/review_delete.do")
	public void review_delete(int r_num,
			HttpServletResponse response) throws Exception
	{
		b_service.delete_review(r_num);
		try {
	         response.getWriter().print("{\"a\": 1}");
	       } catch (IOException e) {
	           e.printStackTrace();
	       } 
	}
	
	///////////////////////////리뷰수정 윈도우팝업
	@RequestMapping("/board/boardReview_update.do")
	public ModelAndView reviewDTO(@RequestParam int r_num
									, @RequestParam int h_num
									, @RequestParam int pageNum) throws Exception
	{
		home_review_dto r_dto = b_service.selectReview_dto(r_num);
		ModelAndView model = new ModelAndView();
		model.addObject("r_dto", r_dto);
		model.addObject("h_num", h_num);
		model.addObject("pageNum", pageNum);
		model.setViewName("o2_board/boardReview_update");
		return model;
	}
	
	////////////////////////////리뷰수정
	@RequestMapping("/board/review_update.do")
	public ModelAndView review_update(@RequestParam MultipartFile upfile
									, MultipartHttpServletRequest request) throws Exception
	{
		JSONObject json = new JSONObject();
		String PATH=request.getSession().getServletContext().getRealPath("/save");
		System.out.println("path:"+PATH);
		ModelAndView model = new ModelAndView();
		model.setView(jsonView);
		
		// dto 저장
		home_review_dto h_re_dto = new home_review_dto();
		String content = request.getParameter("content");
		h_re_dto.setContent(content);
		System.out.println(content+", content");
		
		double score = Double.parseDouble(request.getParameter("score"));
		h_re_dto.setScore(score);
		System.out.println(score+", score");
	
		
		// 이미지저장
		FileWriter fileWriter = new FileWriter();
		if(upfile.getOriginalFilename().length() == 0) {
			h_re_dto.setImg_name(null); // null 이면 원래img_name 저장
		}else { //빈문자열이 아닌 경우 img 저장
			fileWriter.writeFile(upfile, PATH, upfile.getOriginalFilename());
			// 새로운 dto에 이미지 저장
			h_re_dto.setImg_name(upfile.getOriginalFilename());
		}
	
		int num = Integer.parseInt(request.getParameter("num"));
		h_re_dto.setNum(num);
		System.out.println("리뷰number"+num);

		b_service.update_review(h_re_dto);
		System.out.println("dto.content"+h_re_dto.getContent());
		System.out.println("dto.score"+h_re_dto.getScore());
		System.out.println("dto.num"+h_re_dto.getNum());
		System.out.println("dto.img"+h_re_dto.getImg_name());

        json.put("code", "true");
        model.addObject("result", json);
        return model;
	}

}
