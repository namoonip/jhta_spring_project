package kr.co.jhta.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.service.major.SubjectService;
import kr.co.jhta.service.professor.ProfessorService;
import kr.co.jhta.service.professor.SyllabusService;
import kr.co.jhta.vo.Professor;
import kr.co.jhta.vo.Subject;
import kr.co.jhta.vo.Syllabus;
import kr.co.jhta.vo.Syllabusform;

@Controller
public class ProfController {
	
	@Autowired
	private ProfessorService professorService;
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private SyllabusService syllabusService;
	
	@RequestMapping("/prof/home")
	public String testMain() {
		return "/prof/profMain";
	}
	
	@RequestMapping("/prof/syllabus")
	public String syllAbus(@RequestParam("no") int no,Model model, Syllabus syll){
		Syllabus syno = syllabusService.getByNoList(syll.getNo());
		model.addAttribute("syno",syno);
		return "/prof/syllabus";
	}
	@RequestMapping(value="/prof/syllform", method=RequestMethod.GET)
	public String syllForm(Model model){
		List<Professor> proList = professorService.proAllList();
		model.addAttribute("proList", proList);
		List<Subject> subList = subjectService.getAllList();
		model.addAttribute("subList", subList);
		model.addAttribute("syllabusform", new Syllabusform());
		
		return "/prof/syllabusform";
	}
	@RequestMapping(value="/prof/syllupdate", method=RequestMethod.GET)
	public String syllUpForm(@RequestParam("no") int no,Model model, Syllabus syll){
		Syllabus syno = syllabusService.getByNoList(syll.getNo());
		model.addAttribute("syno", syno);
		List<Professor> proList = professorService.proAllList();
		model.addAttribute("proList", proList);
		List<Subject> subList = subjectService.getAllList();
		model.addAttribute("subList", subList);
		model.addAttribute("syllabusform", new Syllabusform());
		
		
		return "/prof/syllupdate";
	}
	
	@RequestMapping(value="/prof/syllform", method=RequestMethod.POST)
	public String addNewSyll(@Valid @ModelAttribute("syllabusform")Syllabusform syllform, Errors errors) throws Exception{
		
		System.out.println(syllform);
		if(errors.hasErrors()){
			System.out.println(errors.getAllErrors());
			return "/prof/syllabusform";
		}
		Syllabus syllabus = new Syllabus();
		Subject subject = new Subject();
		subject.setNo(syllform.getSubno());
		syllabus.setSubject(subject);
		Professor prof = new Professor();
		prof.setId(syllform.getId());
		syllabus.setProfessor(prof);
		BeanUtils.copyProperties(syllform, syllabus);
		syllabusService.addNewSyll(syllabus);
		return "redirect:/syllinfo";
	}
	@RequestMapping("/prof/syllinfo")
	public String syllInfo(Model model){
		List<Syllabus> syllList = syllabusService.getAllList();
		model.addAttribute("syllList", syllList);
		return "/prof/syllabusInfo";
	}
	
	
}
