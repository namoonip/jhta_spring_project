package kr.co.jhta.todo.vo;

import java.util.Date;

public class Todo {

	private int no;
	private String title;
	private Date eventDate;
	private String description;
	private String completed;
	private User user;	// tb_todo의 user_no에 대응 
	private String mapFilename;		// 약도 파일명 - 웹에서 보기
	private String attachFilename;	// 첨부 파일명 - 웹에서 못봄
	private Date regdate;
	
	public Todo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Todo(int no, String title, Date eventDate, String description, String completed, User user,
			String mapFilename, String attachFilename, Date regdate) {
		super();
		this.no = no;
		this.title = title;
		this.eventDate = eventDate;
		this.description = description;
		this.completed = completed;
		this.user = user;
		this.mapFilename = mapFilename;
		this.attachFilename = attachFilename;
		this.regdate = regdate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getEventDate() {
		return eventDate;
	}
	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCompleted() {
		return completed;
	}
	public void setCompleted(String completed) {
		this.completed = completed;
	}
	public String getAttachFilename() {
		return attachFilename;
	}
	public void setAttachFilename(String attachFilename) {
		this.attachFilename = attachFilename;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}	
	public String getMapFilename() {
		return mapFilename;
	}
	public void setMapFilename(String mapFilename) {
		this.mapFilename = mapFilename;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
