package kr.co.jhta.ex.vo;

import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class BookForm {
	private int no;
	@NotBlank
	@NotNull(message="제목은 필수 입력 값입니다.")
	private String title;
	@NotBlank
	@NotNull(message="저자는 필수 입력 값입니다.")
	private String author;
	@NotBlank
	@NotNull(message="설명은 필수 입력 값입니다.")
	private String description;
	@NotBlank
	@NotNull(message="출판사는 필수 입력 값입니다.")
	private String publisher;
	@NotNull(message="가격은 필수 입력 값입니다.")
	@Min(value=0, message="0원 이상입니다.")
	@Max(value=1000000 , message="1,000,000원 이하만 입력 가능합니다.")
	private int price;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@NotNull(message="날짜는 필수 입력 값입니다.")
	private Date regDate;
	private int quantity;
	private MultipartFile uploadFile;
	@NotNull
	private String category;
	private int sellCount;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getSellCount() {
		return sellCount;
	}
	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}
	
}
