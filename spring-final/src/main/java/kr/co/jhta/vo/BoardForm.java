package kr.co.jhta.vo;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class BoardForm {
	@NotBlank
	private String title;
	@NotBlank
	private String contents;
	
	private String category;
	
	private String fileName;
	
	private int subjectSelect;
	
	private MultipartFile attachFile;
	
	
	
	public int getSubjectSelect() {
		return subjectSelect;
	}
	public void setSubjectSelect(int subjectSelect) {
		this.subjectSelect = subjectSelect;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public MultipartFile getAttachFile() {
		return attachFile;
	}
	public void setAttachFile(MultipartFile attachFile) {
		this.attachFile = attachFile;
	}
	@Override
	public String toString() {
		return "BoardForm [title=" + title + ", contents=" + contents + ", category=" + category + ", fileName="
				+ fileName + ", subjectSelect=" + subjectSelect + ", attachFile=" + attachFile + "]";
	}
	
	
	
	
}
