package kr.co.jhta.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
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

import kr.co.jhta.service.major.SemesterService;
import kr.co.jhta.service.major.SubjectService;
import kr.co.jhta.service.professor.ProfessorService;
import kr.co.jhta.service.professor.SyllabusService;
import kr.co.jhta.vo.Professor;
import kr.co.jhta.vo.Semester;
import kr.co.jhta.vo.Subject;
import kr.co.jhta.vo.SubjectIsPassed;
import kr.co.jhta.vo.Syllabus;
import kr.co.jhta.vo.Syllabusform;

@Controller
@RequestMapping("/prof")
public class ProfController {
	
	@Autowired
	private ProfessorService professorService;
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private SyllabusService syllabusService;
	
	@Autowired
	private SemesterService semesterService;
	
	@RequestMapping("/home")
	public String testMain() {
		return "/prof/profMain";
	}
	
	@RequestMapping("/syllabus")
	public String syllAbus(@RequestParam("no") int no,Model model, Syllabus syll){
		Syllabus syno = syllabusService.getByNoList(syll.getNo());
		model.addAttribute("syno",syno);
		return "/prof/syllabus";
	}
	@RequestMapping(value="/syllform", method=RequestMethod.GET)
	public String syllForm(Model model, HttpSession session){
		Professor prof = (Professor) session.getAttribute("LOGIN_USER");
		model.addAttribute("prof", prof);
		List<Subject> subList = subjectService.getByProIdList(prof.getId());
		model.addAttribute("subList", subList);
		model.addAttribute("syllabusform", new Syllabusform());
		
		return "/prof/syllabusform";
	}
	@RequestMapping(value="/syllupdate", method=RequestMethod.GET)
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
	
	@RequestMapping(value="/syllupdate", method=RequestMethod.POST)
	public String syllUpdate(@Valid @ModelAttribute("syllabusform")Syllabusform syllform, Errors errors) throws Exception{
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
		syllabusService.updateSyll(syllabus);
		System.out.println(syllabus);
		return "redirect:/prof/syllinfo";
	}
	
	@RequestMapping(value="/syllform", method=RequestMethod.POST)
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
		return "redirect:/prof/syllinfo";
	}
	@RequestMapping("/syllinfo")
	public String syllInfo(Model model, HttpSession session){
		Professor prof = (Professor) session.getAttribute("LOGIN_USER");
		List<Syllabus> syllList = syllabusService.getByProNoList(prof.getId());
		model.addAttribute("syllList", syllList);
		return "/prof/syllabusInfo";
	}
	
	@RequestMapping("/sylldel")
	public String complete(@RequestParam("no") int no, Syllabus syllabus){
		syllabusService.deleteSyll(syllabus.getNo());
		
		
		return "redirect:/prof/syllinfo";
	}
	
	@RequestMapping(value="/addsubform", method=RequestMethod.GET)
	public String addsubform(Model model, HttpSession session){
		Professor prof = (Professor) session.getAttribute("LOGIN_USER");
		model.addAttribute("prof", prof);
		List<SubjectIsPassed> passList = subjectService.getPassAllList();
		model.addAttribute("passList", passList);
		List<Semester> semeList = semesterService.getAllSemester();
		model.addAttribute("semeList", semeList);
		return "/prof/addsubjectform";
	}
	
	
}
