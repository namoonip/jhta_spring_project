package kr.co.jhta;

public class ScoreForm {
	private int no;
	private String name;
	private int kor;
	private int eng;
	private int math;
	private int phy;
	private int che;
	private int bio;
	private int mus;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	public int getPhy() {
		return phy;
	}
	public void setPhy(int phy) {
		this.phy = phy;
	}
	public int getChe() {
		return che;
	}
	public void setChe(int che) {
		this.che = che;
	}
	public int getBio() {
		return bio;
	}
	public void setBio(int bio) {
		this.bio = bio;
	}
	public int getMus() {
		return mus;
	}
	public void setMus(int mus) {
		this.mus = mus;
	}
	
	@Override
	public String toString() {
		return "ScoreForm [no=" + no + ", name=" + name + ", kor=" + kor + ", eng=" + eng + ", math=" + math + ", phy="
				+ phy + ", che=" + che + ", bio=" + bio + ", mus=" + mus + "]";
	}
	
}
