package com.example;

import java.util.List;

import org.springframework.context.support.GenericXmlApplicationContext;

import com.example.vo.User;
import com.example.dao.UserDao;

public class App {
	public static void main(String[] args) {
		
		String resources = "classpath:/META-INF/spring/applicationContext.xml";
		GenericXmlApplicationContext container
			=	new GenericXmlApplicationContext(resources);
		
		UserDao dao = container.getBean("userDao", UserDao.class);
//		dao.deleteAllUser();
		
		User user1 = new User(1,"홍길동","010-1111-2222","hong@gmail.com");
		User user2 = new User(2,"이순신","010-7777-8888","yee@naver.com");
		User user3 = new User(3,"강감찬","010-1234-5678","kang@daum.com");
		
//		dao.addNewUser(user1);
//		dao.addNewUser(user2);
//		dao.addNewUser(user3);
		
		List<User> users = dao.getAllUser();
		for (User user : users) {
			System.out.println(user.getId() + ":" + user.getName());
		}
		
		User user = dao.getUserById(1);
		System.out.println(user.getId() + ", " + user.getName());
		
	}
}
