package o2.service;

import java.util.List;

import o2.data.home_dto;
import o2.data.home_review_dto;
import o2.data.search_dto;
import o2.data.user_pay_dto;
import o2.persistence.board_dao_imple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class board_service_imple implements board_service{
	
	@Autowired
	board_dao_imple dao;
	
	public void user_pay_insert(user_pay_dto dto){
		
		dao.user_pay_insert(dto);
	}
	
	public List<user_pay_dto> user_pay_select_by_id(String id){
		return dao.user_pay_select_by_id(id);
	}
	
	public user_pay_dto user_pay_select_by_num(String num) {
		return dao.user_pay_select_by_num(num);
	}
	
	public void insert_review(home_review_dto h_re_dto){
		dao.insert_review(h_re_dto);
	}
	
	public List<home_review_dto> select_review(int h_num){
		return dao.select_review(h_num);
	}
	
	public void delete_review(int num){
		dao.delete_review(num);
	}
	
	public home_review_dto selectReview_dto(int num){
		return dao.selectReview_dto(num);
	}
	
	public void update_review(home_review_dto dto){
		dao.update_review(dto);
	}
	
	public double review_starRating(int h_num){
		return dao.review_starRating(h_num);
	}
	
	public int beStarRating(int h_num){
		return dao.beStarRating(h_num);
	}
	
	public int reviewCnt(int h_num){
		return dao.reviewCnt(h_num);
	}
}
