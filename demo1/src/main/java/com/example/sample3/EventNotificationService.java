package com.example.sample3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("eventService")
public class EventNotificationService {
	@Autowired
	SMSService smsService;
	
	public void notice(String message) {
		System.out.println(smsService);
		
		String[] phoneNumbers = {"010-1234-5678", "010-2222-3333", "010-4325-3563"};
		for(String phoneNumber : phoneNumbers) {
			smsService.send(phoneNumber, message);
		}
	}
}
