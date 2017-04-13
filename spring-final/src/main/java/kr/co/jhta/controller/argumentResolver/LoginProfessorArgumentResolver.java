package kr.co.jhta.controller.argumentResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import kr.co.jhta.vo.Professor;

public class LoginProfessorArgumentResolver implements HandlerMethodArgumentResolver{

	// parameter가 유저일 때만 실행되는 코드입력
	// supportsParameter()의 반환값이 true인 경우 이 argumentResolver를 적용가능한 타입이다. 
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return Professor.class.isAssignableFrom(parameter.getParameterType());
	}

	// 핸들러 메소드의 매개변수가 이 argumentResolver를 적용할 수 있는 타입인 경우 
	// resolverArgument()메소드를 실행해서 반환되는 객체를 
	// 해당 매개변수에 주입해준다. 
	
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		
		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
		HttpSession session  = request.getSession(true);
		
		Professor user = (Professor) session.getAttribute("LOGIN_PROF");
		if (user == null) {
			user = new Professor();
		}
		return user;
	}
}
