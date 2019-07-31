package o2.controller;



import java.io.File;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import o2.data.home_dto;
import o2.data.home_guest_dto;
import o2.data.home_review_dto;
import o2.data.host_review_dto;
import o2.data.member_dto;
import o2.data.user_pay_dto;
import o2.service.board_service_imple;
import o2.service.host_service_imple;
import o2.service.member_service_imple;
import o2.util.FileWriter;

import org.hibernate.engine.spi.Mapping;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
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

import com.google.gson.Gson;


@Controller
public class host_controller {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	host_service_imple service;
	@Autowired
	member_service_imple m_service;
	@Autowired
	board_service_imple b_service;
	@Autowired
	MappingJackson2JsonView jsonView;
	

	@RequestMapping("host/roomform.do")
	public ModelAndView roomform(
			HttpServletRequest request
			) throws Exception
		{
		ModelAndView model = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("login_id");
		member_dto m_dto = m_service.select_dto((session.getAttribute("login_id")).toString());
		model.addObject("host_name",m_dto.getName());
		model.addObject("u_num",m_dto.getNum());
		model.setViewName("/o2_host/room_form");
		return model;
	}
	/*@RequestMapping("host/form")
	public ModelAndView form(
			@ModelAttribute home_dto dto,
			HttpServletRequest request,
			@RequestParam(value="id") String id
			)
	{
		
		ModelAndView model = new ModelAndView();
		//일단 파일명이 어떻게 넘어오는지부터 확인-입력안했을시
		for(MultipartFile f:dto.getUpfile())
		{
			System.out.println("파일명:"+f.getOriginalFilename());
		}
		
		String path=request.getSession().getServletContext().getRealPath("/save");
		
		System.out.println(path);

		//path경로에 이미지 저장
		FileWriter fileWriter=new FileWriter();

		String Img="";
		for(MultipartFile f:dto.getUpfile())
		{
			//빈문자열이 아닐경우에만 저장
			if(f.getOriginalFilename().length()>0){
				Img+=f.getOriginalFilename()+",";
				fileWriter.writeFile(f, path, f.getOriginalFilename());
			}
		}
		if(Img.length()==0)//이미지 3개 다 선택 안한경우
		{
			Img="noimage";
		}else{
			//마지막 ,제거하기
			Img=Img.substring(0,Img.length()-1);
		}
		//dto에 이미지 이름들 저장
		dto.setImg(Img);
		//dto에 저장

		System.out.println("???????????????????");
		System.out.println("!!!!!!!!!!!!!!!!!!");
		System.out.println("!!!!!!!!!!!!!!!!!!");
		System.out.println("!!!!!!!!!!!!!!!!!!");
		System.out.println("!!!!!!!!!!!!!!!!!!");
		System.out.println(dto.toString());
		System.out.println(id);
		service.homeinsert(dto);
		List<home_dto> host_list=service.host_homelist(id);
		model.addObject("host_list", host_list);
		model.setViewName("/o2_host/room_list");
		return model;
	}*/
	@RequestMapping("host/form.do")
	public String form(
			@ModelAttribute home_dto dto,
			HttpServletRequest request,
			@RequestParam(value="id") String id,
			@RequestParam(value="person",defaultValue="1") int person,
			MultipartHttpServletRequest req,
            @RequestParam("file") MultipartFile[] file,
            @RequestParam(value="sub_tag",defaultValue="/") String sub_tag,
            @RequestParam(value="sub_facilities",defaultValue="/") String sub_facilities
			)throws Exception 
	{
		//ModelAndView model = new ModelAndView();
		//일단 파일명이 어떻게 넘어오는지부터 확인-입력안했을시
		System.out.println("??");
		String path=request.getSession().getServletContext().getRealPath("/save");
	    String fileOriginName = "";
	    String fileMultiName = "";
	    for(int i=0; i<file.length; i++) {
	    	if(file[i].getOriginalFilename().length()>0){
	        fileOriginName = file[i].getOriginalFilename();
	        System.out.println("기존 파일명 : "+fileOriginName);
	        SimpleDateFormat formatter = new SimpleDateFormat("YYYYMMDD_HHMMSS_"+i);
	        Calendar now = Calendar.getInstance();
	        
	        //확장자명
	        String extension = fileOriginName.split("\\.")[1];
	        
	        //fileOriginName에 날짜+.+확장자명으로 저장시킴.
	        fileOriginName = formatter.format(now.getTime())+"."+extension;
	        System.out.println("변경된 파일명 : "+fileOriginName);
	        
	        File f = new File(path+"\\"+fileOriginName);
	        file[i].transferTo(f);
	        if(i==0) { fileMultiName += fileOriginName; }
	        else{ fileMultiName += ","+fileOriginName; }
	    	}
	    }
	    if(fileMultiName==""){
	    dto.setImg("noimage");
	    }else{
	    dto.setImg(fileMultiName);
	    }
	    	
		
//		for(MultipartFile f:dto.getUpfile())
//		{
//			System.out.println("파일명:"+f.getOriginalFilename());
//		}
//		
//		String path=request.getSession().getServletContext().getRealPath("/save");
//		
//		System.out.println(path);
//
//		//path경로에 이미지 저장
//		FileWriter fileWriter=new FileWriter();
//
//		String Img="";
//		for(MultipartFile f:dto.getUpfile())
//		{
//			//빈문자열이 아닐경우에만 저장
//			if(f.getOriginalFilename().length()>0){
//				Img+=f.getOriginalFilename()+",";
//				fileWriter.writeFile(f, path, f.getOriginalFilename());
//			}
//		}
//		if(Img.length()==0)//이미지 3개 다 선택 안한경우
//		{
//			Img="noimage";
//		}else{
//			//마지막 ,제거하기
//			Img=Img.substring(0,Img.length()-1);
//		}
//		//dto에 이미지 이름들 저장
//		dto.setImg(Img);
//		//dto에 저장

		System.out.println("???????????????????");
		System.out.println("!!!!!!!!!!!!!!!!!!");
		System.out.println("!!!!!!!!!!!!!!!!!!");
		System.out.println("!!!!!!!!!!!!!!!!!!");
		System.out.println("!!!!!!!!!!!!!!!!!!");
		System.out.println(dto.toString());
		System.out.println(id);
		service.homeinsert(dto);
		return "redirect:roomlist.do";
	}

