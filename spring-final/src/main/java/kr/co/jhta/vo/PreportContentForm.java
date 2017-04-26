package kr.co.jhta.vo;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import kr.co.jhta.vo.stu.Student;

public class PreportContentForm {
	
	@NotNull
	private int no;
	@NotNull
	private int pfNo;
	private Student student;
	@NotNull
	private String title;
	@NotNull
	private String content;
	private MultipartFile file;
	private MultipartFile file2;
	private MultipartFile file3;
	private MultipartFile file4;
	private MultipartFile file5;
	private String filename;
	private String filename2;
	private String filename3;
	private String filename4;
	private String filename5;
	private int eno;
	private int rno;
	
	public PreportContentForm() {
		
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPfNo() {
		return pfNo;
	}
	public void setPfNo(int pfNo) {
		this.pfNo = pfNo;
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
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public MultipartFile getFile2() {
		return file2;
	}

	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	public MultipartFile getFile3() {
		return file3;
	}

	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}

	public MultipartFile getFile4() {
		return file4;
	}

	public void setFile4(MultipartFile file4) {
		this.file4 = file4;
	}

	public MultipartFile getFile5() {
		return file5;
	}

	public void setFile5(MultipartFile file5) {
		this.file5 = file5;
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
	
	
	
}
