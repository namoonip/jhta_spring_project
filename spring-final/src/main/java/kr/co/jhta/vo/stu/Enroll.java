package kr.co.jhta.vo.stu;

import kr.co.jhta.vo.Subject;
import kr.co.jhta.vo.SubjectDivision;

public class Enroll {

	private int no;
	private Subject subject;
	private SubjectDivision division;
	private String EnrollDay;
	public Enroll() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Enroll(int no, Subject subject, SubjectDivision division, String enrollDay) {
		super();
		this.no = no;
		this.subject = subject;
		this.division = division;
		EnrollDay = enrollDay;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Subject getSubject() {
		return subject;
	}
	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	public SubjectDivision getDivision() {
		return division;
	}
	public void setDivision(SubjectDivision division) {
		this.division = division;
	}
	public String getEnrollDay() {
		return EnrollDay;
	}
	public void setEnrollDay(String enrollDay) {
		EnrollDay = enrollDay;
	}

}
