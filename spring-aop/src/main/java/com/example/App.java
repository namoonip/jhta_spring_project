package com.example;

import org.springframework.context.support.GenericXmlApplicationContext;

public class App {
	public static void main(String[] args) {
		String resources = "classpath:/com/example/bean.xml";
		
		GenericXmlApplicationContext container 
			= new GenericXmlApplicationContext(resources);
		
		// MemeberServiceImple로 저장을 했지만 MemberService타입이므로 MemberService에 넣는다.
		MemberService service = container.getBean("service", MemberService.class);
		service.addNewMemeber("홍길동");		
	}
}
