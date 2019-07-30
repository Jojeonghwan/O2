package o2.persistence;

import java.util.List;

import o2.data.home_dto;
import o2.data.main_rtime_dto;
import o2.data.search_dto;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class main_dao_imple extends SqlSessionDaoSupport implements main_dao {

	public List<main_rtime_dto> get_rtime_list(String addr) {
		List<main_rtime_dto> list = getSqlSession().selectList("get_rtime_list", addr);
		return list;
	}
	
	public List<home_dto> search_data_list(search_dto dto){
		return getSqlSession().selectList("search_data_list", dto);
	}
	
/*	public List<home_dto> search_data_list_filter(search_dto dto){
		return getSqlSession().selectList("search_data_list_filter", dto);
	}*/
/*	public List<home_dto> search_tag(String tag){
		return getSqlSession().selectList("search_tag", tag);
	}*/
	public List<home_dto> search_tag_paging(search_dto s_dto)
	{
		return getSqlSession().selectList("search_tag", s_dto);
	}
	
	public List<home_dto> infiniteList(search_dto s_dto)
	{
		System.out.println("dao");
		System.out.println(s_dto.getTag() + "/" +s_dto.getPrice_from() + "/" +s_dto.getPrice_to());
		List<home_dto> list = getSqlSession().selectList("search_data_list_filter", s_dto);
		System.out.println(s_dto.getCheckin());
		return list;
	}
	
	public int boardList_totalCount(search_dto s_dto)
	{
		return getSqlSession().selectOne("boardList_totalCount", s_dto);
	}
	
	public List<home_dto> board_pagingList(search_dto s_dto)
	{
		return getSqlSession().selectList("boardList_pagingList", s_dto);
	}
	
	public int searchList_totalCount(search_dto s_dto)
	{
		return getSqlSession().selectOne("search_data_totalCount", s_dto);
	}
	
	public List<home_dto> search_data_pagingList(search_dto s_dto)
	{
		return getSqlSession().selectList("search_data_pagingList", s_dto);
	}
	
	public int searchTagTotalCount(String tag)
	{
		return getSqlSession().selectOne("search_tag_totalCount", tag);
	}
}
