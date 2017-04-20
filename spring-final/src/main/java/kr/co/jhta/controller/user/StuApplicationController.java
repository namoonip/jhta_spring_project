package kr.co.jhta.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jhta.service.appli.LeaveService;
import kr.co.jhta.service.user.ApplicationService;
import kr.co.jhta.service.user.StudentService;
import kr.co.jhta.vo.appli.LeaveForm;
import kr.co.jhta.vo.stu.Student;

@Controller
@RequestMapping("/stud")
public class StuApplicationController {

	@Autowired
	ApplicationService appliService;
	@Autowired
	StudentService stuService;
	@Autowired
	LeaveService leaveService;
	
	@RequestMapping(value="/enrollLeave", method=RequestMethod.POST)
	public String leaveEnroll(Model model, Student student, LeaveForm leaveForm){
		
		return null;
	}
		
		
	@RequestMapping(value="/leave", method=RequestMethod.POST)
	public String stuLeaveProcess(Model model, Student student) {
		
		return null;
	}
	
	
	@RequestMapping(value="/reinstate", method=RequestMethod.POST)
	public String setReinstateProcess(Model model, Student student){
		
		return "/student/applications/ReinstatementForm";
	}

	
	
}
