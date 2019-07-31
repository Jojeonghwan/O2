package o2.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import o2.data.home_dto;
import o2.data.search_dto;
import o2.service.main_service_imple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

@Controller
public class main_controller {
	@Autowired
	main_service_imple service;
	
	// 메인 페이지 로딩
	@RequestMapping("/main.do") 
	public String main(){
		return "/o2_main/main";
	}
	
	// 헤더 - main
	@RequestMapping("/header.do")
	public String header() {
		return "/o2_main/header";
	}
	
	// 헤더 - main
	@RequestMapping("/header_black.do")
	public String header_black() {
		return "/o2_main/header_black";
	}
	
	// 헤더 - main
	@RequestMapping("/header_black2.do")
	public String header_black2() {
		return "/o2_main/header_black_2";
	}
	
	// 헤더 - main 제외
	@RequestMapping("/on_header.do") 
	public ModelAndView on_header(@RequestParam String adr) {
		ModelAndView model = new ModelAndView();
		model.addObject("adr", adr);
		model.setViewName("/o2_main/on_header");
		return model;
	}
	
	// all header 
	@RequestMapping("/all_header.do")
	public String all_header() {
		return "/o2_main/all_header";
	}
	
	// 실시간 인기 순위 결과 뿌릴 페이지
	@RequestMapping("/main2.do")
	public String main2_page() {
		return "/o2_main/main2_page";
	}
	
	// 실시간 인기 순위 처리
	@RequestMapping("/main2/real_time.aj")
	public ModelAndView real_tile_list(@RequestParam String addr) {
		ModelAndView model = new ModelAndView();
		model.addObject("list", service.get_rtime_list(addr));
		model.setViewName("/o2_main/real_time_result");
		return model;
	}
	
	@RequestMapping("/main/main1")
	public String main1_page() {
		return "/o2_main/main1_page";
	}
	
