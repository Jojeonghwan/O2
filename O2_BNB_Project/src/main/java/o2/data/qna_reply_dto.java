package o2.data;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class qna_reply_dto {
	private String num;
	private String q_num;
	private String id;
	private String content;
	private Timestamp writeday;
	private String day;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getQ_num() {
		return q_num;
	}
	public void setQ_num(String q_num) {
		this.q_num = q_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	
	public String getDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return sdf.format(getWriteday());
	}
	public void setDay(String day) {
		this.day = day;
	}
}
