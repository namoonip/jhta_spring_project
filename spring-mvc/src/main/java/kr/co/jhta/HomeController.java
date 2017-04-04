package kr.co.jhta;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller // Controller 어노테이션 추가(scan)
public class HomeController {
	
	@Autowired
	private ExcelView excelView;
	
	@RequestMapping("/xls.do")
	public ModelAndView excel() {
		ModelAndView mav = new ModelAndView();
		mav.setView(excelView);
		mav.addObject("data", new String[] {"Jane", "Adam", "Tayler"});
		
		return mav;
	}
	
	
	@Autowired
	private JsonView jsonView;
	
	@RequestMapping("/data.do")
	public ModelAndView data() {
		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);	
		mav.addObject("data", new int[]{100, 50, 40});
		return mav;
	}
	
	@RequestMapping("/home.do") // 요청 URL을 설정할 수 있다.
	public String home(ModelMap model) {
		
		model.addAttribute("msg", "반갑습니다^^");
		return "home"; // 알아서 View객체에 넣어 반환한다.
	}
	
	// 직접 ModelAndView를 반환한다.
	@RequestMapping("/about.do")
	public ModelAndView about() {
		ModelAndView mav = new ModelAndView();
		
		// ModelAndView객체에 데이터 담기
		mav.addObject("question1","회원가입 과정이 궁금해요.");
		mav.addObject("question2","탈퇴는 어떻게 하나요?");
		mav.addObject("question3","무엇이든 물어보세요...");
		
		// 이동할 뷰페이지 설정하기(jsp 페이지)
		mav.setViewName("about");
		
		return mav;
	}
	
	@RequestMapping("/help.do")
	public String help() {
		return "help";
	}
	
}
