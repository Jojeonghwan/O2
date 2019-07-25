package o2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import o2.data.home_dto;
import o2.data.main_rtime_dto;
import o2.data.search_dto;
import o2.persistence.main_dao_imple;

@Service
public class main_service_imple implements main_service{
	@Autowired
	main_dao_imple dao;
	
	public List<main_rtime_dto> get_rtime_list() {
		return dao.get_rtime_list();
	}
	
	public List<home_dto> search_data_list(search_dto dto){
		return dao.search_data_list(dto);
	}
	
	
	public List<home_dto> search_tag(String tag){
		return dao.search_tag(tag);
	}
	
	public List<home_dto> infiniteList(search_dto s_dto){
		System.out.println("서비스");
		return dao.infiniteList(s_dto);
	}
}
