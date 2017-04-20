package kr.co.jhta.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jhta.service.appli.LeaveService;
import kr.co.jhta.service.user.ApplicationService;
import kr.co.jhta.service.user.StudentService;
import kr.co.jhta.vo.appli.Leave;
import kr.co.jhta.vo.stu.Student;

@Controller
@RequestMapping("/stud")
public class StuApplicationFormController {
	
	@Autowired
	ApplicationService appliService;
	
	@Autowired
	StudentService stuService;
	
	@Autowired
	LeaveService leaveService;
	
	@RequestMapping(value="/leave", method=RequestMethod.GET)
	public String stuLeave(Model model, Student student) {
		if(student.getName() == null) {
			return "redirect:/login?err=deny";
		}
		
		// 기본 정보 담기
		model.addAttribute("student", student);
		String tName = stuService.getTnameByTcodeService(student.getDivision());
		model.addAttribute("tName", tName);
		String cName = stuService.getCnameByRegisterService(student.getRegister());
		model.addAttribute("cName", cName);
		List<Leave> leaveList = leaveService.getAllEnrolledLeaveByStuNoService(student.getNo());
		model.addAttribute("leaveList", leaveList);
		
		// 휴학 정보 담기
		
		
		return "/student/applications/leaveForm";
	}
		
	@RequestMapping(value="/reinstate", method=RequestMethod.GET)
	public String setReinstate(Model model, Student student){
		
		// 기본 정보 담기
		model.addAttribute("student", student);
		String tName = stuService.getTnameByTcodeService(student.getDivision());
		model.addAttribute("tName", tName);
		String cName = stuService.getCnameByRegisterService(student.getRegister());
		model.addAttribute("cName", cName);
		
		return "/student/applications/ReinstatementForm";
	}

}
