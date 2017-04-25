package kr.co.jhta.vo;

import java.sql.Date;

import kr.co.jhta.vo.stu.Enroll;
import kr.co.jhta.vo.stu.Student;

public class PreportContent {
	private int no;
	private Preport report;
	private Student student;
	private String title;
	private String content;
	private String fileName;
	private String show;
	private Enroll enroll;
	private Date enrollDate;

	public PreportContent(){
		
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Preport getReport() {
		return report;
	}

	public void setReport(Preport report) {
		this.report = report;
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

	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}

	public Enroll getEnroll() {
		return enroll;
	}

	public void setEnroll(Enroll enroll) {
		this.enroll = enroll;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public PreportContent(int no, Preport report, Student student, String title, String content, String fileName,
			String show, Enroll enroll, Date enrollDate) {
		super();
		this.no = no;
		this.report = report;
		this.student = student;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
		this.show = show;
		this.enroll = enroll;
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "PreportContent [no=" + no + ", report=" + report + ", student=" + student + ", title=" + title
				+ ", content=" + content + ", fileName=" + fileName + ", show=" + show + ", enroll=" + enroll
				+ ", enrollDate=" + enrollDate + "]";
	}

}
