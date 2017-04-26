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
	private String filename;
	private String filename2;
	private String filename3;
	private String filename4;
	private String filename5;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
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
	
	

	public String getFilename2() {
		return filename2;
	}

	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}

	public String getFilename3() {
		return filename3;
	}

	public void setFilename3(String filename3) {
		this.filename3 = filename3;
	}

	public String getFilename4() {
		return filename4;
	}

	public void setFilename4(String filename4) {
		this.filename4 = filename4;
	}

	public String getFilename5() {
		return filename5;
	}

	public void setFilename5(String filename5) {
		this.filename5 = filename5;
	}

	@Override
	public String toString() {
		return "PreportContent [no=" + no + ", report=" + report + ", student=" + student + ", title=" + title
				+ ", content=" + content + ", filename=" + filename + ", show=" + show + ", enroll=" + enroll
				+ ", enrollDate=" + enrollDate + "]";
	}

}
