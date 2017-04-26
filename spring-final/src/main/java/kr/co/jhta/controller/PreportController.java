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

import kr.co.jhta.service.report.PreportService;
import kr.co.jhta.service.report.StuReportService;
import kr.co.jhta.vo.Preport;
import kr.co.jhta.vo.PreportContent;
import kr.co.jhta.vo.PreportForm;
import kr.co.jhta.vo.Professor;
import kr.co.jhta.vo.stu.Enroll;
import kr.co.jhta.vo.stu.Student;

@Controller
@RequestMapping("/prof/report")
public class PreportController {
	
	@Autowired
	private PreportService preportService;
	
	@Autowired
	private StuReportService stureportService;
	
	@RequestMapping(value="/reportupdate", method=RequestMethod.GET)
	public String reportupdateform(@RequestParam("no") int no,Model model,@Valid @ModelAttribute("reportform")PreportForm reportform, HttpSession session){
		Professor prof = (Professor) session.getAttribute("LOGIN_USER");
		List<Preport> pList = preportService.getProfEnroll(prof.getId());
		model.addAttribute("pList",pList);
		System.out.println(pList);
		Preport pre = preportService.getupdatereport(no);
		model.addAttribute("pre",pre);
		System.out.println(pre);
		return "/report/reportupdate";
	}
	
	@RequestMapping(value="/reportupdate", method=RequestMethod.POST)
	public String reportupdate(@Valid @ModelAttribute("reportform")PreportForm reportform,@RequestParam("no") int no,Errors errors){
		if(errors.hasErrors()){
			System.out.println(errors.getAllErrors());
			return "/prof/reportform";
		}
		Preport preport = new Preport();
		preport.setNo(no);
		Enroll enroll = new Enroll();
		enroll.setNo(reportform.getEnrollno());
		preport.setEnroll(enroll);
		Professor prof1 = new Professor();
		prof1.setNo(reportform.getProfno());
		preport.setProfessor(prof1);
		System.out.println(reportform);
		BeanUtils.copyProperties(reportform, preport);
		System.out.println(preport);
		preportService.getByNoupdate(preport);
		return "redirect:/prof/report/reportinfo";
	}
	
	@RequestMapping(value="/reportform", method=RequestMethod.GET)
	public String reportform(@Valid @ModelAttribute("reportform")PreportForm reportform, Model model, HttpSession session){
		Professor prof = (Professor) session.getAttribute("LOGIN_USER");
		List<Preport> pList = preportService.getProfEnroll(prof.getId());
		model.addAttribute("pList",pList);
		model.addAttribute("prof", prof);
		return "/report/reportform";
	}
	@RequestMapping(value="/reportform", method=RequestMethod.POST)
	public String reportadd(@Valid @ModelAttribute("reportform")PreportForm reportform,Errors errors){
		if(errors.hasErrors()){
			System.out.println(errors.getAllErrors());
			return "/prof/reportform";
		}
	
		Preport preport = new Preport();
		Enroll enroll = new Enroll();
		enroll.setNo(reportform.getEnrollno());
		preport.setEnroll(enroll);
		Professor prof1 = new Professor();
		prof1.setNo(reportform.getProfno());
		preport.setProfessor(prof1);
		System.out.println(reportform);
		
		BeanUtils.copyProperties(reportform, preport);
		preportService.addreport(preport);
		return "redirect:/prof/report/reportinfo";
	}
	
	
	@RequestMapping("/reportinfo")
	public String reportinfo(Model model, HttpSession session){
		Professor prof = (Professor) session.getAttribute("LOGIN_USER");
		List<Preport> pList = preportService.getProftitle(prof.getNo());
		System.out.println(pList);
		model.addAttribute("pList", pList);
		return "/report/reportinfo";
	}
	@RequestMapping("/reportdetail")
	public String reportdetail(@RequestParam("no") int no, Model model){
		
		List<PreportContent> pcont = stureportService.getStuAllReportByEnoService(no);
		model.addAttribute("pcont", pcont);
		
		return "/report/reportdetail";
	}
	
	@RequestMapping(value="/delreport")
	public String delreport(@RequestParam("no") int no){
		
		preportService.deleteReport(no);
		
		return "redirect:/prof/report/reportinfo";
	}
	@RequestMapping(value="/reporttodetail")
	public String reporttodetail(@RequestParam("no")int no, Model model){
			PreportContent profReport = stureportService.getStuAllReportByEno1(no);
			System.out.println(profReport);
			model.addAttribute("profReport", profReport);
			
	
		return "/report/reporttodetail";
	}
}
