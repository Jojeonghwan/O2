package o2.persistence;

import java.util.List;

import o2.data.member_dto;
import o2.data.scrap_dto;
import o2.data.user_pay_dto;

public interface member_dao {
	/* 생성일자 : 2019.06.27
	 * 생 성 자 : 김보애
	 * 용    도 : email에 해당하는 계정있는지 확인
	 * */
	public int select_ch(String email);
	
	/* 생성일자 : 2019.06.27
	 * 생 성 자 : 김보애
	 * 용    도 : email에 해당하는 dto 불러오기 - id 찾을라고 
	 * */
	public member_dto select_id(String email);
	
	/* 생성일자 : 2019.06.27
	 * 생 성 자 : 김보애
	 * 용    도 : email에 해당하는 dto의 pw를 임시비밀번호로 변경
	 * */
	public void update_pw(String tempo_pw, String email);
	
	/* 생성일자 : 2019.06.28
	 * 생 성 자 : 김보애
	 * 용    도 : 스크랩 되어 있는지 확인
	 * */
	public int scrap_ch(String id, String h_num);

	///////////////////////추가시작///////////////////////////////
	/* 생성일자 : 2019.07.06
	 * 생 성 자 : 김보애
	 * 용    도 : 리뷰 있는지 확인
	 * */
	public int home_review_ch(String h_num);
	
	/* 생성일자 : 2019.07.06
	 * 생 성 자 : 김보애
	 * 용    도 : scrap dto 가져오기
	 * */
	public scrap_dto scrap_dto(String h_num, String id);
	
	/* 생성일자 : 2019.07.06
	 * 생 성 자 : 김보애
	 * 용    도 : 스크랩 하려는 홈의 평점 가져오기
	 * */
	public int sc_ho_av_sc(String h_num);
	
	/* 생성일자 : 2019.07.06
	 * 생 성 자 : 김보애
	 * 용    도 : 스크랩 인설트
	 * */
	public void scrap_insert(scrap_dto dto);
	///////////////////////추가끝끝///////////////////////////////
	
	/* 생성일자 : 2019.06.28
	 * 생 성 자 : 김보애
	 * 용    도 : 스크랩 리스트 갯수 가져오기
	 * */
	public int scrap_cnt(String id);
	
	/* 생성일자 : 2019.06.28
	 * 생 성 자 : 김보애
	 * 용    도 : 스크랩 리스트 가져오기
	 * */
	public List<scrap_dto> scrap_list(int startNum, int endNum, String id);	
	
	/* 생성일자 : 2019.07.06
	 * 생 성 자 : 김보애
	 * 용    도 : 스크랩 삭제
	 * */
	public void scrap_delete(String num);
	
	/* 생성일자 : 2019. 07. 01
	 * 생 성 자 : 박소윤 
	 * 용    도 : 회원가입
	 */
	public void insert_member(member_dto m_dto);
	
	/* 생성일자 : 2019. 07. 01
	 * 생 성 자 : 박소윤 
	 * 용    도 : id 중복확인
	 */
	public int member_id(String id);
	
	/* 생성일자 : 2019. 07. 03
	 * 생 성 자 : 박소윤 
	 * 용    도 : 로그인 - 비밀번호 확인
	 */
	public String select_pw(String id) ;
	
	/* 생성일자 : 2019. 07. 03
	 * 생 성 자 : 박소윤 
	 * 용    도 : user_type 반환
	 */
	public String select_user_type(String id);
	
	/* 생성일자 : 2019. 07. 04
	 * 생 성 자 : 박소윤 
	 * 용    도 : 회원정보 삭제
	 */
	public void delete_member(String id);
	
	/* 생성일자 : 2019. 07. 04
	 * 생 성 자 : 박소윤 
	 * 용    도 : 회원정보 dto 반환
	 */
	public member_dto select_dto(String id);
	
	/* 생성일자 : 2019. 07. 05
	 * 생 성 자 : 박소윤 
	 * 용    도 : 회원정보 수정
	 */
	public void update_member(member_dto dto);
	
	/* 생성일자 : 2019. 07. 05
    * 생 성 자 : 조정환
    * 용    도 : name 반환
    */
    public String select_name(String id);
    
	/* 생성일자 : 2019. 07. 17
     * 생 성 자 : 김보애
     * 용    도 : user list 반환
     */
    public List<member_dto> user_list(String keyword, String preItems, String items);
    
	/* 생성일자 : 2019. 07. 22
     * 생 성 자 : 김보애
     * 용    도 : user dto 반환
     */
    public member_dto user_dto(String num);
    
    /* 생성일자 : 2019. 07. 26
     * 생 성 자 : 조정환
     * 용    도 : 유저타입 호스트로 변환
     */
    public void user_type_change(String id);
    
    /* 생성일자 : 2019. 07. 30
	 * 생 성 자 : 김보애 
	 * 용    도 : 관리자 페이지 회원정보 수정
	 */
	public void update_member_admin(member_dto dto);
}
