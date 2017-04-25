package kr.co.jhta.controller.argumentResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import kr.co.jhta.service.user.StudentService;
import kr.co.jhta.vo.stu.Student;

public class LoginStudArgumentResolver implements HandlerMethodArgumentResolver {

	@Autowired
	StudentService stuService;
	
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return Student.class.isAssignableFrom(parameter.getParameterType());
	}
	
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, 
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		
		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
		HttpSession session = request.getSession(true);
		
		Student student = (Student) session.getAttribute("LOGIN_USER");
		

		String tName = stuService.getTnameByTcodeService(student.getNo(), student.getDivision());
	    String cName = stuService.getCnameByRegisterService(student.getRegister());
	    student.settName(tName);
	    student.setcName(cName);
		
		return student;		
	}

}
