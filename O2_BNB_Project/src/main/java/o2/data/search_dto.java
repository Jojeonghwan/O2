package o2.data;

import java.sql.Date;



public class search_dto {
	private String addr;
	private int person;
	private Date checkin;
	private Date checkout;
	private String tag; // theme
	private int price_from;
	private int price_to;
	private int startNum;
	private int endNum;
	private int end;

	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getPrice_from() {
		return price_from;
	}
	public void setPrice_from(int price_from) {
		this.price_from = price_from;
	}
	public int getPrice_to() {
		return price_to;
	}
	public void setPrice_to(int price_to) {
		this.price_to = price_to;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getPerson() {
		return person;
	}
	public void setPerson(int person) {
		this.person = person;
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
	
	
}
