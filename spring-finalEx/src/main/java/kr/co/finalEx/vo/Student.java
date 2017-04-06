package kr.co.finalEx.vo;

import java.util.Date;

public class Student {

	private int no;
	private String name;
	private String id;
	private String pwd;
	private Date regdate;
	
	
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(int no, String name, String id, String pwd, Date regdate) {
		super();
		this.no = no;
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.regdate = regdate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
