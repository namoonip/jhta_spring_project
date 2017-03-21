package kr.co.jhta;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SampleController {

	@RequestMapping("/sample.do")
	public String sample() {
		return "sample";	// <--- /WEB-INF/views/sample.jsp로 이동...
	}
	
	@RequestMapping("/list.do")
	public String list(int pno, String sort) { // 단순한 변수명일 경우 파라미터로 본다.
		System.out.println(pno);
		System.out.println(sort);
		return "success";
	}
	
	@RequestMapping("/add.do")
	public String add(ScoreForm scores) {
		System.out.println(scores);
		return "success";
	}
}
