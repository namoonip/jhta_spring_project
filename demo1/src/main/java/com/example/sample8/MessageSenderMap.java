package com.example.sample8;

import java.util.Map;

public class MessageSenderMap {
	
	/*
	 { 	"sms" : SMSSender,
	 	"talk" : KakaoTalkSender,
	 	"line" : LineSender	 ,
	 	"facebook" : FacebookSender}
	 */
		
	Map<String, Sender> senderMap;
	public void setSenderMap(Map<String, Sender> senderMap) {
		this.senderMap = senderMap;
	}
	
	public void sendMessage(String type, String message) {
		Sender sender = senderMap.get(type);
		sender.send(message);
	}
}
