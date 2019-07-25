package o2.data;

import com.sun.jmx.snmp.Timestamp;

public class chat_content_dto {
	private String num;
	private String writer;
	private String content;
	private Timestamp writeday;
	private String ip;
	private String del_ch;
	private String room_name;
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getDel_ch() {
		return del_ch;
	}
	public void setDel_ch(String del_ch) {
		this.del_ch = del_ch;
	}
	
}
