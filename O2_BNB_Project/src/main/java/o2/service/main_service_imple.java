package o2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import o2.data.home_dto;
import o2.data.main_rtime_dto;
import o2.data.search_dto;
import o2.persistence.main_dao_imple;

@Service
public class main_service_imple implements main_service{
	@Autowired
	main_dao_imple dao;
	
	public List<main_rtime_dto> get_rtime_list(String addr) {
		return dao.get_rtime_list(addr);
	}
	
	public List<home_dto> search_data_list(search_dto dto){
		return dao.search_data_list(dto);
	}
	
	
//	public List<home_dto> search_tag(String tag){
//		return dao.search_tag(tag);
//	}
	
	public List<home_dto> infiniteList(search_dto s_dto){
		return dao.infiniteList(s_dto);
	}
	
	public int boardList_totalCount(search_dto s_dto){
		return dao.boardList_totalCount(s_dto);
	}
	
	public List<home_dto> board_pagingList(search_dto s_dto){
		return dao.board_pagingList(s_dto);
	}
	
	public int searchList_totalCount(search_dto s_dto){
		return dao.searchList_totalCount(s_dto);
	}
	
	public List<home_dto> search_data_pagingList(search_dto s_dto){
		return dao.search_data_pagingList(s_dto);
	}
	
	public int searchTagTotalCount(String tag){
		return dao.searchTagTotalCount(tag);
	}
	
	public List<home_dto> search_tag_paging(search_dto s_dto){
		return dao.search_tag_paging(s_dto);
	}
}
