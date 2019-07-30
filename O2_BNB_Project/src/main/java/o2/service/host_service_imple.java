package o2.service;


import java.util.List;

import o2.data.home_dto;
import o2.data.home_guest_dto;
import o2.data.host_review_dto;
import o2.data.user_pay_dto;
import o2.persistence.home_dao_imple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class host_service_imple {

	@Autowired
	home_dao_imple dao;
	
	public void homeinsert(home_dto dto)
	{
		dao.homeinsert(dto);
	}
	
	public List<home_dto> homeselect(int start,int end)
	{
		return dao.homeselect(start,end);
	}
	
	public int home_totalcount()
	{
		
		return dao.home_totalcount();
		
	}
	
	public List<home_dto> host_homelist(String id)
	{
		return dao.host_homelist(id);
	}
	
	public home_dto home_select_data(int num)
	{
		return dao.home_select_data(num);
	}
	
	public void home_delete_data(int num)
	{
		dao.home_delete_data(num);
	}
	
	public void home_update_data(home_dto dto)
	{
		dao.home_update_data(dto);
	}
	
	public void home_guest_insert(home_guest_dto dto)
	{
		dao.home_guest_insert(dto);
	}
	
	public List<home_guest_dto> home_guest_select(home_dto dto)
	{
		return dao.home_guest_select(dto);
	}
	
	public List<host_review_dto> host_review_select(int start,int end)
	{
		return dao.host_review_select(start,end);
	}
	
	public void host_update_home_guest_cancel_type(home_guest_dto dto)
	{
		dao.host_update_home_guest_cancel_type(dto);
	}
	
	public void host_update_user_pay_pay_chcek(user_pay_dto dto)
	{
		dao.host_update_user_pay_pay_chcek(dto);
	}
}
