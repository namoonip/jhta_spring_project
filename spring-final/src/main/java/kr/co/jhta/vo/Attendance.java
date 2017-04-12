package kr.co.jhta.vo;

import java.util.Date;

public class Attendance {
	private int attNo;
	private int scoreNo;
	private int count;
	private Date attScore;
	
	public int getAttNo() {
		return attNo;
	}
	public int getScoreNo() {
		return scoreNo;
	}
	public int getCount() {
		return count;
	}
	public Date getAttScore() {
		return attScore;
	}
	public void setAttNo(int attNo) {
		this.attNo = attNo;
	}
	public void setScoreNo(int scoreNo) {
		this.scoreNo = scoreNo;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setAttScore(Date attScore) {
		this.attScore = attScore;
	}	
}
