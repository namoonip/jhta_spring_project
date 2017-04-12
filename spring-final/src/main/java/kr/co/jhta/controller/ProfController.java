package kr.co.jhta.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jhta.service.major.SubjectService;
import kr.co.jhta.service.professor.ProfessorService;
import kr.co.jhta.vo.Professor;
import kr.co.jhta.vo.Subject;
import kr.co.jhta.vo.Syllabusform;

@Controller
public class ProfController {
	
	@Autowired
	private ProfessorService professorService;
	
	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping("/profMain")
	public String testMain() {
		return "/prof/profMain";
	}
	
	@RequestMapping("/syllabus")
	public String syllAbus(Model model){
		
		return "/prof/syllabus";
	}
	@RequestMapping(value="/syllform", method=RequestMethod.GET)
	public String syallForm(Model model){
		List<Professor> proList = professorService.proAllList();
		model.addAttribute("proList", proList);
		List<Subject> subList = subjectService.getAllList();
		model.addAttribute("subList", subList);
		model.addAttribute("syllabusform", new Syllabusform());
		
		return "/prof/syllabusform";
	}
	
	@RequestMapping("/syllinfo")
	public String syllInfo(){
		return "/prof/syllabusInfo";
	}

	
}
