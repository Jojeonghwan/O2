package o2.persistence;

import java.util.List;

import o2.data.qna_dto;
import o2.data.qna_reply_dto;

public interface qna_dao {
	/* 생성일자 : 2019.07.10
	 * 생 성 자 : 박소윤
	 * 용    도 : 문의게시판에 글 추가
	 * */
	public void insert_qna(qna_dto dto) throws Exception;
	
	/* 생성일자 : 2019.07.10
	 * 생 성 자 : 박소윤
	 * 용    도 : 문의게시판 리스트 (아이디)
	 * */
	public List<qna_dto> qna_paginglist(int start, int end, String id) throws Exception;
	
	/* 생성일자 : 2019.07.11
	 * 생 성 자 : 박소윤
	 * 용    도 : id당 문의게시판 글 총 갯수
	 * */
	public int qna_cnt_by_id(String id) throws Exception;
	
	/* 생성일자 : 2019.07.11
	 * 생 성 자 : 박소윤
	 * 용    도 : 게시물 상세페이지
	 * */
	public qna_dto qna_getData(int num) throws Exception;
	
	/* 생성일자 : 2019.07.11
	 * 생 성 자 : 박소윤
	 * 용    도 : 문의글 수정
	 * */
	public void qna_update(qna_dto dto) throws Exception;
	
	/* 생성일자 : 2019.07.14
	 * 생 성 자 : 박소윤
	 * 용    도 : 문의글 수정시 비밀번호 확인
	 * */
	public String select_pw(int num) throws Exception;
	
	/* 생성일자 : 2019.07.14
	 * 생 성 자 : 박소윤
	 * 용    도 : 문의글 삭제 (본인만)
	 * */
	public void delete_qna(int num) throws Exception;
	
	/* 생성일자 : 2019.07.14
	 * 생 성 자 : 박소윤
	 * 용    도 : 공지글 출력
	 * */
	public List<qna_dto> qna_notice() throws Exception;
	
	/* 생성일자 : 2019.07.15
	 * 생 성 자 : 박소윤
	 * 용    도 : 문의글에 리뷰작성
	 * */
	public void insert_review(qna_reply_dto qr_dto) throws Exception;
}
