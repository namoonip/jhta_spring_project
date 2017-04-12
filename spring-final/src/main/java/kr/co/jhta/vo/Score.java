package kr.co.jhta.vo;

public class Score {
	private int regiNo;
	private int scoreNo;
	private int scoreCredit;
	private String scoreGrade;
	private int reportScore;
	private int attScore;
	private int midtermScore;
	private int endtermScore;
	
	public int getRegiNo() {
		return regiNo;
	}
	public int getScoreNo() {
		return scoreNo;
	}
	public int getScoreCredit() {
		return scoreCredit;
	}
	public String getScoreGrade() {
		return scoreGrade;
	}
	public int getReportScore() {
		return reportScore;
	}
	public int getAttScore() {
		return attScore;
	}
	public int getMidtermScore() {
		return midtermScore;
	}
	public int getEndtermScore() {
		return endtermScore;
	}
	public void setRegiNo(int regiNo) {
		this.regiNo = regiNo;
	}
	public void setScoreNo(int scoreNo) {
		this.scoreNo = scoreNo;
	}
	public void setScoreCredit(int scoreCredit) {
		this.scoreCredit = scoreCredit;
	}
	public void setScoreGrade(String scoreGrade) {
		this.scoreGrade = scoreGrade;
	}
	public void setReportScore(int reportScore) {
		this.reportScore = reportScore;
	}
	public void setAttScore(int attScore) {
		this.attScore = attScore;
	}
	public void setMidtermScore(int midtermScore) {
		this.midtermScore = midtermScore;
	}
	public void setEndtermScore(int endtermScore) {
		this.endtermScore = endtermScore;
	}
	
	@Override
	public String toString() {
		return "Score [regiNo=" + regiNo + ", scoreNo=" + scoreNo + ", scoreCredit=" + scoreCredit + ", scoreGrade="
				+ scoreGrade + ", reportScore=" + reportScore + ", attScore=" + attScore + ", midtermScore="
				+ midtermScore + ", endtermScore=" + endtermScore + "]";
	}
}
