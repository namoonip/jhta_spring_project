package kr.co.jhta.controller.major;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jhta.service.major.SemesterService;
import kr.co.jhta.vo.SemesterForm;

@Controller
public class SemesterController {

	@Autowired
	private SemesterService semesterService;
	
	@RequestMapping("/semester")
	public String semesterMain() {
		return "/major/semesterList";
	}
	
	@RequestMapping("addSemester")
	public String semeform() {
		//model.addAttribute("semeform", new SemesterForm());
		return "major/semeRegister";
	}
	
	//@RequestMapping(value="/semeregister", method=RequestMethod.POST)
	//public String register(@Valid @ModelAttribute("semeform") SemesterForm semeform, Error errors) {
	//	return "redirect:/semester";
	//}
	
	
}
