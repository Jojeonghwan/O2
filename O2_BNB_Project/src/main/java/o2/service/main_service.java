package o2.service;

import java.util.List;

import o2.data.home_dto;
import o2.data.main_rtime_dto;
import o2.data.search_dto;

public interface main_service {
	public List<main_rtime_dto> get_rtime_list(String addr);
	public List<home_dto> search_data_list(search_dto dto);
	//public List<home_dto> search_tag(String tag);
	public List<home_dto> infiniteList(search_dto s_dto);
	public int boardList_totalCount(search_dto s_dto);
	public List<home_dto> board_pagingList(search_dto s_dto);
	public int searchList_totalCount(search_dto s_dto);
	public List<home_dto> search_data_pagingList(search_dto s_dto);
	public int searchTagTotalCount(String tag);
	public List<home_dto> search_tag_paging(search_dto s_dto);
}
