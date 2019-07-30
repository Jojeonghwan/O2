package o2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import o2.data.member_dto;
import o2.data.scrap_dto;
import o2.persistence.member_dao_imple;

@Service
public class member_service_imple implements member_service {
	@Autowired
	member_dao_imple dao;
	
	public int select_ch(String email) throws Exception {
		return dao.select_ch(email);
	}

	public String select_id(String email)  {
		String result="";
		try {
			 result = dao.select_id(email).getId();
			if(result==null) {
				result = "계정 없음";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}

	public void update_pw(String tempo_pw, String email) throws Exception {
		dao.update_pw(tempo_pw, email);
	}
	
	public int scrap_ch(String id, String h_num) throws Exception {
		return dao.scrap_ch(id, h_num);
	}
	
	public int home_review_ch(String h_num) throws Exception {
		return dao.home_review_ch(h_num);
	}
	
	public scrap_dto scrap_dto(String h_num, String id) throws Exception {
		return dao.scrap_dto(h_num, id);
	}
	
	public int sc_ho_av_sc(String h_num) throws Exception {
		return dao.sc_ho_av_sc(h_num);
	}
	
	public void scrap_insert(scrap_dto dto) throws Exception {
		dao.scrap_insert(dto);
	}
	
	public int scrap_cnt(String id) throws Exception {
		return dao.scrap_cnt(id);
	}
	
	public List<scrap_dto> scrap_list(int startNum, int endNum, String id) throws Exception {
		return dao.scrap_list(startNum, endNum, id);
	}
	
	public void scrap_delete(String num) throws Exception {
		dao.scrap_delete(num);
	}
	
	public void insert_member(member_dto dto) throws Exception {
		dao.insert_member(dto);
	}
	
	public int member_id(String id) throws Exception {
		return dao.member_id(id);
	}
	
	public String select_pw(String id) throws Exception {
		return dao.select_pw(id);
	}
	
	public String select_user_type(String id) throws Exception {
		return dao.select_user_type(id);
	}
	
	public void delete_member(String id) throws Exception {
		dao.delete_member(id);
	}
	
	public member_dto select_dto(String id) throws Exception {
		return dao.select_dto(id);
	}
	
	public void update_member(member_dto dto) throws Exception {
		dao.update_member(dto);
	}
	
	public String select_name(String id) throws Exception {
        return dao.select_name(id);
    }

	public List<member_dto> user_list(String keyword, String preItems, String items) throws Exception {
		return dao.user_list(keyword, preItems, items);
	}
	
	public member_dto user_dto(String num) throws Exception {
		return dao.user_dto(num);
	}
	
	public void user_type_change(String id){
		dao.user_type_change(id);
	}
	
	public void update_member_admin(member_dto dto) {
		dao.update_member_admin(dto);
	}
}
