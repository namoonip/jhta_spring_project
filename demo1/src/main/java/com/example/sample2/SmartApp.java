package com.example.sample2;

import org.springframework.context.support.GenericXmlApplicationContext;

public class SmartApp {
	public static void main(String[] args) {
		
		String resource = "classpath:/com/example/sample2/bean.xml";
		
		GenericXmlApplicationContext container
			= new GenericXmlApplicationContext(resource);
		
		SmartPhone p = container.getBean("phone", SmartPhone.class);
		p.call();
		p.disconnect();
		
		SmartTV tv = container.getBean("tv", SmartTV.class);
		tv.display();
		tv.web();
		
		container.close();
	}
}
