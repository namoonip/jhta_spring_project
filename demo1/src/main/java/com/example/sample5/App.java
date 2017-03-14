package com.example.sample5;

import org.springframework.context.support.GenericXmlApplicationContext;

public class App {
	public static void main(String[] args) {
		String resources = "classpath:/com/example/sample5/bean.xml";
		GenericXmlApplicationContext container 
			= new GenericXmlApplicationContext(resources);
		Reporting report = container.getBean("reporter", Reporting.class);
		report.drawChart();	
		
		container.close();
	}
}
