package kr.co.jhta.rest.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * @author JHTA
 *
 */
public class User {
	
	private int no;
	private String id;
	@JsonIgnore
	private String pwd;
	private String name;
	private String phone;
	private String email;
	private int completedTodo;
	private int uncompletedTodo;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(int no, String id, String pwd, String name, String phone, String email) {
		super();
		this.no = no;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.regDate = new Date();
	}

	public User(String id, String pwd, String name, String phone, String email) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.regDate = new Date();
	}
	
	public User(int no, String id, String pwd, String name, String phone, String email, int completedTodo,
			int uncompletedTodo, Date regDate) {
		super();
		this.no = no;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.completedTodo = completedTodo;
		this.uncompletedTodo = uncompletedTodo;
		this.regDate = regDate;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCompletedTodo() {
		return completedTodo;
	}
	public void setCompletedTodo(int completedTodo) {
		this.completedTodo = completedTodo;
	}
	public int getUncompletedTodo() {
		return uncompletedTodo;
	}
	public void setUncompletedTodo(int uncompletedTodo) {
		this.uncompletedTodo = uncompletedTodo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "User [no=" + no + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", phone=" + phone + ", email="
				+ email + ", completedTodo=" + completedTodo + ", uncompletedTodo=" + uncompletedTodo + ", regDate="
				+ regDate + "]";
	}
}
