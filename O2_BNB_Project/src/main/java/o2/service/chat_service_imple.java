package o2.service;

import java.util.List;

import o2.data.chat_room_dto;
import o2.data.chat_content_dto;
import o2.persistence.chat_dao;
import o2.persistence.chat_dao_imple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class chat_service_imple implements chat_service{
	@Autowired
	chat_dao_imple dao;
	
	public chat_room_dto chat_room_dto(String room_name) throws Exception {
		return dao.chat_room_dto(room_name);
	}
	
	public void chat_room_in(String room_name) throws Exception {
		dao.chat_room_in(room_name);
	}
	
	public List<chat_room_dto> chat_room_list(String id) throws Exception {
		return dao.chat_room_list(id);
	}
	
	public void chat_con_in(chat_content_dto dto) throws Exception {
		dao.chat_con_in(dto);
	}
	
	public List<chat_content_dto> chat_con_list(String room_name, String id) throws Exception {
		return dao.chat_con_list(room_name, id);
	}
	
	public void chat_room_per_dec(String id, String room_name) throws Exception {
		dao.chat_room_per_dec(id, room_name);
	}
	
	public void chat_room_val_update(String room_name) throws Exception {
		dao.chat_room_val_update(room_name);
	}
	public void chat_con_del_ch_update(String room_name, String del_ch) throws Exception {
		dao.chat_con_del_ch_update(room_name, del_ch);
	}
	
	public void chat_room_per_inc(String room_name) throws Exception {
		dao.chat_room_per_inc(room_name);
	}
	
	public void chat_room_re_in(String room_name) throws Exception {
		dao.chat_room_re_in(room_name);
	}
}
