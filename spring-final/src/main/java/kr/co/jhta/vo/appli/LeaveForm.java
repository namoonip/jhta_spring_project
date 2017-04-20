package kr.co.jhta.vo.appli;

public class LeaveForm {
	
	private String cCode;
	private String scorePass;
	private int selectSemeter;
	private String reinDate;
	public LeaveForm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LeaveForm(String cCode, String scorePass, int selectSemeter, String reinDate) {
		super();
		this.cCode = cCode;
		this.scorePass = scorePass;
		this.selectSemeter = selectSemeter;
		this.reinDate = reinDate;
	}
	public String getcCode() {
		return cCode;
	}
	public void setcCode(String cCode) {
		this.cCode = cCode;
	}
	public String getScorePass() {
		return scorePass;
	}
	public void setScorePass(String scorePass) {
		this.scorePass = scorePass;
	}
	public int getSelectSemeter() {
		return selectSemeter;
	}
	public void setSelectSemeter(int selectSemeter) {
		this.selectSemeter = selectSemeter;
	}
	public String getReinDate() {
		return reinDate;
	}
	public void setReinDate(String reinDate) {
		this.reinDate = reinDate;
	}

}
