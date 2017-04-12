package kr.co.jhta.controller.open;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OpenLecture {

	@RequestMapping("/open.do")
	public String openLecture(){
		
		return "openlecture/openlecture";
	}
	
	
	@RequestMapping("/openregister.do")
	public String openLectureRegister(){
		
		return "openlecture/openlectureregister";
	}
	
}
