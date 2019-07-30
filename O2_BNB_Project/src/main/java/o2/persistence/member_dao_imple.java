package o2.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import o2.data.member_dto;
import o2.data.scrap_dto;
import o2.data.user_pay_dto;

@Repository
public class member_dao_imple extends SqlSessionDaoSupport implements member_dao {
	public int select_ch(String email) {
		return getSqlSession().selectOne("select_ch", email);
	};
	
	public member_dto select_id(String email) {
		return getSqlSession().selectOne("select_id", email);
	}

	public void update_pw(String tempo_pw, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("tempo_pw", tempo_pw);
		map.put("email", email);
		getSqlSession().update("update_pw", map);
	}
	
	public int scrap_ch(String id, String h_num) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("h_num", h_num);
		return getSqlSession().selectOne("scrap_ch", map);
	}
	
	public int home_review_ch(String h_num) {
		return getSqlSession().selectOne("home_review_ch", h_num);
	}
	
	public scrap_dto scrap_dto(String h_num, String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("h_num", h_num);
		map.put("id", id);
		return getSqlSession().selectOne("scrap_dto", map);
	}
	
	public int sc_ho_av_sc(String h_num)  {
		return getSqlSession().selectOne("sc_ho_av_sc", h_num);
	}
	
	public void scrap_insert(scrap_dto dto) {
		getSqlSession().insert("scrap_insert", dto);
	}
	
	public int scrap_cnt(String id)   {
		return getSqlSession().selectOne("scrap_cnt", id);
	}
	
	public List<scrap_dto> scrap_list(int startNum, int endNum, String id)   {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("id", id);
		return getSqlSession().selectList("scrap_list", map);
	};
	
	public void scrap_delete(String num)   {
		getSqlSession().delete("scrap_delete", num);
	}

	public void insert_member(member_dto dto)   {
		getSqlSession().insert("member_insert", dto);
	}
	
	public int member_id(String id)   {
		return getSqlSession().selectOne("member_id", id);
	}
	
	public String select_pw(String id)   {
		return getSqlSession().selectOne("select_pw", id);
	}
	
	public String select_user_type(String id)   {
		return getSqlSession().selectOne("select_user_type", id);
	}
	
	public void delete_member(String id)   {
		getSqlSession().delete("delete_member", id);
	}
	
	public member_dto select_dto(String id)   {
		return getSqlSession().selectOne("select_dto", id);
	}
	
	public void update_member(member_dto dto)   {
		getSqlSession().update("update_member", dto);
	}
	
	public String select_name(String id) {
       return getSqlSession().selectOne("select_name", id);
    }
	
    public List<member_dto> user_list(String keyword, String preItems, String items) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("keyword", keyword);
    	map.put("preItems", preItems);
    	map.put("items", items);
    	System.out.println("keyword : " + keyword+
    					   " preItems : " + preItems+
    					   " items : " + items);
    	return getSqlSession().selectList("user_list", map);
    }
    
    public member_dto user_dto(String num) {
    	return getSqlSession().selectOne("user_dto", num);
    }
    
    public void user_type_change(String id){
    	getSqlSession().update("user_type_change",id);
    }
    
    public void update_member_admin(member_dto dto) {
    	getSqlSession().update("update_member_admin", dto);
    }
}
