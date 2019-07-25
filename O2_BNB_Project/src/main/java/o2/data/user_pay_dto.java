package o2.data;

import java.sql.Date;
import java.sql.Timestamp;

public class user_pay_dto {

	private int num;
	private String name;
	private String id;
	private String home_name;
	private int price;
	private int person;
	private Timestamp reserveday;
	private Date checkin;
	private Date checkout; 
	private int h_num;
	private String addr;
	private String pay_type;
	private String pay_check;
	private String send_ticket_ch;
	
	
	
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
	public int getPerson() {
		return person;
	}
	public void setPerson(int person) {
		this.person = person;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getHome_name() {
		return home_name;
	}
	public void setHome_name(String home_name) {
		this.home_name = home_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getReserveday() {
		return reserveday;
	}
	public void setReserveday(Timestamp reserveday) {
		this.reserveday = reserveday;
	}
	public int getH_num() {
		return h_num;
	}
	public void setH_num(int h_num) {
		this.h_num = h_num;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	public String getPay_check() {
		return pay_check;
	}
	public void setPay_check(String pay_check) {
		this.pay_check = pay_check;
	}
	public String getSend_ticket_ch() {
		return send_ticket_ch;
	}
	public void setSend_ticket_ch(String send_ticket_ch) {
		this.send_ticket_ch = send_ticket_ch;
	}
	


	
}
