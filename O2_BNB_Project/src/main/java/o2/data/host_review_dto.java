package o2.data;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class host_review_dto {
	private int num;
	private String id;
	private String pw;
	private String writer;
	private String subject;
	private String content;
	private int readcount;
	private Timestamp writeday;
	private int h_num;
	private String day;
	
	@Override
	public String toString(){
		return "writer:"+writer+",subject:"+subject+
				",content:"+content;
	}
	public String getDay()
	{
		SimpleDateFormat sdf=
				new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return sdf.format(getWriteday());
	}

	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public int getH_num() {
		return h_num;
	}
	public void setH_num(int h_num) {
		this.h_num = h_num;
	}
	
	
	
}
