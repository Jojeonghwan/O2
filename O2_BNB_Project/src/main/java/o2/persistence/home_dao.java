package o2.persistence;

import java.util.List;

import o2.data.home_dto;
import o2.data.home_guest_dto;
import o2.data.host_review_dto;
import o2.data.search_dto;
import o2.data.user_pay_dto;

public interface home_dao {
	/* 생성일자 : 2019.07.1
	 * 생 성 자 : 조정환
	 * 용    도 : 홈 추가
	 * */
	public void homeinsert(home_dto dto);
	
	/* 생성일자 : 2019.07.2
	 * 생 성 자 : 조정환
	 * 용    도 : 리스트 추가
	 * */
	public List<home_dto> homeselect(int start,int end);
	
	/* 생성일자 : 2019.07.2
	 * 생 성 자 : 조정환
	 * 용    도 : 토탈넘
	 * */
	public int home_totalcount();
	/* 생성일자 : 2019.07.3
	 * 생 성 자 : 조정환
	 * 용    도 : 호스트의 방리스트불러올 유넘과 유저넘버를 비교해 불러오는것
	 * */
	public List<home_dto> host_homelist(String id);
	/* 생성일자 : 2019.07.3
	 * 생 성 자 : 조정환
	 * 용    도 : boardcontent로 넘길 값을 번호를 통해 얻는것
	 * */
	public home_dto home_select_data(int num);
	/* 생성일자 : 2019.07.6
	 * 생 성 자 : 조정환
	 * 용    도 : formlist에 있는 데이터 삭제
	 */
	public void home_delete_data(int num);
	/* 생성일자 : 2019.07.9
	 * 생 성 자 : 조정환
	 * 용    도 : 업데이트용
	 */
	public void home_update_data(home_dto dto);
	/* 생성일자 : 2019.07.11
	 * 생 성 자 : 조정환
	 * 용    도 : home_guest insert 용
	 */
	public void home_guest_insert(home_guest_dto dto);
	/* 생성일자 : 2019.07.9
	 * 생 성 자 : 조정환
	 * 용    도 : home_guest select 용
	 */
	public List<home_guest_dto> home_guest_select(home_dto dto);
	
	public List<host_review_dto> host_review_select(int start,int end);
	
	
	/* 생성일자 : 2019.07.23
	 * 생 성 자 : 조정환
	 * 용    도 : home_guest delete 예약취소용
	 */
	public void host_update_home_guest_cancel_type(home_guest_dto dto);
	
	/* 생성일자 : 2019.07.23
	 * 생 성 자 : 조정환
	 * 용    도 : user_pay delete 예약취소용
	 */
	public void host_update_user_pay_pay_chcek(user_pay_dto dto);
	
	
	public List<home_dto> infiniteList(search_dto s_dto);
	
}