	// 검색 출력 리스트
	@RequestMapping("/board/list.do")
	public ModelAndView boardlist(
			@RequestParam(defaultValue="") String addr,
			@RequestParam String checkin,
			@RequestParam String checkout,
			@RequestParam int person,
			@RequestParam int from_main,
			@RequestParam(required=false) String tag,
			@RequestParam(defaultValue="0") int price_from,
			@RequestParam(defaultValue="1000000") int price_to,
			@RequestParam(defaultValue="5") int end,
			@RequestParam(value="pageNum",defaultValue="1") int currentPage
			)
	{
		ModelAndView model = new ModelAndView();
		List<home_dto> list = new ArrayList<home_dto>();
		
		//페이징처리에 필요한 변수들 선언
		int totalCount;
		int totalPage; //총 페이지수
		int startNum; //각페이지의시작번호
		int endNum; //각페이지의끝번호
		int startPage; //블럭의 시작페이지
		int endPage; //블럭의 끝페이지
		int no;//출력할 시작번호
		int perPage=6;//한페이지당 보여질 글의갯수
		int perBlock=5;//한블럭당 보여질 페이지의 갯수
		
		if( from_main == 1){
			SimpleDateFormat transFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat transFormat2 = new SimpleDateFormat("yyyy-MM-dd");
			Date iDate = new Date(0);
			Date oDate = new Date(0);
			try{
		        iDate = new java.sql.Date(transFormat1.parse(checkin).getTime());
		        oDate = new java.sql.Date(transFormat2.parse(checkout).getTime()-1);			
			} catch (ParseException e) {
	            e.printStackTrace();
	        }
						
			search_dto dto = new search_dto(); 
			
			dto.setAddr(addr);
			dto.setCheckin(iDate);
			dto.setCheckout(oDate);
			dto.setPerson(person);
						
			totalCount = service.searchList_totalCount(dto);
			System.out.println("totalCount"+totalCount);
			System.out.println("-----------------------------");
			

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
			
			dto.setStartNum(startNum);
			dto.setEndNum(endNum);
			list=service.search_data_pagingList(dto);
			
			model.addObject("addr", addr);
			model.addObject("checkin", checkin);
			model.addObject("checkout", checkout);
			model.addObject("person", person);
			model.addObject("from_main", from_main);
			model.addObject("end", end);
			tag = "|";
			model.addObject("tag", tag);
			
		}else{ // from_main 이 2일때
			System.out.println("2 시작");
			
			SimpleDateFormat transFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat transFormat2 = new SimpleDateFormat("yyyy-MM-dd");
			Date iDate = new Date(0);
			Date oDate = new Date(0);
			try{
		        iDate = new java.sql.Date(transFormat1.parse(checkin).getTime());
		        oDate = new java.sql.Date(transFormat2.parse(checkout).getTime()-1);			
			} catch (ParseException e) {
	            e.printStackTrace();
	        }
			
			// search_dto 
			search_dto dto = new search_dto();
			System.out.println("tag 확인"+tag);
			if(!tag.equals("|")){ // tag 선택있을 시
				System.out.println("태그 선택 함");
				String tag_substr = tag.substring(1); // 구분자 | 제거
				//System.out.println(tag_substr);
				dto.setTag(tag_substr);				
			}else{
				tag = "|";
				dto.setTag(tag);
			}
			
				
			dto.setAddr(addr); // addr
			dto.setCheckin(iDate); // checkin
			dto.setCheckout(oDate); // checkout
			dto.setPerson(person); // person // 필수 끝
			System.out.println("price_from 확인"+price_from);
			if(price_from != 0){
				System.out.println("가격 설정 함");
				dto.setPrice_from(price_from); // 가격
				dto.setPrice_to(price_to); 				
			}else{
				dto.setPrice_from(price_from); // 가격
				dto.setPrice_to(price_to);
			}

			totalCount = service.boardList_totalCount(dto);
			System.out.println("totalCount"+totalCount);
			System.out.println("-----------------------------");

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

			dto.setStartNum(startNum);
			dto.setEndNum(endNum);
			//2. 리스트 가져오기
			// list로 home_data 출력 
			list=service.board_pagingList(dto);
			
			model.addObject("addr", addr);
			model.addObject("checkin", checkin);
			model.addObject("checkout", checkout);
			model.addObject("person", person);
			model.addObject("price_from", price_from);
			model.addObject("price_to", price_to);
			model.addObject("end", end);
			model.addObject("tag", tag);

		}
	
		
		model.addObject("list",list);
		model.addObject("currentPage", currentPage);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("no", no);
		model.addObject("totalPage", totalPage);
		model.addObject("totalCount",totalCount);
		model.addObject("from_main", from_main);
		
		model.setViewName("o2_board/board_list");
		return model;
	}
	
	@RequestMapping("/main/tag.do")
	public ModelAndView searchtag(@RequestParam String tag
								, @RequestParam(value="from_main",defaultValue="1") int from_main
								, @RequestParam(value="pageNum",defaultValue="1") int currentPage
			){
		ModelAndView model = new ModelAndView();
		// search_dto 
		search_dto dto = new search_dto();
		//페이징처리에 필요한 변수들 선언
		int totalCount = service.searchTagTotalCount(tag);
		int totalPage; //총 페이지수
		int startNum; //각페이지의시작번호
		int endNum; //각페이지의끝번호
		int startPage; //블럭의 시작페이지
		int endPage; //블럭의 끝페이지
		int no;//출력할 시작번호
		int perPage=6;//한페이지당 보여질 글의갯수
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

		// dto저장 후 list 출력
		dto.setStartNum(startNum);
		dto.setEndNum(endNum);
		dto.setTag(tag);
		List<home_dto> list = service.search_tag_paging(dto);
		
		model.addObject("list",list);
		model.addObject("currentPage", currentPage);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("no", no);
		model.addObject("totalPage", totalPage);
		model.addObject("totalCount",totalCount);
		model.addObject("from_main", from_main);
		model.addObject("tag", tag);
		model.setViewName("o2_board/board_list");
		return model;
		
	}
	


	
	
/*	@RequestMapping("/board/infiniteDown.do")
	public void listAllGET(Model model) throws Exception
	{
		List<home_dto> list = new ArrayList<home_dto>();
		search_dto dto = new search_dto();
		list=service.search_data_list_filter(dto);
		model.addAttribute("list", list);
	}*/
}
