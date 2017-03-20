package com.example.aop.sample2;

import org.springframework.context.support.GenericXmlApplicationContext;

import com.example.service.AdminService;
//import com.example.service.Operator;
import com.example.vo.Role;

public class App {
	public static void main(String[] args) {
		String resources = "classpath:/com/example/aop/sample2/bean.xml";
		
		GenericXmlApplicationContext container
			= new GenericXmlApplicationContext(resources);
		
		AdminService service = container.getBean("adminService", AdminService.class);
		
		service.deleteUser("kang", new Role("이순신", "ADMIN"));
		service.deleteUser("hong", new Role("김유신", "USER"));
		
		container.close();
		
//		Operator op = container.getBean("operator", Operator.class);
//		int result1 = op.plus(1, 2);		
//		int result2 = op.divide(10, 0);
	}
}
