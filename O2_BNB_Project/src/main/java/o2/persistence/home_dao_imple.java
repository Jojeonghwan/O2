package o2.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import o2.data.home_dto;
import o2.data.home_guest_dto;
import o2.data.host_review_dto;
import o2.data.search_dto;
import o2.data.user_pay_dto;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class home_dao_imple extends SqlSessionDaoSupport implements home_dao {
		
	public void homeinsert(home_dto dto)
	{
		getSqlSession().insert("homeinsert",dto);
	}
	
	public List<home_dto> homeselect(int start,int end)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("start",start);
		map.put("end",end);
		return getSqlSession().selectList("home_paginglist",map);
	}
	
	public int home_totalcount()
	{
		System.out.println("aaa");
		return getSqlSession().selectOne("home_totalcount");
	}
	
	public List<home_dto> host_homelist(String id)
	{
		return getSqlSession().selectList("host_homelist",id);
	}
	
	public home_dto home_select_data(int num)
	{
		return getSqlSession().selectOne("home_select_data",num);
	}
	
	public void home_delete_data(int num)
	{
		getSqlSession().delete("home_delete_data",num);
		
	}
	public void home_update_data(home_dto dto)
	{
		getSqlSession().update("home_update_data",dto);
	}
	public void home_guest_insert(home_guest_dto dto)
	{
		getSqlSession().insert("home_guest_insert",dto);
	}
	public List<home_guest_dto> home_guest_select(home_dto dto)
	{
		return getSqlSession().selectList("home_guest_select",dto);
	}
	public List<host_review_dto> host_review_select(int start, int end)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("start",start);
		map.put("end",end);
		return getSqlSession().selectList("host_review_select",map);
	}
	public void host_update_home_guest_cancel_type(home_guest_dto dto)
	{
		getSqlSession().update("host_update_home_guest_cancel_type",dto);
	}
	
	public void host_update_user_pay_pay_chcek(user_pay_dto dto)
	{
		getSqlSession().update("host_update_user_pay_pay_chcek",dto);
	}

	public List<home_dto> infiniteList(search_dto s_dto)
	{
		return getSqlSession().selectOne("search_data_list_filter", s_dto);
	}
}
