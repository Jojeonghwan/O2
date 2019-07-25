package o2.service;

import java.util.List;

import o2.data.home_review_dto;
import o2.data.qna_dto;

public interface qna_service {
	public void insert_qna(qna_dto dto) throws Exception;
	public List<qna_dto> qna_paginglist(int start, int end, String id) throws Exception;
	public qna_dto qna_getData(int num) throws Exception;
	public int qna_cnt_by_id(String id) throws Exception;
	public void qna_update(qna_dto dto) throws Exception;
	public String select_pw(int num) throws Exception;
	public void delete_qna(int num) throws Exception;
	public List<qna_dto> qna_notice() throws Exception;

}
