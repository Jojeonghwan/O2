package o2.data;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class home_review_dto { //o2_review 테이블 사용
	
	private int num;
	private String id;
	private String content;
	private double score;
	private String thumb_nail;
	private Timestamp writeday;
	private String img_name;
	private int h_num;
	private ArrayList<MultipartFile> upfile;
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getThumb_nail() {
		return thumb_nail;
	}
	public void setThumb_nail(String thumb_nail) {
		this.thumb_nail = thumb_nail;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public int getH_num() {
		return h_num;
	}
	public void setH_num(int h_num) {
		this.h_num = h_num;
	}
	public ArrayList<MultipartFile> getUpfile() {
		return upfile;
	}
	public void setUpfile(ArrayList<MultipartFile> upfile) {
		this.upfile = upfile;
	}
	
	
}
