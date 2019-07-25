package o2.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import o2.data.home_dto;
import o2.data.search_dto;
import o2.service.main_service_imple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class main_controller {
	@Autowired
	main_service_imple service;
	
	// 실시간 인기 순위 결과 뿌릴 페이지
	@RequestMapping("/main2.do")
	public String main2_page() {
		return "/o2_main/main2_page";
	}
	
	// 실시간 인기 순위 처리
	@RequestMapping("/main2/real_time.aj")
	public ModelAndView real_tile_list() {
		ModelAndView model = new ModelAndView();
		model.addObject("list", service.get_rtime_list());
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
			@RequestParam(defaultValue="3") int end
			)
	{
		ModelAndView model = new ModelAndView();
		List<home_dto> list = new ArrayList<home_dto>();
		
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
						
			list=service.search_data_list(dto);
			
			model.addObject("addr", addr);
			model.addObject("checkin", checkin);
			model.addObject("checkout", checkout);
			model.addObject("person", person);
			model.addObject("from_main", from_main);
			model.addObject("end", end);
			
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
			
			
			dto.setEnd(end); // end
			
			
			// list로 home_data 출력 
			list=service.infiniteList(dto);
			model.addObject("addr", addr);
			model.addObject("checkin", checkin);
			model.addObject("checkout", checkout);
			model.addObject("person", person);
			model.addObject("price_from", price_from);
			model.addObject("price_to", price_to);
			model.addObject("end", end);
			model.addObject("tag", tag);
			System.out.println("-----8개 출력");
			System.out.println(addr);
			System.out.println(checkin);
			System.out.println(checkout);
			System.out.println(person);
			System.out.println(price_from);
			System.out.println(price_to);
			System.out.println(end);
			System.out.println(tag);
			System.out.println("-----8개 출력끝");
		}
	
		
		model.addObject("list",list);
		
		
		model.setViewName("o2_board/board_list");
		return model;
	}
	
	@RequestMapping("/main/tag.do")
	public ModelAndView searchtag(
				@RequestParam String tag
			){
		ModelAndView model = new ModelAndView();
		List<home_dto> list = service.search_tag(tag);
		
		model.addObject("list",list);
		model.setViewName("o2_board/board_list");
		return model;
		
	}
	
	///////////////////////////////////검색출력 infinite list
/*	@RequestMapping("/board/infiniteDown.do")
	public void listAllGET(Model model) throws Exception
	{
		List<home_dto> list = new ArrayList<home_dto>();
		search_dto dto = new search_dto();
		list=service.search_data_list_filter(dto);
		model.addAttribute("list", list);
	}*/
}