	@RequestMapping("host/roomlist.do")
	public ModelAndView list(
			@RequestParam(value="pageNum",defaultValue="1") int currentPage,
			HttpServletRequest request
			
			)
	{
		ModelAndView model = new ModelAndView();
		int totalCount;//총 데이타 갯수

		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("login_id");
		List<home_dto> host_list=service.host_homelist(id);
		totalCount=service.home_totalcount();

		//페이징 복사한거
		//페이징처리에 필요한 변수들 선언
		int totalPage; //총 페이지수
		int startNum; //각페이지의시작번호
		int endNum; //각페이지의끝번호
		int startPage; //블럭의 시작페이지
		int endPage; //블럭의 끝페이지
		int no;//출력할 시작번호
		int perPage=3;//한페이지당 보여질 글의갯수
		int perBlock=5;//한블럭당 보여질 페이지의 갯수

		//총페이수를 구한다
		totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);

		//존재하지 않는 페이지일경우 마지막 페이지로 가기
		if(currentPage>totalPage)
			currentPage=totalPage;

		//각 블럭의 시작페이지와 끝페이지를 구한다
		//perBlock 이 5일경우
		//예) 현재페이지가 3 일경우 시작페이지:1,끝페이지:5
		//예) 현재페이지가 7 일경우 시작페이지:6,끝페이지:10
		//예) 현재페이지가 11 일경우 시작페이지:11,끝페이지:15
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		//마지막 블럭은 끝페이지가 총 페이지수와 같아야함
		if(endPage>totalPage)
			endPage=totalPage;

