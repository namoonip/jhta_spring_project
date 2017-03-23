package kr.co.jhta.todo.controller.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.jhta.todo.vo.User;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	// 원하는 작업이 필요한 paths를 xml에 지정
	List<String> paths;
	public void setPaths(List<String> paths) {
		this.paths = paths;
	}
	
	@Override // Controller가 실행되기 전에 실행되는 preHandle Interceptor이다.
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// request.getRequestURI() <-- /todo/complete.do
		// request.getContextPath() <-- /todo		
		String url = request.getRequestURI().replaceFirst(request.getContextPath(), "");
		
		if(paths.contains(url)) {
			HttpSession session = request.getSession(true);
			User user = (User) session.getAttribute("LOGIN_USER");
			if(user != null) {
				// true를 반환할 때만 로그인된 url의 Controller가 실행된다.
				return true;
			} else {
				response.sendRedirect("login.do?error=deny");
				return false;
			}
		} else {
			return true;
		}		
	}
	
}

