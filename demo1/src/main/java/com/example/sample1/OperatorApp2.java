package com.example.sample1;

import org.springframework.context.support.GenericXmlApplicationContext;

public class OperatorApp2 {
	public static void main(String[] args) {

		String resource = "classpath:/com/example/sample1/bean.xml";
		
		// 1.스프링 컨테이너를 생성한다.
		// 2. 스프링 Bean 설정 정보를 읽는다.
		// 3. 스프링 빈 설정 파일에 정의된 클래스들을 모두 싱글턴 객체로 미리 생성해 둔다.
		// 빈설정 정보를 로드하기 -> 설정파일에 정의된 클래스를 싱글턴 객체로 생성해 갖고 있는다.
		GenericXmlApplicationContext container
			= new GenericXmlApplicationContext(resource);

		// 스프링 컨테이너에서 필요한 객체를 가져오기
		Operator op = (Operator) container.getBean("o");
		op.plus(40, 60);

		container.close();
	}
}
