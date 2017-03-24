package kr.co.jhta.todo.controller.argumentResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import kr.co.jhta.todo.vo.User;

public class LoginUserArgumentResolver implements HandlerMethodArgumentResolver{
	
	// supportsParameter()의 반환값이 true인 경우 이 argumentReslover를 적용 가능한 타입이다.
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		// parameter의 타입이 User와 같을 때만 true를 반환하도록 함.
		return User.class.isAssignableFrom(parameter.getParameterType());
	}

	// 이 argumentResolver가 적용가능한 타입인 경우
	// resolveArgument()메소드를 실행해서 반환되는 객체를 해당 매개변수에 주입해준다.
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		// HttpSerlvetRequest의 wrapper클래스인 NativeWebRequest를 활용해
		// HttpServletRequest 인터페이스를 객체로 만든다.
		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
		HttpSession session = request.getSession(true);
		
		User user = (User) session.getAttribute("LOGIN_USER");
		if(user == null) {
			user = new User();
		}
		return user;
	}

}

