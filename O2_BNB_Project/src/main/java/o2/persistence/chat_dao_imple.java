package o2.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import o2.data.chat_room_dto;
import o2.data.chat_content_dto;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;



@Repository
public class chat_dao_imple extends SqlSessionDaoSupport implements chat_dao{
	public chat_room_dto chat_room_dto(String room_name) throws Exception {
		return getSqlSession().selectOne("chat_room_dto", room_name);
	}
	
	public void chat_room_in(String room_name) throws Exception {
		getSqlSession().insert("chat_room_in", room_name);
	}
	
	public List<chat_room_dto> chat_room_list(String id) throws Exception {
		return getSqlSession().selectList("chat_room_list", id);
	}
	
	public void chat_con_in(chat_content_dto dto) throws Exception {
		getSqlSession().insert("chat_con_in", dto);
	}
	
	public List<chat_content_dto> chat_con_list(String room_name, String id) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("room_name", room_name);
		map.put("id", id);
		return getSqlSession().selectList("chat_con_list", map);
	}
	
	public void chat_room_per_dec(String id, String room_name) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("room_name", room_name);
		getSqlSession().update("chat_room_per_dec", map);
	}
	
	public void chat_room_val_update(String room_name) throws Exception {
		getSqlSession().update("chat_room_val_update", room_name);
	}
	
	public void chat_con_del_ch_update(String room_name, String del_ch) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("room_name", room_name);
		map.put("del_ch", del_ch);
		getSqlSession().update("chat_con_del_ch_update", map);
	}
	
	public void chat_room_per_inc(String room_name) throws Exception {
		getSqlSession().update("chat_room_per_inc", room_name);
	}
	
	public void chat_room_re_in(String room_name) throws Exception {
		getSqlSession().update("chat_room_re_in", room_name);
	}
}
