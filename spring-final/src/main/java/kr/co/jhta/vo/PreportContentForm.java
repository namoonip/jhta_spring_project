package kr.co.jhta.vo;

import kr.co.jhta.vo.stu.Student;

public class PreportContentForm {
	
	private int no;
	private int pfNo;
	private Student student;
	private String title;
	private String content;
	private String fileName;
	private int eno;
	
	public PreportContentForm() {
		
	}
	
	public PreportContentForm(int no, int pfNo, Student student, String title, String content, String fileName,
			int eno) {
		super();
		this.no = no;
		this.pfNo = pfNo;
		this.student = student;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
		this.eno = eno;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPfNo() {
		return pfNo;
	}
	public void setPfNo(int pfNo) {
		this.pfNo = pfNo;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	
}
