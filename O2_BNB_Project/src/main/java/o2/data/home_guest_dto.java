package o2.data;

import java.sql.Date;
import java.sql.Timestamp;

public class home_guest_dto {
	private int num;
	private int h_num;
	private String guest_name;
	private int guest_person;
	private Timestamp reserveday;
	private Date checkin;
	private Date checkout;
	private String guest_hp;
	private String guest_email;
	private String host_id;
	private int cancel_type;
	
	
	
	
	public int getCancel_type() {
		return cancel_type;
	}
	public void setCancel_type(int cancel_type) {
		this.cancel_type = cancel_type;
	}
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getH_num() {
		return h_num;
	}
	public void setH_num(int h_num) {
		this.h_num = h_num;
	}
	public String getGuest_name() {
		return guest_name;
	}
	public void setGuest_name(String guest_name) {
		this.guest_name = guest_name;
	}
	public int getGuest_person() {
		return guest_person;
	}
	public void setGuest_person(int guest_person) {
		this.guest_person = guest_person;
	}
	public Timestamp getReserveday() {
		return reserveday;
	}
	public void setReserveday(Timestamp reserveday) {
		this.reserveday = reserveday;
	}
	public Date getCheckin() {
		return checkin;
	}
	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}
	public Date getCheckout() {
		return checkout;
	}
	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}
	public String getGuest_hp() {
		return guest_hp;
	}
	public void setGuest_hp(String guest_hp) {
		this.guest_hp = guest_hp;
	}
	public String getGuest_email() {
		return guest_email;
	}
	public void setGuest_email(String guest_email) {
		this.guest_email = guest_email;
	}
	
	
	

}
