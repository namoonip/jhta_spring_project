package kr.co.jhta;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	@Autowired
	MessageSource messageSource;

	@RequestMapping("/home.do")
	public String home(Locale locale, @RequestParam(value="name", 
								required=false, defaultValue="홍길동") String name, Model model) {
		
		String greetingMessage = messageSource.getMessage("welcome.greeting", 
															new Object[]{name}, locale);
		model.addAttribute("message", greetingMessage);
		return "index";
	}
	
	@RequestMapping("/about.do")
	public String about(Model model) {
		model.addAttribute("username", "김유신");
		model.addAttribute("userid", "kimyu");
		return "about";
	}
	
}