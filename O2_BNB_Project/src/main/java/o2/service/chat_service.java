package o2.service;

import java.util.List;

import o2.data.chat_room_dto;
import o2.data.chat_content_dto;

public interface chat_service {
	public chat_room_dto chat_room_dto(String room_name) throws Exception;
	
	public void chat_room_in(String room_name) throws Exception;
	
	public List<chat_room_dto> chat_room_list(String id) throws Exception;
	
	public void chat_con_in(chat_content_dto dto) throws Exception;
	
	public List<chat_content_dto> chat_con_list(String room_name, String id) throws Exception;
	
	public void chat_room_per_dec(String id, String room_name) throws Exception;
	
	public void chat_room_val_update(String room_name) throws Exception;
	public void chat_con_del_ch_update(String room_name, String del_ch) throws Exception;
	
	public void chat_room_per_inc(String room_name) throws Exception;
	
	public void chat_room_re_in(String room_name) throws Exception;
}
