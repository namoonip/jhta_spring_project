package com.example.sample9;

public class BlackTV implements TV{
	@Override
	public void on() {
		System.out.println("흑백 TV On...");
	}
	
	@Override
	public void off() {
		System.out.println("흑백 TV Off...");		
	}
}
