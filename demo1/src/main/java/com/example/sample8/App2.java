package com.example.sample8;

import org.springframework.context.support.GenericXmlApplicationContext;

public class App2 {
	
	public static void main(String[] args) {
		
		String resources = "classpath:/com/example/sample8/bean.xml";
		GenericXmlApplicationContext container
			= new GenericXmlApplicationContext(resources);
		
		// MessageSender가 타입이 하나이므로 class만 불러와 적어주면 된다.
		MessageSenderMap sender = container.getBean(MessageSenderMap.class);
		sender.sendMessage("T", "오늘부터 3일동안 파격세일을 진행합니다.");		
	}
}
