package o2.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import o2.data.qna_dto;
import o2.service.member_service_imple;
import o2.service.qna_service_imple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class qna_controller {
	@Autowired
	qna_service_imple service;
	@Autowired
	member_service_imple m_service;
	
	@RequestMapping("/qna/qna_form.do")
	public String qna_form() throws Exception
	{
		return "/o2_qna/qna_form";
	}
	
	@RequestMapping("/qna/qna_action.do")
	public String insert_qna(qna_dto dto) throws Exception
	{
		service.insert_qna(dto);
		return "redirect:qna_list.do";
	}
	
	// 아이디( 유저타입별 ) 페이징
	@RequestMapping("/qna/qna_list.do")
	public ModelAndView qna_list(@RequestParam(value="pageNum",defaultValue="1") int currentPage, 
								HttpServletRequest request 
								//@RequestParam String id
								) throws Exception
	{
		ModelAndView model = new ModelAndView();
		int totalCount=0;//총 데이타 갯수

		HttpSession session = request.getSession();
		String id1 = (String)session.getAttribute("login_id");
		String user_type = (String)session.getAttribute("user_type");
		
		//System.out.println(id);
		if(user_type.equals("3")){						// 관리자일때 totalCount
			totalCount=service.qna_cnt_by_id(null);
		}else{											// 일반사용자일때 totalCount
			totalCount=service.qna_cnt_by_id(id1);
			System.out.println("1515의 totalCount:"+totalCount);
			/*if(totalCount == 0)
			{
				model.setViewName("/o2_qna/qna_list");
				return model;
			}*/
		}
		
		//페이징 복사한거
		//페이징처리에 필요한 변수들 선언
		int totalPage; //총 페이지수
		int startNum; //각페이지의시작번호
		int endNum; //각페이지의끝번호
		int startPage; //블럭의 시작페이지
		int endPage; //블럭의 끝페이지
		int no;//출력할 시작번호
		int perPage=5;//한페이지당 보여질 글의갯수
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
		List<qna_dto> qna_list = new ArrayList<qna_dto>();
		if(user_type.equals("3")){										// 관리자
			String myid = null;
			qna_list=service.qna_paginglist(startNum, endNum, myid);
			System.out.println("관리자 controller in");
			qna_list=service.qna_paginglist(startNum, endNum, null);
			
		}else{															// 일반사용자
			qna_list=service.qna_paginglist(startNum, endNum, id1);
			
		}
		
		// * 추가 * notice
		List<qna_dto> qna_notice_list = service.qna_notice();
		model.addObject("qna_notice_list", qna_notice_list);
		

		model.addObject("currentPage", currentPage);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("no", no);
		model.addObject("totalPage", totalPage);
		model.addObject("totalCount",totalCount);
		model.addObject("qna_list", qna_list);


		model.setViewName("/o2_qna/qna_list");
		return model;
	}
	
	// 게시물 상세페이지
	@RequestMapping("/qna/qna_content.do")
	public ModelAndView qna_content(@RequestParam int num, 
									@RequestParam int pageNum
									) throws Exception
	{
		ModelAndView model = new ModelAndView();
		
		qna_dto q_dto = service.qna_getData(num);
		
		model.addObject("num", num);
		model.addObject("dto", q_dto);
		model.addObject("pageNum", pageNum);
		model.setViewName("/o2_qna/qna_content");
		return model;
	}
	
	// 게시물 수정폼
	@RequestMapping("/qna/qna_update_form.do")
	public ModelAndView qna_update(@RequestParam int num, @RequestParam int pageNum) throws Exception
	{
		qna_dto q_dto = service.qna_getData(num);
		
		ModelAndView model = new ModelAndView();
		model.addObject("dto", q_dto);
		System.out.println("문의글 num :"+num+","+q_dto.getNum());
		model.addObject("pageNum", pageNum);
		model.setViewName("/o2_qna/qna_update");
		return model;
	}
	
	// 게시물 수정액션
	@RequestMapping("/qna/update_action.do")
	public String update_action(qna_dto dto, @RequestParam int pageNum, HttpServletRequest request) throws Exception
	{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("login_id");
		service.qna_update(dto);
		System.out.println("수정완료");
		return "redirect:/qna/qna_list.do?pageNum="+pageNum+"&id="+id;
	}
	
	// 일반사용자일 때 비밀번호 확인 - 게시물수정
	@RequestMapping("/qna/pass_right.aj")
	public @ResponseBody String pass_right(@RequestParam String pass,@RequestParam int num, HttpServletResponse response) throws Exception
	{
		System.out.println("문의글 onsubmit:"+num);
		String pass1 = service.select_pw(num); //DB비번
		System.out.println("원래 비번 :"+pass1);
		String pass_right="";
		if( pass.equals(pass1) ){ 					// dto의 pw와 입력한 pw가 같을 때 1 반환
			pass_right="1";
			System.out.println("pw가 같을때"+pass_right);
		}else{
			pass_right="2"; 								// dto의 pw와 입력한 pw가 다를 때 2 반환
			System.out.println("pw가 다를때"+pass_right);
		}
		return pass_right;
	}
	
	// 문의글 삭제
	@RequestMapping("/qna/qna_delete.do")
	public String qna_delete(int num,
							@RequestParam int pageNum, 
							HttpServletRequest request) throws Exception
	{
		service.delete_qna(num);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("login_id");
		return "redirect:/qna/qna_list.do?pageNum="+pageNum+"&id="+id;
	}
	
}
