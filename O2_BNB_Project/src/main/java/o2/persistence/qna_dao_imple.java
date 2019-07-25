package o2.persistence;

import java.util.HashMap;
import java.util.List;

import o2.data.qna_dto;


import o2.data.qna_reply_dto;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class qna_dao_imple extends SqlSessionDaoSupport implements qna_dao {
	
	public void insert_qna(qna_dto dto)  throws Exception
	{
		getSqlSession().insert("qna_insert", dto);
	}
	
	public List<qna_dto> qna_paginglist(int start, int end, String id) throws Exception
	{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		List<qna_dto> list = getSqlSession().selectList("qna_paginglist", map);
		System.out.println(list.size());
		return list;
	}
	
	
	public qna_dto qna_getData(int num) throws Exception
	{
		return getSqlSession().selectOne("qna_getData", num);
	}
	
	public int qna_cnt_by_id(String id) throws Exception
	{
		System.out.println(id + ": 로그인 id");
		return getSqlSession().selectOne("qna_cnt_by_id", id);
	}
	
	public void qna_update(qna_dto dto) throws Exception
	{
		getSqlSession().update("qna_update", dto);
	}
	
	
	public String select_pw(int num) throws Exception
	{
		return getSqlSession().selectOne("select_qna_pw", num);
	}
	
	public void delete_qna(int num) throws Exception
	{
		getSqlSession().delete("qna_delete", num);
	}
	
	public List<qna_dto> qna_notice() throws Exception
	{
		return getSqlSession().selectList("qna_noticelist");
	}
	
	public void insert_review(qna_reply_dto qr_dto) throws Exception
	{
		getSqlSession().insert("qna_review_insert", qr_dto);
	}
}
