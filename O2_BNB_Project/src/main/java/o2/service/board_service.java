package o2.service;

import java.util.List;

import o2.data.home_dto;
import o2.data.home_review_dto;
import o2.data.search_dto;
import o2.data.user_pay_dto;

public interface board_service {
	
	public void user_pay_insert(user_pay_dto dto);
	public List<user_pay_dto> user_pay_select_by_id(String id);
	public user_pay_dto user_pay_select_by_num(String num);
	public void insert_review(home_review_dto h_re_dto);
	public List<home_review_dto> select_review(int h_num);
	public void delete_review(int num);
	public home_review_dto selectReview_dto(int num);
	public void update_review(home_review_dto dto);
	public double review_starRating(int h_num);
	public int beStarRating(int h_num);

}
