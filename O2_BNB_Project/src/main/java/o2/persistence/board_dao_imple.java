package o2.persistence;

import java.util.List;

import o2.data.home_review_dto;
import o2.data.user_pay_dto;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class board_dao_imple extends SqlSessionDaoSupport implements board_dao
{
	
	public void user_pay_insert(user_pay_dto dto){
		getSqlSession().insert("user_pay_insert",dto);
	}
	
	public List<user_pay_dto> user_pay_select_by_id(String id){
		return getSqlSession().selectList("user_pay_select_by_id",id);
	}
	
	public user_pay_dto user_pay_select_by_num(String num) {
		return getSqlSession().selectOne("user_pay_select_by_num", num);
	}
	
	public void insert_review(home_review_dto h_re_dto){
		getSqlSession().insert("review_insert", h_re_dto);
	}
	
	public List<home_review_dto> select_review(int h_num){
		return getSqlSession().selectList("select_review_list", h_num);
	}
	
	public void delete_review(int num){
		getSqlSession().delete("review_delete", num);
	}
	
	public home_review_dto selectReview_dto(int num){
		return getSqlSession().selectOne("select_review_dto", num);
	}
	
	public void update_review(home_review_dto dto){
		getSqlSession().update("review_update", dto);
	}
	
	public double review_starRating(int h_num){
		double score = 0;
		double beRating = getSqlSession().selectOne("review_starRating", h_num);
		if(beRating != 0.0) {
			score = getSqlSession().selectOne("review_starRating", h_num);
		} else {
			score = 0.0;
		}
		return score;
	}
	
	public int beStarRating(int h_num){
		return getSqlSession().selectOne("beStarRating", h_num);
	}
}
