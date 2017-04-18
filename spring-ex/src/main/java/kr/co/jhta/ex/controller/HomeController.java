package kr.co.jhta.ex.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jhta.ex.model.Member;
import kr.co.jhta.ex.service.EventService;
import kr.co.jhta.ex.service.MemberService;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	EventService eventService;
	
	@RequestMapping("/home.do")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/calendar.do")
	public String calendar(Model model) {
		
		model.addAttribute("members", memberService.getAllMembers());
		
		return "calendar";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "loginform";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(String id, String pwd, HttpSession session) {
		Member member = memberService.login(id, pwd);
		session.setAttribute("LOGIN_MEMBER", member);
		
		return "redirect:/home.do";
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/home.do";
	}
	
}
