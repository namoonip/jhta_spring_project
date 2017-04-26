package kr.co.jhta.vo;

public class LectureRatingScore {

	private int ratingNumber;
	private int subjectNo;
	private String professorId;
	private int ratingScore;
	
	@Override
	public String toString() {
		return "LectureRatingScore [ratingNumber=" + ratingNumber + ", subjectNo=" + subjectNo + ", professorId="
				+ professorId + ", ratingScore=" + ratingScore + "]";
	}

	public int getRatingNumber() {
		return ratingNumber;
	}

	public void setRatingNumber(int ratingNumber) {
		this.ratingNumber = ratingNumber;
	}

	public int getSubjectNo() {
		return subjectNo;
	}

	public void setSubjectNo(int subjectNo) {
		this.subjectNo = subjectNo;
	}

	public String getProfessorId() {
		return professorId;
	}

	public void setProfessorId(String professorId) {
		this.professorId = professorId;
	}

	public int getRatingScore() {
		return ratingScore;
	}

	public void setRatingScore(int ratingScore) {
		this.ratingScore = ratingScore;
	}
	
	
	
}
