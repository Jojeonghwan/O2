package o2.data;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;


public class qna_dto {
	
	private int num;
	private int q_type;
	private String content;
	private Timestamp writeday;
	private String subject;
	private String id;
	private String pw;
	private int startNum;
	private int endNum;
	private String day;
	
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getQ_type() {
		return q_type;
	}
	public void setQ_type(int q_type) {
		this.q_type = q_type;
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return sdf.format(getWriteday());
	}
	public void setDay(String day) {
		this.day = day;
	}
}
