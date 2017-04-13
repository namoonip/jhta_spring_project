package kr.co.jhta.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jhta.service.professor.ProfessorService;
import kr.co.jhta.vo.LoginForm;
import kr.co.jhta.vo.Professor;


@Controller
public class LoginController {
	
	@Autowired
	private ProfessorService professorService;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginform(){
		return "login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String loginprocess(LoginForm loginForm,HttpSession session){
		Professor prof = professorService.loginByProfessor(loginForm);
		if(prof == null){
			return "redirect:/login?err=fail";
		}
		session.setAttribute("LOGIN_PROF", prof);
		return "redirect:/home";
	}
		
	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/login?message=logout";
	}
	
	

}
