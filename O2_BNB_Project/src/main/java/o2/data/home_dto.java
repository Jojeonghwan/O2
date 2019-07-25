package o2.data;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class home_dto {

	private int num;
	private String home_name;
	private String host_name;
	private int person;
	private String addr;
	private String hp;
	private String emer_hp;
	private String intro;
	private String tag;
	private String sub_tag;
	private String id;
	private String img;
	private String facilities;
	private String sub_facilities;
	private int price;
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	private int u_num;
	private ArrayList<MultipartFile> upfile;
	
	
	
	@Override
	public String toString() {
		return "home_dto [num=" + num + ", home_name=" + home_name
				+ ", host_name=" + host_name + ", person=" + person + ", addr="
				+ addr + ", hp=" + hp + ", emer_hp=" + emer_hp + ", intro="
				+ intro + ", tag=" + tag + ", id=" + id + ", img=" + img
				+ ", facilities=" + facilities + ", u_num=" + u_num
				+ ", upfile=" + upfile + "]";
	}
	
	
	public String getSub_tag() {
		return sub_tag;
	}
	public void setSub_tag(String sub_tag) {
		this.sub_tag = sub_tag;
	}
	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}
	public String getSub_facilities() {
		return sub_facilities;
	}
	public void setSub_facilities(String sub_facilities) {
		this.sub_facilities = sub_facilities;
	}
	public int getPerson() {
		return person;
	}
	public void setPerson(int person) {
		this.person = person;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	
	public ArrayList<MultipartFile> getUpfile() {
		return upfile;
	}
	public void setUpfile(ArrayList<MultipartFile> upfile) {
		this.upfile = upfile;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getHome_name() {
		return home_name;
	}
	public void setHome_name(String home_name) {
		this.home_name = home_name;
	}
	public String getHost_name() {
		return host_name;
	}
	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmer_hp() {
		return emer_hp;
	}
	public void setEmer_hp(String emer_hp) {
		this.emer_hp = emer_hp;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getfacilities() {
		return facilities;
	}
	public void setfacilities(String facilities) {
		this.facilities = facilities;
	}
	
	
}
