package com.example.sample8;

public class LineSender implements Sender{
	
	@Override
	public void send(String message) {
		System.out.println("[라인 발송]" + message);
	}
}

