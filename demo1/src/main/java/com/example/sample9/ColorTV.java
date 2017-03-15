package com.example.sample9;

public class ColorTV implements TV{	
	@Override
	public void on() {
		System.out.println("컬러 TV On...");
	}
	
	@Override
	public void off() {
		System.out.println("컬러 TV Off...");		
	}
}
