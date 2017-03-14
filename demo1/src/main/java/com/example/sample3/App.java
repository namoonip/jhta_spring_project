package com.example.sample3;

import org.springframework.context.support.GenericXmlApplicationContext;

public class App {
	public static void main(String[] args) {
		String resources = "classpath:/com/example/sample3/bean.xml";	
		GenericXmlApplicationContext container = 
				new GenericXmlApplicationContext(resources);	
		EventNotificationService service = 
				(EventNotificationService) container.getBean("eventService", EventNotificationService.class );
		service.notice("닭 먹는 날! 닥치고 닭먹자! 한마리 사면 2마리 더...");
		
		OrderNotificationService orderService = 
				(OrderNotificationService) container.getBean("orderService", OrderNotificationService.class);
		orderService.notify("환영합니다.");
	}
}
