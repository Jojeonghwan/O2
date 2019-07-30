package o2.service;

import java.util.List;

import o2.data.member_dto;
import o2.data.scrap_dto;
import o2.data.user_pay_dto;

public interface member_service {
	public int select_ch(String email) throws Exception;
	public String select_id(String email);
	public void update_pw(String tempo_pw, String email) throws Exception;
	public int scrap_ch(String id, String h_num) throws Exception;
	public int home_review_ch(String h_num) throws Exception;
	public scrap_dto scrap_dto(String h_num, String id) throws Exception;
	public int sc_ho_av_sc(String h_num) throws Exception;
	public void scrap_insert(scrap_dto dto) throws Exception;
	public int scrap_cnt(String id) throws Exception;
	public List<scrap_dto> scrap_list(int startNum, int endNum, String id) throws Exception;
	public void scrap_delete(String num) throws Exception;
	public void insert_member(member_dto dto) throws Exception;
	public int member_id(String id) throws Exception;
	public String select_pw(String id) throws Exception;
	public String select_user_type(String id) throws Exception;
	public void delete_member(String id) throws Exception;
	public member_dto select_dto(String id) throws Exception;
	public void update_member(member_dto dto) throws Exception;
	public String select_name(String id) throws Exception;
	public List<member_dto> user_list(String keyword, String preItems, String items) throws Exception;
	public member_dto user_dto(String num)throws Exception;
	public void user_type_change(String id);
	public void update_member_admin(member_dto dto);
}
