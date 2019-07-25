package o2.persistence;

import java.util.List;

import o2.data.home_review_dto;
import o2.data.user_pay_dto;

public interface board_dao {

	public void user_pay_insert(user_pay_dto dto);
	public List<user_pay_dto> user_pay_select_by_id(String id);
	/* 생성일자 : 2019.07.08
	 * 생 성 자 : 김보애
	 * 용    도 : 시퀀스 넘에 해당하는 결제 정보 가져오기
	 * */
	public user_pay_dto user_pay_select_by_num(String num);
	
	/* 생성일자 : 2019.07.16
	 * 생 성 자 : 박소윤
	 * 용    도 : 숙소 리뷰 입력하기
	 * */
	public void insert_review(home_review_dto h_re_dto);
	
	/* 생성일자 : 2019.07.16
	 * 생 성 자 : 박소윤
	 * 용    도 : 리뷰 리스트 가져오기
	 * */
	public List<home_review_dto> select_review(int h_num);
	
	/* 생성일자 : 2019.07.22
	 * 생 성 자 : 박소윤
	 * 용    도 : 리뷰 삭제하기
	 * */
	public void delete_review(int num);
	
}
