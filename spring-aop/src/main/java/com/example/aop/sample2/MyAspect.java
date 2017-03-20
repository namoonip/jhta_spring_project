package com.example.aop.sample2;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

import com.example.vo.Role;

@Aspect
public class MyAspect {
	
	// 사용될 서비스를 지정한다(+는 구현체나 인터페이스를 찾을 때 사용된다.).	  매개변수와 role타입만 갖는 것을 찾는다.
	@Around("within(com.example.service.AdminService+) && args(.., role)")
	public Object security(ProceedingJoinPoint jp, Role role) throws Throwable{
		// 메소드의 execution을, 
		// 클래스나 인터페이스는 within을 사용한다.
		// args는 매개변수를 전달받는 메소드만을 사용한다고 정의한다. 구체적인 이유는 
		// 	1."매개변수 2개를 받는다"는 의미.
		// 	2.role이라는 객체만 이 메소드에 사용되도록 하기 위해서. 
		
		System.out.println("[security around advice] role: " 
							+ role.getUsername() + "," + role.getType());
		
		if("ADMIN".equals(role.getType())) {
			// return 값은 반드시 Object형이여야 한다.
			Object returnValue = jp.proceed();
			return returnValue;					
		} else {
			// "ADMIN"이 아닐 때 익셉션을 발생시킨다.
			throw new RuntimeException("권한 부족...");
		}		
	}
	
	
	
	@Around("within(com.example.service.Operator+)") // 리턴값은 반드시 Object를 사용한다.
	public Object profiling(ProceedingJoinPoint jp) throws Throwable {
		
		try {
			// 전처리 ( <-- Before Advice 역할 )
			Object[] args = jp.getArgs();
			System.out.println("[around advice 전처리] 매개변수 값: " + Arrays.toString(args));
			
			// 대상 메소드를 실행하는 코드
			// 대상 메소드의 실행 결과값을 returnValue에 저장한다.
			Object returnValue = jp.proceed();	// 기준이 되는 코드
			// 후처리 ( <-- After Advice 역할 )
			System.out.println("[around advice 후처리] 결과 값: " + returnValue.toString());
			
			// 대상 메소드의 실행 결과값을 반환한다.
			return returnValue;
		} catch (Throwable t) {
			// 예외처리 코드 <-- AfterThorwing Advice 역할
			System.out.println("[around advice 에러처리] 오류메세지: " + t.getMessage());
			System.out.println("[around advice 에러처리] 오류클래스: " + t.getClass().getSimpleName());
			throw t;
		} finally {
			// 무조건 실행 <-- After Advice 
			System.out.println("[around advice] around 공통기능 수행 종료");
		}
	}
}