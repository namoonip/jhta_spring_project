package kr.co.jhta.vo.appli;

import java.util.Date;

public class Leave {
	
	private int no;
	private int stuNo;
	private String code;
	private Date enrollDate;
	private String pass;
	private Date okayDate;
	private Date reinDate;
	private int remainNum;	// 남아있는 신청 가능한 학기
	
	public Leave() {}
	
	public Leave(int no, int stuNo, String code, Date enrollDate, String pass, Date okayDate, Date reinDate,
			int remainNum) {
		super();
		this.no = no;
		this.stuNo = stuNo;
		this.code = code;
		this.enrollDate = enrollDate;
		this.pass = pass;
		this.okayDate = okayDate;
		this.reinDate = reinDate;
		this.remainNum = remainNum;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getStuNo() {
		return stuNo;
	}
	public void setStuNo(int stuNo) {
		this.stuNo = stuNo;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public Date getOkayDate() {
		return okayDate;
	}
	public void setOkayDate(Date okayDate) {
		this.okayDate = okayDate;
	}
	public Date getReinDate() {
		return reinDate;
	}
	public void setReinDate(Date reinDate) {
		this.reinDate = reinDate;
	}
	public int getRemainNum() {
		return remainNum;
	}
	public void setRemainNum(int remainNum) {
		this.remainNum = remainNum;
	}

}