		//각 페이지의 시작번호와 끝번호를 구한다
		//perPage 가 5일경우
		//예) 1페이지 : 시작번호 : 1, 끝번호:5
		//    3페이지 :           11        15
		startNum=(currentPage-1)*perPage+1;
		endNum=startNum+perPage-1;
		//마지막 페이지의 글번호 체크하기
		if(endNum>totalCount)
			endNum=totalCount;

		//각 페이지마다 출력할 시작번호
		//총갯수가 30일경우 1페이지는 30,2페이지는 25....
		no=totalCount-(currentPage-1)*perPage;		

		//2. 리스트 가져오기
		//List<home_dto> list=service.homeselect(startNum, endNum);
		


		//model.addObject("list", list);
		model.addObject("currentPage", currentPage);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("no", no);
		model.addObject("totalPage", totalPage);
		model.addObject("totalCount",totalCount);
		model.addObject("host_list", host_list);


		model.setViewName("/o2_host/room_list");
		return model;
	}
	@RequestMapping("host/delete.do")
	public String guestDelete(
			@RequestParam int num,
			@RequestParam int pageNum,
			HttpServletRequest request
			)
	{
		
		//이미지 업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/save");
		System.out.println(path);
		//db에서 삭제하기 전에 이미지부터 지우기
		String imagename=service.home_select_data(num).getImg();
		if(!imagename.equals("noimage"))
		{
			String []myImg=imagename.split(",");
			for(String s:myImg)
			{
				//파일 객체로 생성
				File f=new File(path+"\\"+s);
				//존재할경우 삭제
				if(f.exists())
				{
					f.delete();
				}
			}
		}
		
		//삭제
		System.out.println("zz");
		service.home_delete_data(num);
		return("redirect:roomlist.do?pageNum="+pageNum);
	}
	
	@RequestMapping("/host/updateform.do")
	public ModelAndView updateform(
			@RequestParam int num,
			@RequestParam String pageNum
			)
	{
		home_dto dto=service.home_select_data(num);
		ModelAndView model=new ModelAndView();
		model.addObject("dto",dto);
		model.addObject("pageNum",pageNum);
		model.setViewName("/o2_host/room_update");
		return model;
	}
	
	
	@RequestMapping("host/update.do")
	public ModelAndView update(
			HttpServletRequest request,
			@ModelAttribute home_dto dto,
			@RequestParam int num,
			@RequestParam int pageNum,
			@RequestParam(value="person",defaultValue="1") int person,
			MultipartHttpServletRequest req,
            @RequestParam("file") MultipartFile[] file,
            @RequestParam(value="filecheck", defaultValue="0") String filecheck,
            @RequestParam String before_img
			)throws Exception
	{
		
		System.out.println("넘어오니?");
		ModelAndView model=new ModelAndView();
		// path
		String path=request.getSession().getServletContext().getRealPath("/save");
		
		System.out.println(path);
		String imagename = service.home_select_data(num).getImg();

		//path경로에 이미지 저장
		if(Integer.parseInt(filecheck)>0){
		if(!imagename.equals("noimage"))
		{
			String []myImg=imagename.split(",");
			for(String s:myImg)
			{
				//파일 객체로 생성
				File f=new File(path+"\\"+s);
				//존재할경우 삭제
				if(f.exists())
				{
					f.delete();
				}
			}
		}	

	    String fileOriginName = "";
	    String fileMultiName = "";
	    for(int i=0; i<file.length; i++) {
	    	if(file[i].getOriginalFilename().length()>0){
	        fileOriginName = file[i].getOriginalFilename();
	        System.out.println("기존 파일명 : "+fileOriginName);
	        SimpleDateFormat formatter = new SimpleDateFormat("YYYYMMDD_HHMMSS_"+i);
	        Calendar now = Calendar.getInstance();
	        
	        //확장자명
	        String extension = fileOriginName.split("\\.")[1];
	        
	        //fileOriginName에 날짜+.+확장자명으로 저장시킴.
	        fileOriginName = formatter.format(now.getTime())+"."+extension;
	        System.out.println("변경된 파일명 : "+fileOriginName);
	        
	        File f = new File(path+"\\"+fileOriginName);
	        file[i].transferTo(f);
	        if(i==0) { fileMultiName += fileOriginName;}
	        else{ fileMultiName += ","+fileOriginName;}
	    	}
	    }
	    if(fileMultiName==""){
	    dto.setImg("noimage");
	    }else{
	    dto.setImg(fileMultiName);
	    }
		}else{
			dto.setImg(before_img);
		}
		System.out.println("넘어왓어?");
		service.home_update_data(dto);
		model.setViewName("redirect:roomlist.do");
	
		return model;
	}
	
	@RequestMapping("host/home_guest_list.do")
	public ModelAndView home_guest_list(
			HttpServletRequest request
			){
		ModelAndView model = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("login_id");
		home_dto dto = new home_dto();
		dto.setId(id);
		String path=request.getSession().getServletContext().getRealPath("/save");
		System.out.println(path);
		System.out.println("hohohohohoho");
		System.out.println("hohohohohoho");
		System.out.println("hohohohohoho");
		System.out.println(dto.toString());
		List<home_guest_dto> list = service.home_guest_select(dto);

		System.out.println(list.size());
		model.addObject("list",list);
		model.setViewName("o2_host/home_guest_list");
		return model;
	}
	
	@RequestMapping("host/cancel.aj")
	public ModelAndView cancel(
			@RequestParam int h_num,
			@RequestParam String guest_email,
			@RequestParam String guest_name,
			@RequestParam String reserveday,
			@RequestParam String checkin,
			@RequestParam String checkout,
			HttpServletRequest request
			){
		ModelAndView model = new ModelAndView();
		System.out.println("예약왔니?");
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
		
		home_guest_dto gdto=new home_guest_dto();
		user_pay_dto udto=new user_pay_dto();
		
		gdto.setH_num(h_num);
		gdto.setCheckin(iDate);
		gdto.setCheckout(oDate);
		
		udto.setH_num(h_num);
		udto.setCheckin(iDate);
		udto.setCheckout(oDate);
		
		System.out.println("예약왔니?");
		home_dto dto = service.home_select_data(h_num);
		String setfrom = "1px.solid.gary@gmail.com";        	// 보내는 사람
		String email  = guest_email;    		// 받는 사람 이메일
		String title   = guest_name+"고객님의 예약이 취소되었습니다.";     		// 제목
		String content = "";

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
					+			"<div id='cancel'>"
					+				"결제자명 : " + guest_name +"<br>"
					+				"홈 이름 : " + dto.getHome_name() + "<br>"
					+				"예약일자 : " + reserveday + "<br>"
					+				"체크인 : " + checkin + "<br>"
					+				"체크아웃"  + checkout
					+				"죄송합니다 호스트의 개인사정으로 예약이 취소되었습니다."
					+			"</div>"
					+ 		"</body>"
					+ 	"</html>"
			;

			messageHelper.setText(content, true); 
			System.out.println(content);
			
			mailSender.send(message);
			model.addObject("result", "1");
			service.host_update_home_guest_cancel_type(gdto);
			service.host_update_user_pay_pay_chcek(udto);
			model.setViewName("o2_host/home_guest_cancel_result");
		} catch(Exception e){
			model.addObject("result", "0");
			System.out.println(e);
		}
		return model;
	}
	
	
	
	
	////////////////////////리액트로 호스트리뷰 구현시작////////////////
	
	@RequestMapping("host/host_review.do")
	public String host_review()
	{
		return "/o2_host/host_review";
	}
	
	@RequestMapping(value="/host/host_review_list.do",method=RequestMethod.GET)
	public @ResponseBody List<host_review_dto> getList()
	{
		return service.host_review_select(1,999);//최신10개
	}
	
	
	
}
