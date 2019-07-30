package o2.persistence;

import java.util.List;

import o2.data.home_dto;
import o2.data.main_rtime_dto;
import o2.data.search_dto;

public interface main_dao {
	/* 생성일자 : 2019.06.28
	 * 생 성 자 : 김보애
	 * 용    도 : 위치에 따른 평점 높은순 10순위 리스트 불러오기
	 * */
	public List<main_rtime_dto> get_rtime_list(String addr);
	/* 생성일자 : 2019.07.16
	 * 생 성 자 : 조정환
	 * 용    도 : 메인 검색기능
	 * */
	public List<home_dto> search_data_list(search_dto dto);
	
	/* 생성일자 : 2019.07.23
	 * 생 성 자 : 조정환
	 * 용    도 : 메인 해쉬태그 검색기능
	 * */
//	public List<home_dto> search_tag(String tag);
	
	/* 생성일자 : 2019.07.24
	 * 생 성 자 : 박소윤
	 * 용    도 : 리뷰 리스트 20개씩
	 */
	public List<home_dto> infiniteList(search_dto s_dto);
	
	/* 생성일자 : 2019.07.30
	 * 생 성 자 : 박소윤
	 * 용    도 : 리뷰 리스트 totalCount
	 */
	public int boardList_totalCount(search_dto s_dto);
	
	/* 생성일자 : 2019.07.30
	 * 생 성 자 : 박소윤
	 * 용    도 : 리뷰 pagination
	 */
	public List<home_dto> board_pagingList(search_dto s_dto);
	
	/* 생성일자 : 2019.07.30
	 * 생 성 자 : 박소윤
	 * 용    도 : 메인->리뷰 totalCount
	 */
	public int searchList_totalCount(search_dto s_dto);
	
	/* 생성일자 : 2019.07.30
	 * 생 성 자 : 박소윤
	 * 용    도 : 메인->리뷰 pagination
	 */
	public List<home_dto> search_data_pagingList(search_dto s_dto);
	
	/* 생성일자 : 2019.07.30
	 * 생 성 자 : 박소윤
	 * 용    도 : tag검색 totalCount
	 */
	public int searchTagTotalCount(String tag);
	
	/* 생성일자 : 2019.07.23
	 * 생 성 자 : 조정환
	 * 용    도 : 메인 해쉬태그 페이징
	 * */
	public List<home_dto> search_tag_paging(search_dto s_dto);
}
