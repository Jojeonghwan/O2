package o2.service;


import java.util.List;

import o2.data.home_review_dto;
import o2.data.qna_dto;
import o2.data.qna_reply_dto;
import o2.persistence.home_dao_imple;
import o2.persistence.qna_dao_imple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class qna_service_imple implements qna_service {
	@Autowired
	qna_dao_imple dao;

	
	public void insert_qna(qna_dto dto) throws Exception
	{
		dao.insert_qna(dto);
	}
	
	public List<qna_dto> qna_paginglist(int start, int end, String id) throws Exception
	{
		return dao.qna_paginglist(start, end, id);
	}
	
	
	public qna_dto qna_getData(int num) throws Exception
	{
		return dao.qna_getData(num);
	}
	
	public int qna_cnt_by_id(String id) throws Exception
	{
		return dao.qna_cnt_by_id(id);
	}
	
	public void qna_update(qna_dto dto) throws Exception
	{
		dao.qna_update(dto);
	}
	
	public String select_pw(int num) throws Exception
	{
		return dao.select_pw(num);
	}
	
	public void delete_qna(int num) throws Exception
	{
		dao.delete_qna(num);
	}
	
	public List<qna_dto> qna_notice() throws Exception
	{
		return dao.qna_notice();
	}
	
	public void insert_reply(qna_reply_dto qr_dto) throws Exception
	{
		dao.insert_review(qr_dto);
	}

}
