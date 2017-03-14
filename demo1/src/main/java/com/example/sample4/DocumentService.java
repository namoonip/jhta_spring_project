package com.example.sample4;

import org.springframework.beans.factory.annotation.Autowired;

public class DocumentService {
	
	// Printer 인터페이스를 구현한 객체를 주입해주세요.
	// 따라서 BlackPrinter의 객체가 주입된다.
	@Autowired
	Printer printer;
	
	public void printContent(String content) {
		// Printer인터페이스를 구현한 객체에 재정의된 print()를 실행하는 코드
		printer.print(content);
	}
}
