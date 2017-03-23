package kr.co.jhta.todo.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jhta.todo.service.UserService;
import kr.co.jhta.todo.vo.User;
import kr.co.jhta.todo.vo.UserForm;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginform() {
		return "loginform";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(String id, String pwd, HttpSession session) {
		if(StringUtils.isEmpty(id) || StringUtils.isEmpty(pwd)) {
			return "redirect:/login.do?error=invalid";
		}
		
		User user = userService.getLoginUserInfo(id, pwd);
		
		session.setAttribute("LOGIN_USER", user);
		
		return "redirect:/home.do";
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home.do";
	}
	
	// GET방식일 때 실행됨
	@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public String form(Model model) {
		// 유효성 체크를 실패했을 때 값을 저장하고 불러오도록 하기위한 UserForm()객체를 만듬
		model.addAttribute("userform", new UserForm());
		return "registerform";
	}

	// POST방식일 때 실행됨
	// register (@ModelAttribute("userform") @Valid UserForm userform)
	//		- 1. 폼 입력값을 담기 위해서 UserForm 객체를 스프링이 생성
	//		- 2. 생성된 UserForm객체의 변수명과 일치하는 폼 입력값을 지정
	//		- 3. @Valid가 UserForm 객체에 저장된 값에 대한 유효성 체크를 수행한다.
	//			  유효성 체크를 통과하지 못한 항목이 있으면 Errors객체에 에러가 저장된다.
	//		- 4. @ModelAttribute()는 1번에서 생성한 Model에 지정된 이름으로 담는다.
	//			  유효성 체크를 통과하지 못한 경우 입력 폼에 기존 입력값을 담고 있는 UserForm객체를 
	//			 registerform.jsp에게 전달하기 위해서다.
	//				@ModelAttribyte("userform") UserForm userform은
	//				-> model.attribute("userform", userform); 이다.
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String register(@ModelAttribute("userform") @Valid UserForm userform, Errors errors) {
		if(errors.hasErrors()) {
			return "registerform";
		}
		
		User user = new User();
		// 같은 변수명에 값을 넣어줌
		BeanUtils.copyProperties(userform, user);
		
		userService.registerUser(user);
		
		return "redirect:/home.do";
	}
}
