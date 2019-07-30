package o2.service;

import java.util.List;

import o2.data.home_dto;
import o2.data.home_guest_dto;
import o2.data.host_review_dto;
import o2.data.user_pay_dto;

public interface host_service {
	public void homeinsert(home_dto dto);
	public List<home_dto> homeselect(int start,int end);
	public int home_totalcount();
	public List<home_dto> host_homelist(String id);
	public home_dto home_select_data(int num);
	public void home_delete_data(int num);
	public void home_update_data(home_dto dto);
	public void home_guest_insert(home_guest_dto dto);
	public List<home_guest_dto> home_guest_select(home_dto dto);
	public List<host_review_dto> host_review_select(int start,int end);
	public void host_update_home_guest_cancel_type(home_guest_dto dto);
	public void host_update_user_pay_pay_chcek(user_pay_dto dto);
}
