package kr.co.jhta.controller.makeuplesson;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MakeupLessonController {

	//보강화면으로 가기
	@RequestMapping("/makeuplesson.do")
	public String makeupLessonView(){
		
		return "/makeuplesson/makeuplesson";
	}
	
	//보강 리셋
	@RequestMapping("/makeuplecturereset.do")
	public String makeupLessonReset(){
		
		return "redirect:/makeuplesson.do";
	}
	
	
	
}
