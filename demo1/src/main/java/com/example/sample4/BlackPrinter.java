package com.example.sample4;

public class BlackPrinter implements Printer{
	@Override
	public void print(String text) {
		System.out.println("[흑백 출력]" + text);
	}
}
