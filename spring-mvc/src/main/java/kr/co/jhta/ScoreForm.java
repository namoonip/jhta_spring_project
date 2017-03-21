package kr.co.jhta;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

public class ScoreForm {
	
	@NotNull(message="번호는 필수 입력 값잆니다.")
	private Integer no;
	
	@NotNull(message="이름은 필수 입력 값입니다.")
	@Length(min=2, max=4, message="이름은 2 ~ 4글자 입니다.")
	private String name;
	
	@Min(value=0, message="국어 점수는 0점 이상입니다.")
	@Max(value=100, message="국어 점수는 100점 이하입니다.")
	private Integer kor;
	
	@Min(value=0, message="영어 점수는 0점 이상입니다.")
	@Max(value=100, message="영어 점수는 100점 이하입니다.")
	private Integer eng;
	
	@Min(value=0, message="수학 점수는 0점 이상입니다.")
	@Max(value=100, message="수학 점수는 100점 이하입니다.")
	private Integer math;

	@Min(value=0, message="물리 점수는 0점 이상입니다.")
	@Max(value=100, message="물리 점수는 100점 이하입니다.")
	private Integer phy;

	@Min(value=0, message="화학 점수는 0점 이상입니다.")
	@Max(value=100, message="화학 점수는 100점 이하입니다.")
	private Integer che;
	
	@Min(value=0, message="생물 점수는 0점 이상입니다.")
	@Max(value=100, message="생물 점수는 100점 이하입니다.")
	private Integer bio;

	@Min(value=0, message="음악 점수는 0점 이상입니다.")
	@Max(value=100, message="음악 점수는 100점 이하입니다.")
	private Integer mus;
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getKor() {
		return kor;
	}
	public void setKor(Integer kor) {
		this.kor = kor;
	}
	public Integer getEng() {
		return eng;
	}
	public void setEng(Integer eng) {
		this.eng = eng;
	}
	public Integer getMath() {
		return math;
	}
	public void setMath(Integer math) {
		this.math = math;
	}
	public Integer getPhy() {
		return phy;
	}
	public void setPhy(Integer phy) {
		this.phy = phy;
	}
	public Integer getChe() {
		return che;
	}
	public void setChe(Integer che) {
		this.che = che;
	}
	public Integer getBio() {
		return bio;
	}
	public void setBio(Integer bio) {
		this.bio = bio;
	}
	public Integer getMus() {
		return mus;
	}
	public void setMus(Integer mus) {
		this.mus = mus;
	}
	@Override
	public String toString() {
		return "ScoreForm [no=" + no + ", name=" + name + ", kor=" + kor + ", eng=" + eng + ", math=" + math + ", phy="
				+ phy + ", che=" + che + ", bio=" + bio + ", mus=" + mus + "]";
	}
}
